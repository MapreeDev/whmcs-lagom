import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RsColorInputComponent } from './rs-color-input.component';

describe('RsColorInputComponent', () => {
  let component: RsColorInputComponent;
  let fixture: ComponentFixture<RsColorInputComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RsColorInputComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RsColorInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
