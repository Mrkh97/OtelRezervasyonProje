import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RezervasyonlarComponent } from './rezervasyonlar.component';

describe('RezervasyonlarComponent', () => {
  let component: RezervasyonlarComponent;
  let fixture: ComponentFixture<RezervasyonlarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RezervasyonlarComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RezervasyonlarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
