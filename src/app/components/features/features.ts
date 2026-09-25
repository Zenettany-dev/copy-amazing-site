import { Component, OnInit, OnDestroy, ChangeDetectorRef } from '@angular/core';

interface Feature {
  icon: string;
  color: string;
  title: string;
  text: string;
  image: string;
}

@Component({
  selector: 'app-features',
  standalone: true,
  imports: [],
  templateUrl: './features.html',
  styleUrl: './features.scss'
})
export class Features implements OnInit, OnDestroy {
  features: Feature[] = [
    {
      icon: 'kremlin.svg',
      color: 'rgb(74, 118, 185)',
      title: 'ИГРА ПРО ТВОЙ РАЙОН',
      text: 'Те самые дворы и знакомые панельки. Открытый мир и множество развлечений',
      image: 'cities-and-cars.jpg'
    },
    {
      icon: 'hd.svg',
      color: 'rgb(185, 74, 183)',
      title: 'СОВРЕМЕННАЯ ОНЛАЙН-ИГРА',
      text: 'Игра запустится даже на ноутбуке и слабом ПК. Играй с друзьями или находи новых',
      image: 'graphics.jpg'
    },
    {
      icon: 'microphone.svg',
      color: 'rgb(246, 106, 54)',
      title: 'ГОЛОСОВОЙ ЧАТ',
      text: 'В игре больше 90% игроков общаются в голосовом чате. Атмосфера, которой больше нигде нет',
      image: 'voice-chat.jpg'
    },
    {
      icon: 'atmosphere.svg',
      color: 'rgb(240, 164, 0)',
      title: 'ВЫСОКИЙ ОНЛАЙН',
      text: 'Более 67 000 уникальных игроков в сутки. С 2015 года мы становимся только больше и лучше',
      image: 'atmosphere.jpg'
    },
    {
      icon: 'handshake.svg',
      color: 'rgb(231, 72, 40)',
      title: 'УДИВИТЕЛЬНАЯ АТМОСФЕРА',
      text: 'Игроки разных стран, в том числе СНГ, собрались в одной игре',
      image: 'different-country.jpg'
    },
    {
      icon: '16+.svg',
      color: 'rgb(84, 165, 84)',
      title: 'ВЗРОСЛАЯ АУДИТОРИЯ',
      text: 'Большинство игроков старше 17 лет. Администрация строго наказывает игроков, которые мешают нормально играть',
      image: 'audience.jpg'
    }
  ];

  currentIndex = 0;
  circumference = 2 * Math.PI * 15.5;
  dashOffset = this.circumference;

  private rafId: number | null = null;
  private startTime = 0;
  private readonly DURATION = 6000;
  private running = false;

  constructor(private cdr: ChangeDetectorRef) {}

  get current() {
    return this.features[this.currentIndex];
  }

  ngOnInit() {
    this.startProgress();
  }

  ngOnDestroy() {
    this.stopProgress();
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.features.length;
    this.restartProgress();
  }

  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.features.length) % this.features.length;
    this.restartProgress();
  }

  private startProgress() {
    this.stopProgress();
    this.dashOffset = this.circumference;
    this.startTime = performance.now();
    this.running = true;
    this.cdr.markForCheck();

    const tick = (now: number) => {
      if (!this.running) return;

      const elapsed = now - this.startTime;
      const progress = Math.min(elapsed / this.DURATION, 1);

      this.dashOffset = this.circumference * (1 - progress);
      this.cdr.detectChanges();

      if (progress < 1) {
        this.rafId = requestAnimationFrame(tick);
      } else {
        this.running = false;
        this.next();
      }
    };

    this.rafId = requestAnimationFrame(tick);
  }

  private stopProgress() {
    this.running = false;
    if (this.rafId !== null) {
      cancelAnimationFrame(this.rafId);
      this.rafId = null;
    }
  }

  private restartProgress() {
    this.stopProgress();
    this.startProgress();
  }
}