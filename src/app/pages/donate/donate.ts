import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-donate',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './donate.html',
  styleUrl: './donate.scss'
})
export class Donate {
  showX2 = false;
  hoveredPack: number | null = null;
  selectedPack: number | null = null;
  amount: number | null = null;
  agreed = false;
  serverOpen = false;
  showTooltip = false;
  progress = 0;
  selectedServer: any = null;
  lineItems = [1, 2, 3, 4, 5, 6, 7, 8];

  packs = [
    {
      id: 1,
      title: 'Быстрый старт',
      amz: 350,
      price: 350,
      image: 'pack-bg-1.png',
      bonus: null as number | null,
      bonusColor: '',
      description: 'Базовый набор для старта — хватит на связь, еду, права и аренду транспорта'
    },
    {
      id: 2,
      title: 'Первый руль',
      amz: 650,
      price: 650,
      image: 'pack-bg-2.png',
      bonus: null as number | null,
      bonusColor: '',
      description: 'В начале игры хватит на свой личный, недорогой, но хороший автомобиль и покроет начальные расходы'
    },
    {
      id: 3,
      title: 'Городской житель',
      amz: 1260,
      price: 1200,
      image: 'pack-bg-3.png',
      bonus: 5,
      bonusColor: '#F97422',
      description: 'Хватит на квартиру, комфортный автомобиль и одежду, чтобы чувствовать себя уверенно'
    },
    {
      id: 4,
      title: 'Карьерист',
      amz: 1980,
      price: 1800,
      image: 'pack-bg-4.png',
      bonus: 10,
      bonusColor: '#3fa953',
      description: 'Максимальный старт для серьёзной игры'
    }
  ];

  bonuses = [
    { percent: 5, from: 1000, total: 1050, color: 'linear-gradient(90deg, #f97316, #fb923c)' },
    { percent: 10, from: 1500, total: 1650, color: 'linear-gradient(90deg, #6366f1, #818cf8)' },
    { percent: 15, from: 2000, total: 2300, color: 'linear-gradient(90deg, #a855f7, #c084fc)' },
    { percent: 20, from: 2500, total: 3000, color: 'linear-gradient(90deg, #22c55e, #4ade80)' }
  ];

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

  selectPack(pack: any) {
    this.selectedPack = pack.id;
    this.amount = pack.price;
    this.updateProgress();
  }

  selectServer(s: any) {
    this.selectedServer = s;
    this.serverOpen = false;
  }

  updateProgress() {
    const val = this.amount || 0;

    if (val <= 0) {
      this.progress = 0;
    } else if (val < 1000) {
      this.progress = (val / 1000) * 20;
    } else if (val < 1500) {
      this.progress = 20 + ((val - 1000) / 500) * 20;
    } else if (val < 2000) {
      this.progress = 40 + ((val - 1500) / 500) * 20;
    } else if (val < 2500) {
      this.progress = 60 + ((val - 2000) / 500) * 20;
    } else if (val < 15000) {
      this.progress = 80 + ((val - 2500) / 12500) * 20;
    } else {
      this.progress = 100;
    }
  }
}