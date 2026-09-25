import { ComponentFixture, TestBed } from '@angular/core/testing';
import { IndexPreview } from './index-preview';

describe('IndexPreview', () => {
  let component: IndexPreview;
  let fixture: ComponentFixture<IndexPreview>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [IndexPreview],
    }).compileComponents();

    fixture = TestBed.createComponent(IndexPreview);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
