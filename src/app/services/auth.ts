import { Injectable, signal } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { firstValueFrom } from 'rxjs';

export interface AuthUser {
  id: number | string;
  name: string;
  server: string | null;
  displayName: string;
  avatar: string | null;
}

const STORAGE_KEY = 'wmazing_auth';
const ACCOUNTS_KEY = 'wmazing_auth_accounts';
const API = '/api';

@Injectable({ providedIn: 'root' })
export class Auth {
  readonly user = signal<AuthUser | null>(this.read());
  readonly accounts = signal<AuthUser[]>(this.readAccounts());
  readonly modalOpen = signal(false);

  constructor(private http: HttpClient) {
    const u = this.user();
    const list = this.accounts();
    if (u && !list.some((a) => a.name === u.name && a.server === u.server)) {
      this.writeAccounts([u, ...list].slice(0, 4));
    }
  }

  private read(): AuthUser | null {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      return raw ? JSON.parse(raw) : null;
    } catch {
      return null;
    }
  }

  private readAccounts(): AuthUser[] {
    try {
      const raw = localStorage.getItem(ACCOUNTS_KEY);
      return raw ? JSON.parse(raw) : [];
    } catch {
      return [];
    }
  }

  private writeAccounts(list: AuthUser[]) {
    localStorage.setItem(ACCOUNTS_KEY, JSON.stringify(list));
    this.accounts.set([...list]);
  }

  private write(u: AuthUser | null) {
    if (u) {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(u));
      const list = this.accounts().filter(
        (a) => !(a.name === u.name && a.server === u.server)
      );
      list.unshift(u);
      this.writeAccounts(list.slice(0, 4));
      this.user.set(u);
    } else {
      localStorage.removeItem(STORAGE_KEY);
      this.user.set(null);
    }
  }

  openModal() {
    this.modalOpen.set(true);
  }

  closeModal() {
    this.modalOpen.set(false);
  }

  async login(name: string, password: string, server: string | null) {
    const res = await firstValueFrom(
      this.http.post<{ ok: boolean; message?: string; user?: AuthUser }>(`${API}/auth/login`, {
        name,
        password,
        server
      })
    );
    if (!res.ok || !res.user) {
      throw new Error(res.message || 'Ошибка входа');
    }
    const user: AuthUser = {
      ...res.user,
      avatar: res.user.avatar || '/pages/avatar-placeholder.png',
      displayName: server ? `${res.user.name} [${server}]` : res.user.name,
      server
    };
    this.write(user);
    this.closeModal();
    return user;
  }

  switchTo(u: AuthUser) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(u));
    this.user.set(u);
    const list = this.accounts().filter(
      (a) => !(a.name === u.name && a.server === u.server)
    );
    list.unshift(u);
    this.writeAccounts(list.slice(0, 4));
  }

  logout() {
    const current = this.user();
    if (!current) {
      this.write(null);
      return;
    }
    const rest = this.accounts().filter(
      (a) => !(a.name === current.name && a.server === current.server)
    );
    this.writeAccounts(rest);
    if (rest.length) {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(rest[0]));
      this.user.set(rest[0]);
    } else {
      localStorage.removeItem(STORAGE_KEY);
      this.user.set(null);
    }
  }

  shortName(u: AuthUser) {
    const n = u.name || '';
    if (n.length <= 12) return n;
    return n.slice(0, 10) + '…';
  }
}