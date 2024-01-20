import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RsColorSelectComponent } from './rs-color-select.component';

describe('RsColorSelectComponent', () => {
  let component: RsColorSelectComponent;
  let fixture: ComponentFixture<RsColorSelectComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RsColorSelectComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RsColorSelectComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
  
});
