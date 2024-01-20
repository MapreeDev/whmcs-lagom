import { Component, OnInit, Input, EventEmitter, Output } from '@angular/core';
import { FormGroup } from "@angular/forms";
import { ColorsProperties } from "../../model/colorsProperties";
import unsavedChanges from '../../../../../../../../../../../src/assets/js/components/rsthemes/unsaved-changes';
import { schemeColorsChangesExist, unsavedChangesExist } from 'src/app/store/colors/color.actions';
import { Store } from '@ngrx/store';
@Component({
  selector: 'app-rs-color-input',
  templateUrl: './rs-color-input.component.html',
  styleUrls: ['./rs-color-input.component.scss']
})

export class RsColorInputComponent implements OnInit {
  @Input() item: ColorsProperties;
  @Input() form: FormGroup;
  @Input() editorType: any;

  @Output() colorChange = new EventEmitter;
  public colorPickerValue: any;

  constructor(
    private store: Store,
  ) { }

  ngOnInit(): void {
  }

  changeColorValue(color): void {
    this.colorPickerValue = color;
    this.colorChange.emit(color);
    this.changesDetect()
  }

  changesDetect(){
    this.store.dispatch(unsavedChangesExist())
    this.store.dispatch(schemeColorsChangesExist()) 
  } 

  getAdvancedColor(): string {
    return this.form.get(this.item.description.section)['controls'][this.item.variable.name].value
  }
}
