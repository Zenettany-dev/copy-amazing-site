import { Component, ElementRef, ViewChild, AfterViewInit, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-gallery',
  standalone: true,
  imports: [],
  templateUrl: './gallery.html',
  styleUrl: './gallery.scss'
})
export class Gallery implements AfterViewInit, OnDestroy {
  @ViewChild('wrapper') wrapper!: ElementRef<HTMLElement>;
  @ViewChild('track') track!: ElementRef<HTMLElement>;

  private base1 = [
    'game_online_2_thumbnail_496.webp',
    'game2.webp',
    'game7.webp',
    'game10.webp',
    'game12.webp',
    'game17.webp'
  ];

  private base2 = [
    'game18.webp',
    'game21.webp',
    'game22.webp',
    'game24.webp',
    'game25.webp',
    'game26.webp'
  ];

  private base3 = [
    'game27.webp',
    'game28.webp',
    'game29.webp',
    'game_online_2_thumbnail_496.webp',
    'game2.webp',
    'game7.webp'
  ];

  row1 = [...this.base1, ...this.base1, ...this.base1, ...this.base1];
  row2 = [...this.base2, ...this.base2, ...this.base2, ...this.base2];
  row3 = [...this.base3, ...this.base3, ...this.base3, ...this.base3];

  private isDown = false;
  private startX = 0;

  ngAfterViewInit() {
    const el = this.wrapper.nativeElement;
    el.addEventListener('mousedown', this.onMouseDown);
    el.addEventListener('mouseleave', this.onMouseLeave);
    el.addEventListener('mouseup', this.onMouseUp);
    el.addEventListener('mousemove', this.onMouseMove);
  }

  ngOnDestroy() {
    const el = this.wrapper?.nativeElement;
    if (!el) return;
    el.removeEventListener('mousedown', this.onMouseDown);
    el.removeEventListener('mouseleave', this.onMouseLeave);
    el.removeEventListener('mouseup', this.onMouseUp);
    el.removeEventListener('mousemove', this.onMouseMove);
  }

  private onMouseDown = (e: MouseEvent) => {
    this.isDown = true;
    this.startX = e.pageX;
    this.wrapper.nativeElement.style.cursor = 'grabbing';
    this.track.nativeElement.querySelectorAll('.gallery-row').forEach((row: any) => {
      row.style.animationPlayState = 'paused';
    });
  };

  private onMouseLeave = () => {
    this.isDown = false;
    this.wrapper.nativeElement.style.cursor = 'grab';
    this.resumeAnimation();
  };

  private onMouseUp = () => {
    this.isDown = false;
    this.wrapper.nativeElement.style.cursor = 'grab';
    this.resumeAnimation();
  };

  private onMouseMove = (e: MouseEvent) => {
    if (!this.isDown) return;
    e.preventDefault();
  };

  private resumeAnimation() {
    this.track.nativeElement.querySelectorAll('.gallery-row').forEach((row: any) => {
      row.style.animationPlayState = 'running';
    });
  }
}