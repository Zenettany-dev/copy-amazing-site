import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { News } from '../../services/news';
import { NewsItem } from '../../core/models/news.model';

@Component({
  selector: 'app-blog',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './blog.html',
  styleUrl: './blog.scss'
})
export class Blog {
  serverOpen = false;

  featured: NewsItem | undefined;
  serverNews: NewsItem[] = [];

  servers = [
    { name: 'Все сервера', color: null as string | null },
    { name: 'RED', color: '#DC2D22' },
    { name: 'YELLOW', color: '#EAAD39' },
    { name: 'GREEN', color: '#3CB75B' },
    { name: 'AZURE', color: '#464BFA' },
    { name: 'SILVER', color: '#9E9E9E' },
    { name: 'ROSE', color: '#FF6DC6' },
    { name: 'BLACK', color: '#000000' },
    { name: 'SKY', color: '#3BC7E8' },
    { name: 'TITAN', color: '#71368A' },
    { name: 'X', color: '#A21047' },
    { name: 'FIRE', color: '#FF6810' },
    { name: 'LIME', color: '#C2FF42' }
  ];

  selectedServer = this.servers[0];

  constructor(private newsService: News) {
    this.featured = this.newsService.getFeatured();
    this.updateServerNews();
  }

  selectServer(s: { name: string; color: string | null }) {
    this.selectedServer = s;
    this.serverOpen = false;
    this.updateServerNews();
  }

  private updateServerNews() {
    this.serverNews = this.newsService.getServerNews(
      this.selectedServer.name === 'Все сервера' ? null : this.selectedServer.name
    );
  }
}