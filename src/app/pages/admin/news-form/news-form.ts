import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { News } from '../../../services/news';
import { formatDateLabel } from '../../../core/utils/bbcode';
import { RichEditor } from '../../../components/rich-editor/rich-editor';

@Component({
  selector: 'app-news-form',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink, RichEditor],
  templateUrl: './news-form.html',
  styleUrl: './news-form.scss'
})
export class NewsForm implements OnInit {
  isEdit = false;
  id = '';

  form = {
    title: '',
    slug: '',
    description: '',
    content: '',
    image: '',
    type: 'project' as 'project' | 'server',
    server: null as string | null,
    date: new Date().toISOString().slice(0, 10),
    featured: false,
    published: true
  };

  servers = ['RED', 'YELLOW', 'GREEN', 'AZURE', 'SILVER', 'ROSE', 'BLACK', 'SKY', 'TITAN', 'X', 'FIRE', 'LIME'];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private news: News
  ) {}

  ngOnInit() {
    this.id = this.route.snapshot.paramMap.get('id') || '';
    if (this.id) {
      this.isEdit = true;
      const item = this.news.getById(this.id);
      if (item) {
        this.form = {
          title: item.title,
          slug: item.slug,
          description: item.description,
          content: item.content,
          image: item.image,
          type: item.type,
          server: item.server,
          date: item.date,
          featured: !!item.featured,
          published: item.published
        };
      }
    }
  }

  onTitleChange() {
    if (!this.isEdit || !this.form.slug) {
      this.form.slug = this.form.title
        .toLowerCase()
        .replace(/[^a-zа-яё0-9\s-]/gi, '')
        .trim()
        .replace(/\s+/g, '-');
    }
  }

  save() {
    const data = {
      title: this.form.title,
      slug: this.form.slug,
      description: this.form.description,
      content: this.form.content,
      image: this.form.image,
      gallery: [] as string[],
      type: this.form.type,
      server: this.form.type === 'server' ? this.form.server : null,
      date: this.form.date,
      dateLabel: formatDateLabel(this.form.date),
      featured: this.form.featured,
      published: this.form.published
    };

    if (this.isEdit) {
      this.news.update(this.id, data);
    } else {
      this.news.add(data);
    }

    this.router.navigate(['/admin/news']);
  }
}