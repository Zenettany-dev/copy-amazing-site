import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { News } from '../../../services/news';
import { NewsItem } from '../../../core/models/news.model';

@Component({
  selector: 'app-news-list',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './news-list.html',
  styleUrl: './news-list.scss'
})
export class NewsList {
  items: NewsItem[] = [];

  constructor(private news: News) {
    this.reload();
  }

  reload() {
    this.items = this.news.getAll();
  }

  remove(id: string) {
    if (confirm('Удалить новость?')) {
      this.news.remove(id);
      this.reload();
    }
  }
}