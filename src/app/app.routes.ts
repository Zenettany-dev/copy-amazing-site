import { Routes } from '@angular/router';
import { Home } from './pages/home/home';
import { Donate } from './pages/donate/donate';
import { Help } from './pages/help/help';

export const routes: Routes = [
  { path: '', component: Home },
  { path: 'donate', component: Donate },
  { path: 'help', component: Help },
  { path: 'help/:category', component: Help },
  { path: 'blog', loadComponent: () => import('./pages/blog/blog').then(m => m.Blog) },
  { path: 'blog/:slug', loadComponent: () => import('./pages/news-detail/news-detail').then(m => m.NewsDetail) },
  { path: 'admin/news', loadComponent: () => import('./pages/admin/news-list/news-list').then(m => m.NewsList) },
  { path: 'admin/news/new', loadComponent: () => import('./pages/admin/news-form/news-form').then(m => m.NewsForm) },
  { path: 'admin/news/edit/:id', loadComponent: () => import('./pages/admin/news-form/news-form').then(m => m.NewsForm) },
  { path: 'cabinet', loadComponent: () => import('./pages/cabinet/cabinet').then(m => m.Cabinet) },
  { path: '**', redirectTo: '' }
  
];