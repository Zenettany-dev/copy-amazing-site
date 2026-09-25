import express from 'express';
import cors from 'cors';
import mysql from 'mysql2/promise';
import crypto from 'crypto';
import dotenv from 'dotenv';

dotenv.config();

const app = express();

app.use(cors({
  origin: true,
  credentials: true
}));

app.use(express.json());

const pool = mysql.createPool({
  host: process.env.DB_HOST || '127.0.0.1',
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10
});

function md5(str: string) {
  return crypto.createHash('md5').update(str).digest('hex');
}

app.get('/api/health', async (_req, res) => {
  const started = Date.now();

  try {
    await pool.query('SELECT 1');

    res.json({
      ok: true,
      api: 'up',
      db: 'up',
      latencyMs: Date.now() - started,
      time: new Date().toISOString()
    });
  } catch (e: any) {
    res.status(500).json({
      ok: false,
      api: 'up',
      db: 'down',
      error: e?.message || 'db error',
      latencyMs: Date.now() - started,
      time: new Date().toISOString()
    });
  }
});

app.get('/api/monitor', async (_req, res) => {
  const started = Date.now();

  const info: any = {
    ok: true,
    api: 'up',
    time: new Date().toISOString(),
    env: {
      host: process.env.DB_HOST,
      database: process.env.DB_NAME,
      user: process.env.DB_USER
    }
  };

  try {
    await pool.query('SELECT 1 AS ok');

    info.db = 'up';

    const [tables] = await pool.query('SHOW TABLES');

    info.tables = (tables as any[]).map(
      (row) => Object.values(row)[0]
    );

    const checks: Record<string, any> = {};

    for (const table of [
      'accounts',
      'cars',
      'houses',
      'fractions'
    ]) {
      try {
        const [count] = await pool.query(
          `SELECT COUNT(*) AS c FROM \`${table}\``
        );

        checks[table] = {
          ok: true,
          count: (count as any[])[0].c
        };
      } catch (e: any) {
        checks[table] = {
          ok: false,
          error: e.message
        };
      }
    }

    info.tablesCheck = checks;
    info.latencyMs = Date.now() - started;

    res.json(info);
  } catch (e: any) {
    info.ok = false;
    info.db = 'down';
    info.error = e?.message;
    info.latencyMs = Date.now() - started;

    res.status(500).json(info);
  }
});

app.post('/api/auth/login', async (req, res) => {
  try {
    const {
      name,
      password,
      server
    } = req.body || {};

    if (!name || !password) {
      return res.status(400).json({
        ok: false,
        message: 'Заполните ник и пароль'
      });
    }

    const [rows] = await pool.query(
      `
      SELECT id, name
      FROM accounts
      WHERE name = ?
        AND password = ?
      LIMIT 1
      `,
      [
        name,
        md5(password)
      ]
    );

    const list = rows as any[];

    if (!list.length) {
      return res.status(401).json({
        ok: false,
        message: 'Неверный ник или пароль'
      });
    }

    const user = list[0];

    res.json({
      ok: true,
      user: {
        id: user.id,
        name: user.name,
        server: server || null,
        displayName: server
          ? `${user.name} [${server}]`
          : user.name,
        avatar: '/pages/avatar-placeholder.png'
      }
    });
  } catch (e) {
    console.error('LOGIN ERROR:', e);

    res.status(500).json({
      ok: false,
      message: 'Ошибка сервера'
    });
  }
});

app.get('/api/account/:name', async (req, res) => {
  try {
    const name = req.params.name;

    const [rows] = await pool.query(
      `
      SELECT
        id,
        name,
        level,
        exp,
        cash,
        bank,
        fraction,
        wanted,
        skin,
        donate
      FROM accounts
      WHERE name = ?
      LIMIT 1
      `,
      [name]
    );

    const list = rows as any[];

    if (!list.length) {
      return res.status(404).json({
        ok: false,
        message: 'Не найден'
      });
    }

    const acc = list[0];

    const [cars] = await pool.query(
      `
      SELECT
        model,
        number,
        region,
        fuel
      FROM cars
      WHERE owner_id = ?
      `,
      [acc.id]
    );

    const [houses] = await pool.query(
      `
      SELECT
        id,
        owner_id,
        price,
        class,
       \'lock'\,
        hours,
        pay
      FROM houses
      WHERE owner_id = ?
      LIMIT 1
      `,
      [acc.id]
    );

    let fractionName: string | null = null;

    if (acc.fraction && Number(acc.fraction) > 0) {
      const [fractions] = await pool.query(
        `
        SELECT fraction_name
        FROM fractions
        WHERE id = ?
        LIMIT 1
        `,
        [acc.fraction]
      );

      const fractionList = fractions as any[];

      if (fractionList.length) {
        fractionName = fractionList[0].fraction_name;
      }
    }

    res.json({
      ok: true,

      account: {
        id: acc.id,
        name: acc.name,
        level: acc.level ?? 0,
        exp: acc.exp ?? 0,
        cash: Number(acc.cash) || 0,
        bank: Number(acc.bank) || 0,
        fraction: Number(acc.fraction) || 0,
        fractionName,
        wanted: Number(acc.wanted) || 0,
        skin: acc.skin ?? 0,
        donate: Number(acc.donate) || 0
      },

      cars: cars || [],

      house: (houses as any[])[0] || null
    });
  } catch (e) {
    console.error('ACCOUNT ERROR:', e);

    res.status(500).json({
      ok: false,
      message: 'Ошибка сервера'
    });
  }
});

const port = Number(process.env.PORT) || 3001;

app.listen(port, () => {
  console.log(
    `WMAZING API → http://127.0.0.1:${port}`
  );
});
