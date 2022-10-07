import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CardinascComponent } from './cardinasc.component';

describe('CardinascComponent', () => {
  let component: CardinascComponent;
  let fixture: ComponentFixture<CardinascComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CardinascComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CardinascComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
