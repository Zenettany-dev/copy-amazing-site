import { Component, HostListener, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Auth } from '../../services/auth';

@Component({
  selector: 'app-auth-modal',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './auth-modal.html',
  styleUrl: './auth-modal.scss'
})
export class AuthModal implements OnInit {
  chars = [
    '/auth/modality-char-1.png',
    '/auth/modality-char-2.png',
    '/auth/modality-char-3.png',
    '/auth/modality-char-4.png',
    '/auth/modality-char-5.png'
  ];
  charSrc = this.chars[0];

  servers = [
    { name: 'RED', color: 'rgb(220, 45, 34)' },
    { name: 'YELLOW', color: 'rgb(234, 173, 57)' },
    { name: 'GREEN', color: 'rgb(60, 183, 91)' },
    { name: 'AZURE', color: 'rgb(70, 75, 250)' },
    { name: 'SILVER', color: 'rgb(158, 158, 158)' },
    { name: 'ROSE', color: 'rgb(255, 109, 198)' },
    { name: 'BLACK', color: 'rgb(0, 0, 0)' },
    { name: 'SKY', color: 'rgb(59, 199, 232)' },
    { name: 'TITAN', color: 'rgb(113, 54, 138)' },
    { name: 'X', color: 'rgb(162, 16, 71)' },
    { name: 'FIRE', color: 'rgb(255, 104, 16)' },
    { name: 'LIME', color: 'rgb(194, 255, 66)' }
  ];

  serverOpen = false;
  selectedServer: { name: string; color: string } | null = null;
  name = '';
  password = '';
  privacy = false;
  loading = false;
  error = '';

  constructor(public auth: Auth) {}

  ngOnInit() {
    this.charSrc = this.chars[Math.floor(Math.random() * this.chars.length)];
  }

  get open() {
    return this.auth.modalOpen();
  }

  close() {
    this.auth.closeModal();
    this.serverOpen = false;
    this.error = '';
  }

  selectServer(s: { name: string; color: string }) {
    this.selectedServer = s;
    this.serverOpen = false;
  }

  async submit() {
    this.error = '';
    if (!this.selectedServer) {
      this.error = 'Выберите сервер';
      return;
    }
    if (!this.name.trim() || !this.password) {
      this.error = 'Заполните ник и пароль';
      return;
    }
    if (!this.privacy) {
      this.error = 'Нужно согласие на обработку данных';
      return;
    }

    this.loading = true;
    try {
      await this.auth.login(this.name.trim(), this.password, this.selectedServer.name);
    } catch (e: any) {
      this.error = e?.message || 'Ошибка входа';
    } finally {
      this.loading = false;
    }
  }

  @HostListener('document:keydown.escape')
  onEsc() {
    if (this.open) this.close();
  }
}