import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColorsManagerComponent } from './colors-manager.component';

describe('ColorsManagerComponent', () => {
  let component: ColorsManagerComponent;
  let fixture: ComponentFixture<ColorsManagerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColorsManagerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColorsManagerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
