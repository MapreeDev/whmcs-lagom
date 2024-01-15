import { Component, ViewChild, OnInit, Input, AfterViewInit, OnDestroy } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { select, Store } from "@ngrx/store";
import { clickElementBeforeConfirmModal, loadSchemePreview, schemeColorsChangesSetDefault, unsavedChangesExist, unsavedChangesSetDefault } from "../../../../store/colors/color.actions";
import { selectColorConfig, selectColorPreview, selectColorIsLoading, selectActivatedScheme, selectUnsavedChanges, selectSchemeColorsChanges } from "../../../../store/colors/color.selector";
import { ColorsProperties } from '../../../../model/colorsProperties';
import { Observable, Subscription } from "rxjs";
import { AdvancedComponent } from "./advanced/advanced.component";

declare var $:any;
@Component({
  selector: 'app-colors',
  templateUrl: './colors.component.html',
  styleUrls: ['./colors.component.scss']
})
export class ColorsComponent implements OnInit{
  colorsScheme$: Observable<any> = this.store.pipe(select(selectColorPreview));
  colorConfig$: Observable<any> = this.store.pipe(select(selectColorConfig));
  isLoading$: Observable<boolean> = this.store.pipe(select(selectColorIsLoading));
  colorForm: FormGroup;
  dynamicFormFields: ColorsProperties[];
  subscription: Subscription;

  @ViewChild(AdvancedComponent) advancedColors;
  @Input() colorsManagerComponent;

  schemeName = 'default';
  activatedScheme: any;
  editorType: string = 'simple';
  currentFile = 'colors';
  colorSchemeData: any;
  filesList: any;
  activeButtonWidth: any = '87px';
  activeButtonPosition: any = 'translateX(0)';
  unsavedChangesLeavePageBttn: any;
  saveChangesModal: any;

  constructor(
    private store: Store,
  ) {}


  ngOnInit(): void {
    this.store.dispatch(loadSchemePreview({schemeName: 'init'}));
  }

  changeScheme(event, schemeName): void {
    this.schemeName = schemeName;
    let activatedScheme;
    let unsavedContentChanges;
    let unsavedColorsSchemeChange;

    this.store.dispatch(clickElementBeforeConfirmModal({clickedElement: 'scheme'}))

    this.store.pipe(select(selectUnsavedChanges)).subscribe(flag => {
      unsavedContentChanges = flag
    })

    this.store.pipe(select(selectSchemeColorsChanges)).subscribe(flag => {
      unsavedColorsSchemeChange = flag
    })

    this.store.pipe(select(selectActivatedScheme)).subscribe(data =>{
      activatedScheme = data;
    })

    if (!unsavedColorsSchemeChange) {
      this.store.dispatch(loadSchemePreview({schemeName}));
      if (activatedScheme !== this.schemeName) {
        this.store.dispatch(unsavedChangesExist())
      } else {
        this.store.dispatch(unsavedChangesSetDefault())
      }
    }
  }

  confirmModalChangeScheme(){
    this.store.dispatch(loadSchemePreview({schemeName: this.schemeName}));
    this.colorsManagerComponent.hideUnsavedChangesModal()
    this.store.dispatch(schemeColorsChangesSetDefault())
  }

  // method to switch colors type

  // ngAfterContentChecked(): void {
  //   this.store.pipe(select(selectColorConfig)).subscribe(data => {
  //     this.editorType = data[0].type
  //     if(this.editorType === 'advanced'){
  //       this.activeButtonWidth = `107px`;
  //       this.activeButtonPosition = `translateX(86px)`;
  //     }else{
  //       this.activeButtonWidth = `87px`;
  //       this.activeButtonPosition = `translateX(0)`;
  //     }
  //   });
  // }



  // changeEditorType(type: string, colorConfig: any) {
  //   this.editorType = type;
  //   this.schemeName = colorConfig[0].name
  //   if(type === 'advanced'){
  //     this.store.dispatch(sendColorsUpdatedForm(
  //       {colorSchemeData: this.simpleColors.getColorForm()}
  //     ));
  //   }else if (type === 'simple'){
  //     this.store.dispatch(sendColorsUpdatedForm(
  //       {colorSchemeData: this.advancedColors.getColorForm()}
  //     ));
  //   }
  //   this.store.dispatch(loadSchemeColorData({schemeType: type, schemeName: this.schemeName}));
  // }

  // setActiveEdytorSwitchStyle(){
  //   let activeEditorTypeButton = document.querySelector(`[data-editor-type='${this.editorType}']`)
  //   if(activeEditorTypeButton){
  //     this.updateSwitchButtonStyle(activeEditorTypeButton)
  //   }
  // }

  // updateSwitchButtonStyle(clickedElement){
  //   this.activeButtonWidth = `${clickedElement.offsetWidth}px`;
  //   this.activeButtonPosition = `translateX(${clickedElement.offsetLeft}px)`;
  // }

}
