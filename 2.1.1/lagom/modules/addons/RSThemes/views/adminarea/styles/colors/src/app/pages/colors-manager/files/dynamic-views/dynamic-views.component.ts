import { Component, HostListener, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { select, Store } from "@ngrx/store";
import {
  selectColorIsLoading,
  selectCurrentFileContent,
  selectFileName,
  selectFontsDropdown,
  selectColorsDropdown
} from "../../../../store/colors/color.selector";
import { FormBuilder, FormGroup } from "@angular/forms";
import { generateForm } from "../../../../helpers/color.helper";
import { Observable, Subscription} from "rxjs";
import { ColorsService } from "../../../../services/colors.service";
import { loadColorDropdown, loadFileContent, loadFontsDropdown, unsavedChangesSetDefault } from "../../../../store/colors/color.actions";

declare var $:any;
@Component({
  selector: 'app-dynamic-view',
  templateUrl: './dynamic-views.component.html',
  styleUrls: ['./dynamic-views.component.scss']
})
export class DynamicViewsComponent implements OnInit {

  isLoading$: Observable<boolean> = this.store.pipe(select(selectColorIsLoading));
  subscription: Subscription;
  form: FormGroup;
  dynamicFormFields: any;
  dynamicForm: any;
  fileName: string;
  schemeName: string;

  @Input() colorsManagerComponent;

  constructor(
    private store: Store,
    private fb: FormBuilder,
    private colorsService: ColorsService,
  ) { }

  ngOnInit(): void {

    const configForm = {
      fb: this.fb,
      form: this.form,
      formFields: this.dynamicFormFields
    }



    this.store.pipe(select(selectFileName)).subscribe(fileName => {
      this.fileName = fileName
    })

    this.store.pipe(select(selectColorsDropdown)).subscribe(dropdownColors => {
      if(dropdownColors === null ){
        this.store.dispatch(loadColorDropdown({update: true}));
      }
    })

    this.subscription = this.store.pipe(select(selectCurrentFileContent)).subscribe(fileContent => {
      if (fileContent) {
        this.store.pipe(select(selectFontsDropdown)).subscribe(dropdownFonts => {
          if(!dropdownFonts && this.fileName === `typography`){
            this.store.dispatch(loadFontsDropdown({update: true}));
          }
        })
        this.dynamicForm = generateForm(configForm, fileContent);
      }
    });
  }

  saveChanges() {
    if(this.fileName !== 'colors'){
      this.colorsService
      .saveFileContent(
        this.fileName,
        this.dynamicForm.form.getRawValue()
      )
      .subscribe((data: any) => {
        if (data) {
          if (data.status === true) {
            this.store.dispatch(loadFileContent({fileName: this.fileName}))
            this.store.dispatch(unsavedChangesSetDefault())

            $("#saveConfirmationModal").modal("hide");
            window.luNotification({
              size:'md',
              status: 'success', 
              title: 'Success',
              body: data.text,
            });

          } else {
            $("#saveConfirmationModal").modal("hide");

            window.luNotification({
              size:'md',
              status: 'danger',
              title: 'Error',
              body: data.text,
            });
          }
        }
      });
    }
  }

  asIsOrder(a, b) {
    return 1;
  }
}

