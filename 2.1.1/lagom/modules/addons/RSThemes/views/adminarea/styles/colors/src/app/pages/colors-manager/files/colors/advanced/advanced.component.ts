import { Component, OnDestroy, OnInit } from '@angular/core';
import { select, Store } from "@ngrx/store";
import { FormBuilder, FormControl, FormGroup } from "@angular/forms";
import { loadColorDropdown, loadSchemeColorData, loadSchemePreviewResponse, schemeColorsChangesSetDefault, unsavedChangesSetDefault } from "../../../../../store/colors/color.actions";
import { selectColorIsLoading, selectCurrentColorSchemeData, selectCurrentScheme, selectFileName } from "../../../../../store/colors/color.selector";
import { Observable, Subscription } from 'rxjs';
import { ColorsService } from 'src/app/services/colors.service';

declare var $: any;
@Component({
  selector: 'app-advanced', 
  templateUrl: './advanced.component.html',
  styleUrls: ['./advanced.component.scss']
}) 
export class AdvancedComponent implements OnInit, OnDestroy {
  isLoading$: Observable<boolean> = this.store.pipe(select(selectColorIsLoading));
  colorForm: FormGroup;
  dynamicFormFields: any = null;
  gradients: any = {};
  editorType: string = 'advanced';
  fileName: any;
  schemeName: any;
  subscription: Subscription;
  constructor(
    private store: Store,
    private fb: FormBuilder,
    private colorsService: ColorsService,
  ) { }
 
  ngOnInit(): void {
    this.store.pipe(select(selectFileName)).subscribe(fileName => {
      this.fileName = fileName
    })

    this.store.pipe(select(selectCurrentScheme)).subscribe(schemeName => {
      this.schemeName = schemeName
    })

    this.subscription = this.store.pipe(select(selectCurrentColorSchemeData)).subscribe(data => {
      this.colorForm = this.fb.group({});
      if (data && !(data instanceof Array)) {
        this.dynamicFormFields = data;
        for (let [sectionName, sectionValues] of Object.entries(data)) {
          this.gradients[sectionName] = {}
          this.colorForm.addControl(sectionName, this.fb.group({}));
          for (let itemValue of Object.values(sectionValues)) {
            if (typeof itemValue === 'object' && itemValue !== null && itemValue !== 'hidden') {
              this.colorSection(sectionName).addControl(
                itemValue.variable.name, new FormControl(itemValue.variable.value, []));
               
               
              if (itemValue.description.type === 'gradientColor') {
                
                if (itemValue.description.gradientcolor === 'start'){
                  let gradientStart = itemValue
                  this.gradients[sectionName]['gradientStart'] = gradientStart
                } else if (itemValue.description.gradientcolor === 'end'){
                  let gradientEnd = itemValue 
                  this.gradients[sectionName]['gradientEnd'] = gradientEnd
                }
              }

            }
          }
        }
      }
    });
  }

  asIsOrder(a, b) {
    return 1;
  }

  colorSection(sectionName: string): FormGroup {
    return this.colorForm.get(sectionName) as FormGroup
  }

  detectChanges(field, color) {
   this.colorForm['controls'][field.description.section]['controls'][field.variable.name].patchValue(color);
  }

  saveChanges(): void {
    if (this.fileName === 'colors') {
      this.colorsService.saveSchemeColors(this.schemeName, this.colorForm.getRawValue(), this.editorType).subscribe((data: any) => {

        if (data) {
          if (data.status === true) {
            this.store.dispatch(loadSchemeColorData({ schemeName: this.schemeName, schemeType: this.editorType }))
            this.store.dispatch(loadColorDropdown({ update: true }))

            this.colorsService.getColors().subscribe(colorsScheme => {
              this.store.dispatch(loadSchemePreviewResponse({ colorPreview: colorsScheme }))
            })

            this.store.dispatch(unsavedChangesSetDefault())
            this.store.dispatch(schemeColorsChangesSetDefault())

            window.luNotification({
              size: 'md',
              status: 'success',
              title: 'Success',
              body: data.text,
            });

          } else {

            window.luNotification({
              size: 'md',
              status: 'danger',
              title: 'Error',
              body: data.text,
            });
          }
          $("#saveConfirmationModal").modal("hide");
        }
      })
    }
  }

  getColorForm() {
    return this.colorForm.getRawValue()
  }

  getGradientPreview(gradientType, field) {
    let gradientTemplate;
    let startColor;
    let endColor;
    if (gradientType === 'horizontal') {
      startColor = this.colorForm.get(this.gradients[field.description.section].gradientStart.description.section)['controls'][this.gradients[field.description.section].gradientStart.variable.name].value
      endColor = this.colorForm.get(this.gradients[field.description.section].gradientStart.description.section)['controls'][this.gradients[field.description.section].gradientEnd.variable.name].value
      gradientTemplate = `linear-gradient(90deg, ${startColor} 0%, ${endColor} 100%)`;
    } else if (gradientType === 'vertical') {
      startColor = this.colorForm.get(this.gradients[field.description.section].gradientStart.description.section)['controls'][this.gradients[field.description.section].gradientEnd.variable.name].value
      endColor = this.colorForm.get(this.gradients[field.description.section].gradientStart.description.section)['controls'][this.gradients[field.description.section].gradientStart.variable.name].value
      gradientTemplate = `linear-gradient(0deg, ${endColor} 0%, ${startColor} 100%)`;
    }
    return gradientTemplate
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe(); 
  }

}