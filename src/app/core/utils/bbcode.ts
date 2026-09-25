export function formatDateLabel(iso: string): string {
  const d = new Date(iso);
  const now = new Date();
  const diff = Math.floor((now.getTime() - d.getTime()) / 1000);

  if (diff < 60) return 'Только что';
  if (diff < 3600) return `${Math.floor(diff / 60)} мин. назад`;
  if (diff < 86400) return `${Math.floor(diff / 3600)} ч. назад`;
  if (diff < 86400 * 2) return 'Вчера';
  if (diff < 86400 * 7) return `${Math.floor(diff / 86400)} дн. назад`;
  if (diff < 86400 * 14) return 'Неделю назад';
  if (diff < 86400 * 30) return `${Math.floor(diff / 86400 / 7)} нед. назад`;
  if (diff < 86400 * 365) return `${Math.floor(diff / 86400 / 30)} мес. назад`;
  return d.toLocaleDateString('ru-RU');
}