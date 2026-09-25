import {
  Component,
  ElementRef,
  ViewChild,
  Input,
  Output,
  EventEmitter,
  OnChanges,
  SimpleChanges,
  forwardRef,
  HostListener
} from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ControlValueAccessor, NG_VALUE_ACCESSOR } from '@angular/forms';

@Component({
  selector: 'app-rich-editor',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './rich-editor.html',
  styleUrl: './rich-editor.scss',
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      useExisting: forwardRef(() => RichEditor),
      multi: true
    }
  ]
})
export class RichEditor implements ControlValueAccessor, OnChanges {
  @ViewChild('area') area!: ElementRef<HTMLDivElement>;
  @ViewChild('fileInput') fileInput!: ElementRef<HTMLInputElement>;

  @Input() value = '';
  @Output() valueChange = new EventEmitter<string>();

  showLinkPopup = false;
  linkUrl = '';
  showColorPopup = false;
  showBgPopup = false;
  showHeadingMenu = false;
  showFontMenu = false;

  customColor = '#3cb75b';
  customBg = '#3cb75b';

  private savedRange: Range | null = null;

  colors = [
    '#000000', '#212121', '#666666', '#999999',
    '#f72822', '#eb3e2e', '#fe802c', '#37a854',
    '#3cb75b', '#009ada', '#8500de', '#ffffff'
  ];

  fonts = [
    { name: 'Roboto', css: 'Roboto, sans-serif' },
    { name: 'Arial', css: 'Arial, Helvetica, sans-serif' },
    { name: 'Gilroy', css: 'Gilroy, Montserrat, sans-serif' },
    { name: 'Proxima Nova', css: '"Proxima Nova", Montserrat, sans-serif' },
    { name: 'Gotham', css: 'Gotham, Montserrat, sans-serif' },
    { name: 'Montserrat', css: 'Montserrat, sans-serif' },
    { name: 'Inter', css: 'Inter, sans-serif' },
    { name: 'Open Sans', css: '"Open Sans", sans-serif' }
  ];

  private onChangeFn: (v: string) => void = () => {};
  private onTouchedFn: () => void = () => {};

  ngOnChanges(changes: SimpleChanges) {
    if (changes['value'] && this.area?.nativeElement) {
      if (this.area.nativeElement.innerHTML !== this.value) {
        this.area.nativeElement.innerHTML = this.value || '';
      }
    }
  }

  writeValue(v: string) {
    this.value = v || '';
    setTimeout(() => {
      if (this.area?.nativeElement && this.area.nativeElement.innerHTML !== this.value) {
        this.area.nativeElement.innerHTML = this.value;
      }
    });
  }

  registerOnChange(fn: (v: string) => void) {
    this.onChangeFn = fn;
  }

  registerOnTouched(fn: () => void) {
    this.onTouchedFn = fn;
  }

  onTouched() {
    this.onTouchedFn();
  }

  private saveSelection() {
    const sel = window.getSelection();
    if (sel && sel.rangeCount > 0) {
      const range = sel.getRangeAt(0);
      if (this.area?.nativeElement.contains(range.commonAncestorContainer)) {
        this.savedRange = range.cloneRange();
      }
    }
  }

  private restoreSelection(): boolean {
    if (!this.savedRange) return false;
    const sel = window.getSelection();
    if (!sel) return false;
    try {
      sel.removeAllRanges();
      sel.addRange(this.savedRange);
      return true;
    } catch {
      return false;
    }
  }

  private wrapStyle(styles: Record<string, string>) {
    this.area.nativeElement.focus();
    this.restoreSelection();

    const sel = window.getSelection();
    if (!sel || sel.isCollapsed || !sel.rangeCount) return;

    const range = sel.getRangeAt(0);

    const parent =
      range.commonAncestorContainer.nodeType === Node.TEXT_NODE
        ? range.commonAncestorContainer.parentElement
        : (range.commonAncestorContainer as HTMLElement);

    if (
      parent &&
      parent.tagName === 'SPAN' &&
      parent !== this.area.nativeElement &&
      this.area.nativeElement.contains(parent) &&
      range.toString() === (parent.textContent || '')
    ) {
      Object.assign(parent.style, styles);
      this.saveSelection();
      this.emit();
      return;
    }

    try {
      const span = document.createElement('span');
      Object.assign(span.style, styles);
      range.surroundContents(span);
    } catch {
      const fragment = range.extractContents();
      const span = document.createElement('span');
      Object.assign(span.style, styles);
      span.appendChild(fragment);
      range.insertNode(span);
    }

    this.saveSelection();
    this.emit();
  }

  exec(cmd: string, val?: string) {
    this.area.nativeElement.focus();
    this.restoreSelection();
    document.execCommand(cmd, false, val);
    this.saveSelection();
    this.emit();
  }

  formatBlock(tag: string) {
    this.exec('formatBlock', tag);
    this.showHeadingMenu = false;
  }

  breakList() {
    this.area.nativeElement.focus();
    this.restoreSelection();
    document.execCommand('outdent');
    document.execCommand('formatBlock', false, 'P');
    this.emit();
  }

  setFont(css: string) {
    this.wrapStyle({ fontFamily: css });
    this.showFontMenu = false;
  }

  pickColor(color: string) {
    this.wrapStyle({ color });
    this.showColorPopup = false;
  }

  applyCustomColor() {
    const v = this.customColor?.trim();
    if (!v) return;
    this.wrapStyle({ color: v });
    this.showColorPopup = false;
  }

  applyBg(value: string) {
    this.area.nativeElement.focus();
    this.restoreSelection();

    if (value === 'none') {
      const sel = window.getSelection();
      if (sel && sel.rangeCount) {
        let el = sel.anchorNode as Node | null;
        if (el && el.nodeType === Node.TEXT_NODE) el = el.parentElement;
        if (el && (el as HTMLElement).tagName === 'SPAN') {
          const s = (el as HTMLElement).style;
          s.background = '';
          s.backgroundImage = '';
          s.padding = '';
          s.borderRadius = '';
        }
      }
      this.emit();
      this.showBgPopup = false;
      return;
    }

    if (value === 'box-green' || value === 'box-gray') {
      const sel = window.getSelection();
      let html = 'Текст блока';
      if (sel && !sel.isCollapsed && sel.rangeCount) {
        const div = document.createElement('div');
        div.appendChild(sel.getRangeAt(0).cloneContents());
        html = div.innerHTML || sel.toString() || html;
        sel.deleteFromDocument();
      }
      const cls = value === 'box-green' ? 'bb-box green' : 'bb-box gray';
      document.execCommand('insertHTML', false, `<div class="${cls}">${html}</div><p><br></p>`);
      this.emit();
      this.showBgPopup = false;
      return;
    }

    const isGrad = value.includes('gradient');
    if (isGrad) {
      this.wrapStyle({
        background: value,
        backgroundImage: value,
        padding: '2px 6px',
        borderRadius: '4px'
      });
    } else {
      this.wrapStyle({
        background: value,
        padding: '2px 6px',
        borderRadius: '4px'
      });
    }
    this.showBgPopup = false;
  }

  applyCustomBg() {
    const v = this.customBg?.trim();
    if (!v) return;
    this.applyBg(v);
  }

  openLink() {
    this.saveSelection();
    this.showLinkPopup = true;
    this.linkUrl = 'https://';
  }

  applyLink() {
    this.area.nativeElement.focus();
    this.restoreSelection();
    const sel = window.getSelection();
    if (sel && !sel.isCollapsed && this.linkUrl) {
      const div = document.createElement('div');
      div.appendChild(sel.getRangeAt(0).cloneContents());
      const text = div.innerHTML || sel.toString();
      document.execCommand(
        'insertHTML',
        false,
        `<a href="${this.linkUrl}" target="_blank" rel="noopener">${text}</a>`
      );
    } else if (this.linkUrl) {
      document.execCommand(
        'insertHTML',
        false,
        `<a href="${this.linkUrl}" target="_blank" rel="noopener">${this.linkUrl}</a>`
      );
    }
    this.showLinkPopup = false;
    this.emit();
  }

  removeLink() {
    this.exec('unlink');
    this.showLinkPopup = false;
  }

  triggerImage() {
    this.saveSelection();
    this.fileInput.nativeElement.click();
  }

  onFile(e: Event) {
    const input = e.target as HTMLInputElement;
    const file = input.files?.[0];
    if (!file || !file.type.startsWith('image/')) return;

    if (file.size > 1.5 * 1024 * 1024) {
      alert('Картинка слишком большая (макс. ~1.5 МБ). Сожми перед загрузкой.');
      input.value = '';
      return;
    }

    const reader = new FileReader();
    reader.onload = () => {
      const src = reader.result as string;
      this.area.nativeElement.focus();
      this.restoreSelection();
      document.execCommand(
        'insertHTML',
        false,
        `<figure class="news-image"><img src="${src}" alt="" /></figure><p><br></p>`
      );
      this.emit();
      input.value = '';
    };
    reader.readAsDataURL(file);
  }

  insertHrWithText() {
    const text = prompt('Текст разделителя:', '');
    if (text === null) return;
    const safe = text.replace(/</g, '&lt;').replace(/>/g, '&gt;');
    this.area.nativeElement.focus();
    this.restoreSelection();
    document.execCommand(
      'insertHTML',
      false,
      `<h2 class="news-hr">${safe || '&nbsp;'}</h2><p><br></p>`
    );
    this.emit();
  }

  clearFormat() {
    this.exec('removeFormat');
  }

  onInput() {
    this.emit();
  }

  onMouseUp() {
    this.saveSelection();
  }

  onKeyUp() {
    this.saveSelection();
  }

  private emit() {
    const html = this.area?.nativeElement?.innerHTML || '';
    this.value = html;
    this.valueChange.emit(html);
    this.onChangeFn(html);
    this.onTouchedFn();
  }

  @HostListener('document:click', ['$event'])
  onDocClick(e: MouseEvent) {
    const t = e.target as HTMLElement;
    if (!t.closest('.dropdown')) {
      this.showColorPopup = false;
      this.showBgPopup = false;
      this.showHeadingMenu = false;
      this.showFontMenu = false;
    }
  }
}