import { Component, HostListener, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';

export interface MediaItem {
  src: string;
  type: 'image' | 'video';
}

@Component({
  selector: 'app-media-viewer',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './media-viewer.html',
  styleUrl: './media-viewer.scss'
})
export class MediaViewer {
  @Input() items: MediaItem[] = [];
  @Input() index = 0;
  @Input() open = false;
  @Output() closed = new EventEmitter<void>();

  get current(): MediaItem | undefined {
    return this.items[this.index];
  }

  close() {
    this.closed.emit();
  }

  prev(e?: Event) {
    e?.stopPropagation();
    if (!this.items.length) return;
    this.index = (this.index - 1 + this.items.length) % this.items.length;
  }

  next(e?: Event) {
    e?.stopPropagation();
    if (!this.items.length) return;
    this.index = (this.index + 1) % this.items.length;
  }

  @HostListener('document:keydown', ['$event'])
  onKey(e: KeyboardEvent) {
    if (!this.open) return;
    if (e.key === 'Escape') this.close();
    if (e.key === 'ArrowLeft') this.prev();
    if (e.key === 'ArrowRight') this.next();
  }
}