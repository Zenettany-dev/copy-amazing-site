import { Component, HostListener } from '@angular/core';
import { Router, RouterLink, RouterLinkActive } from '@angular/router';
import { CommonModule } from '@angular/common';
import { Auth, AuthUser } from '../../services/auth';
import { AuthModal } from '../auth-modal/auth-modal';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule, RouterLink, RouterLinkActive, AuthModal],
  templateUrl: './header.html',
  styleUrl: './header.scss'
})
export class Header {
  isCollapsed = false;
  openDropdown = false;
  openGames = false;
  openAccountMenu = false;
  openDotsMenu = false;
  isMobileMenuOpen = false;
  private isHovering = false;

  constructor(
    public auth: Auth,
    private router: Router
  ) {}

  get accounts(): AuthUser[] {
    return this.auth.accounts();
  }

  @HostListener('window:scroll')
  onScroll() {
    if (this.isHovering || this.isMobileMenuOpen) return;
    if (window.innerWidth <= 900) return;
    const scrollTop = window.scrollY || document.documentElement.scrollTop;
    if (scrollTop > 150) this.isCollapsed = true;
    else if (scrollTop < 30) this.isCollapsed = false;
  }

  @HostListener('window:resize')
  onResize() {
    if (window.innerWidth > 900 && this.isMobileMenuOpen) this.closeMobile();
  }

  @HostListener('document:click', ['$event'])
  onDocClick(e: MouseEvent) {
    const t = e.target as HTMLElement;
    if (!t.closest('.user-block')) {
      this.openAccountMenu = false;
      this.openDotsMenu = false;
    }
    if (!t.closest('.games-dropdown')) this.openGames = false;
  }

  onMouseEnter() {
    if (window.innerWidth <= 900) return;
    this.isHovering = true;
    this.isCollapsed = false;
  }

  onMouseLeave() {
    if (window.innerWidth <= 900) return;
    this.isHovering = false;
    const scrollTop = window.scrollY || document.documentElement.scrollTop;
    if (scrollTop > 150) this.isCollapsed = true;
  }

  toggleMobileMenu() {
    this.isMobileMenuOpen = !this.isMobileMenuOpen;
    document.body.style.overflow = this.isMobileMenuOpen ? 'hidden' : '';
  }

  closeMobile() {
    this.isMobileMenuOpen = false;
    document.body.style.overflow = '';
  }

  openLogin() {
    this.closeMobile();
    this.openAccountMenu = false;
    this.openDotsMenu = false;
    this.auth.openModal();
  }

  toggleAccountMenu(e: Event) {
    e.stopPropagation();
    this.openAccountMenu = !this.openAccountMenu;
    this.openDotsMenu = false;
  }

  toggleDotsMenu(e: Event) {
    e.stopPropagation();
    this.openDotsMenu = !this.openDotsMenu;
    this.openAccountMenu = false;
  }

  switchAccount(acc: AuthUser) {
    this.auth.switchTo(acc);
    this.openAccountMenu = false;
    this.router.navigateByUrl('/cabinet');
  }

  goCabinet() {
    this.openAccountMenu = false;
    this.openDotsMenu = false;
    this.router.navigateByUrl('/cabinet');
  }

  onAvatarError(ev: Event) {
    const img = ev.target as HTMLImageElement;
    img.src = '/pages/avatar-placeholder.png';
  }

  logout() {
    this.auth.logout();
    this.openAccountMenu = false;
    this.openDotsMenu = false;
  }
}