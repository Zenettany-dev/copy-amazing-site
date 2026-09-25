import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HowToStart } from './how-to-start';

describe('HowToStart', () => {
  let component: HowToStart;
  let fixture: ComponentFixture<HowToStart>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HowToStart],
    }).compileComponents();

    fixture = TestBed.createComponent(HowToStart);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
