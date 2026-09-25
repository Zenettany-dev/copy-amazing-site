import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Auth } from '../../services/auth';
import { getVehicleName, SERVER_NUM } from '../../core/utils/vehicles';
import { Header } from '../../components/header/header';
import { Footer } from '../../components/footer/footer';

interface CarRow {
  model: number;
  number: string | null;
  region: string | null;
  fuel: number;
}

@Component({
  selector: 'app-cabinet',
  standalone: true,
  imports: [CommonModule, RouterLink, Header, Footer],
  templateUrl: './cabinet.html',
  styleUrl: './cabinet.scss'
})
export class Cabinet implements OnInit {
  tab = 'character';
  loading = true;
  error = '';

  account: any = null;
  cars: CarRow[] = [];
  house: { hPrice?: number } | null = null;

  transportOpen = false;
  avatarOpen = false;

  avatars = [
    { id: 0, src: '/pages/avatar-placeholder.png', label: 'Не выбран' },
    { id: 1, src: '/profile/m-blue-gop.jpg', label: 'Мелочь есть?' },
    { id: 2, src: '/profile/m-blue-police.jpg', label: 'Здравия желаю' },
    { id: 3, src: '/profile/m-brown-mil.jpg', label: 'Тук-тук-тук' },
    { id: 4, src: '/profile/m-purple-business.jpg', label: 'Вопросики обкашлять' },
    { id: 5, src: '/profile/w-blue-medic.jpg', label: 'Как комарик укусит' },
    { id: 6, src: '/profile/w-brown-winter.jpg', label: 'Зима близко' },
    { id: 7, src: '/profile/w-red-money.jpg', label: 'Всё просто' },
    { id: 8, src: '/profile/w-red-magic.jpg', label: 'Беги, злодей' },
    { id: 9, src: '/profile/w-blue-drink.jpg', label: 'Всё сложно' }
  ];

  selectedAvatar = '/pages/avatar-placeholder.png';

  private api = '/api';

  constructor(
    public auth: Auth,
    private http: HttpClient,
    private router: Router
  ) {}

  ngOnInit() {
    const u = this.auth.user();
    if (!u) {
      this.auth.openModal();
      this.router.navigateByUrl('/');
      return;
    }
    this.selectedAvatar = u.avatar || '/pages/avatar-placeholder.png';
    this.load(u.name);
  }

  get serverNum(): number {
    const s = this.auth.user()?.server;
    return s ? SERVER_NUM[s] || 0 : 0;
  }

  get totalMoney(): string {
    if (!this.account) return '0';
    const sum = (this.account.cash || 0) + (this.account.bank || 0);
    return sum.toLocaleString('ru-RU') + ' рублей';
  }

  get vehicleLabel(): string {
    if (!this.cars.length) return 'Нет';
    return '';
  }

  vehicleName(model: number) {
    return getVehicleName(Number(model));
  }

  plate(car: CarRow) {
    if (!car.number) return 'Не установлен';
    const reg = car.region ? ` ${car.region}` : '';
    return `${car.number}${reg}`;
  }

  load(name: string) {
    this.loading = true;
    this.http.get<any>(`${this.api}/account/${encodeURIComponent(name)}`).subscribe({
      next: (res) => {
        if (!res.ok) {
          this.error = res.message || 'Ошибка';
          this.loading = false;
          return;
        }
        this.account = res.account;
        this.cars = res.cars || [];
        this.house = res.house;
        this.loading = false;
      },
      error: () => {
        this.error = 'Не удалось загрузить данные';
        this.loading = false;
      }
    });
  }

  openAvatar() {
    this.avatarOpen = true;
  }

  pickAvatar(src: string) {
    this.selectedAvatar = src;
    const u = this.auth.user();
    if (u) {
      const updated = { ...u, avatar: src };
      this.auth.switchTo(updated);
    }
    this.avatarOpen = false;
  }

  closeAvatar() {
    this.avatarOpen = false;
  }

  formatPrice(n: number) {
    return (n || 0).toLocaleString('ru-RU') + ' руб.';
  }
}