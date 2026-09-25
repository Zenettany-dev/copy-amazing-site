import { Component } from '@angular/core';
import { IndexPreview } from '../../components/index-preview/index-preview';
import { Gallery } from '../../components/gallery/gallery';
import { Features } from '../../components/features/features';
import { HowToStart } from '../../components/how-to-start/how-to-start';
import { Footer } from '../../components/footer/footer';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [
    IndexPreview,
    Gallery,
    Features,
    HowToStart,
    Footer
  ],
  templateUrl: './home.html',
  styleUrl: './home.scss'
})
export class Home {}