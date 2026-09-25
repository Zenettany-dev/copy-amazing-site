import { Injectable } from '@angular/core';
import { NewsItem } from '../core/models/news.model';

const STORAGE_KEY = 'wmazing_news';

@Injectable({ providedIn: 'root' })
export class News {
  private items: NewsItem[] = [];

  constructor() {
    this.load();
  }

  private load() {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (raw) {
      try {
        this.items = JSON.parse(raw);
        return;
      } catch {}
    }
    this.items = [];
    this.save();
  }

  private save() {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(this.items));
  }

  getAll(): NewsItem[] {
    return [...this.items];
  }

  getPublished(): NewsItem[] {
    return this.items.filter(i => i.published);
  }

  getFeatured(): NewsItem | undefined {
    return this.items.find(i => i.featured && i.published);
  }

  getProjectNews(): NewsItem[] {
    return this.items.filter(i => i.type === 'project' && i.published);
  }

  getServerNews(server?: string | null): NewsItem[] {
    return this.items.filter(i => {
      if (i.type !== 'server' || !i.published) return false;
      if (!server || server === 'Все сервера') return true;
      return i.server === server;
    });
  }

  getBySlug(slug: string): NewsItem | undefined {
    return this.items.find(i => i.slug === slug && i.published);
  }

  getById(id: string): NewsItem | undefined {
    return this.items.find(i => i.id === id);
  }

  add(item: Omit<NewsItem, 'id'>): NewsItem {
    const news: NewsItem = { ...item, id: Date.now().toString() };
    this.items.unshift(news);
    this.save();
    return news;
  }

  update(id: string, data: Partial<NewsItem>) {
    const idx = this.items.findIndex(i => i.id === id);
    if (idx === -1) return;
    this.items[idx] = { ...this.items[idx], ...data };
    this.save();
  }

  remove(id: string) {
    this.items = this.items.filter(i => i.id !== id);
    this.save();
  }
}