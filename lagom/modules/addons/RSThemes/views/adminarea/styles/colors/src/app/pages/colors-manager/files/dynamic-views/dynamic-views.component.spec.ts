import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DynamicViewsComponent } from './dynamic-views.component';

describe('DynamicViews', () => {
  let component: DynamicViewsComponent;
  let fixture: ComponentFixture<DynamicViewsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DynamicViewsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DynamicViewsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
