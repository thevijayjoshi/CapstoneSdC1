import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SortcomponentComponent } from './sortcomponent.component';

describe('SortcomponentComponent', () => {
  let component: SortcomponentComponent;
  let fixture: ComponentFixture<SortcomponentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SortcomponentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SortcomponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
