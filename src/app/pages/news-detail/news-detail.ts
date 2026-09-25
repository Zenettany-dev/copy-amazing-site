import { Component, OnInit, AfterViewChecked, ElementRef } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';
import { News } from '../../services/news';
import { NewsItem } from '../../core/models/news.model';
import { formatDateLabel } from '../../core/utils/bbcode';
import { MediaViewer, MediaItem } from '../../components/media-viewer/media-viewer';

@Component({
  selector: 'app-news-detail',
  standalone: true,
  imports: [CommonModule, RouterLink, MediaViewer],
  templateUrl: './news-detail.html',
  styleUrl: './news-detail.scss'
})
export class NewsDetail implements OnInit, AfterViewChecked {
  item: NewsItem | undefined;
  safeContent: SafeHtml = '';
  dateLabel = '';

  viewerOpen = false;
  viewerIndex = 0;
  mediaItems: MediaItem[] = [];

  private bound = false;

  constructor(
    private route: ActivatedRoute,
    private newsService: News,
    private sanitizer: DomSanitizer,
    private el: ElementRef
  ) {}

  ngOnInit() {
    const slug = this.route.snapshot.paramMap.get('slug');
    if (!slug) return;

    this.item = this.newsService.getBySlug(slug);
    if (!this.item) return;

    this.dateLabel = this.item.dateLabel || formatDateLabel(this.item.date);
    this.safeContent = this.sanitizer.bypassSecurityTrustHtml(this.item.content || '');
  }

  ngAfterViewChecked() {
    if (this.item && !this.bound) {
      this.bindMediaClicks();
    }
  }

  private bindMediaClicks() {
    const nodes: NodeListOf<HTMLImageElement> =
      this.el.nativeElement.querySelectorAll('.body img');

    if (!nodes.length) return;

    this.bound = true;
    this.mediaItems = [];

    nodes.forEach((img, i) => {
      const src = img.getAttribute('src') || '';
      this.mediaItems.push({ src, type: 'image' });
      img.style.cursor = 'pointer';
      img.onclick = (e: MouseEvent) => {
        e.preventDefault();
        e.stopPropagation();
        this.viewerIndex = i;
        this.viewerOpen = true;
      };
    });
  }

  closeViewer() {
    this.viewerOpen = false;
  }
}