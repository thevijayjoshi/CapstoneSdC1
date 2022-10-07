import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CardindescComponent } from './cardindesc.component';

describe('CardindescComponent', () => {
  let component: CardindescComponent;
  let fixture: ComponentFixture<CardindescComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CardindescComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CardindescComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
