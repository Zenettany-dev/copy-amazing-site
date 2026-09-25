export type NewsType = 'project' | 'server';

export interface NewsItem {
  id: string;
  slug: string;
  type: NewsType;
  server: string | null;
  title: string;
  description: string;
  content: string;
  image: string;
  gallery?: string[];
  date: string;
  dateLabel?: string;
  featured?: boolean;
  published: boolean;
}