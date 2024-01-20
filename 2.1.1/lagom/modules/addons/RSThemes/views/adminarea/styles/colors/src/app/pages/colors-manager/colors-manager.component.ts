import { Component, OnInit, AfterViewInit, ViewChild, HostListener, ElementRef } from '@angular/core';
import { ColorsService } from "../../services/colors.service";
import { select, Store } from "@ngrx/store";
import { clickElementBeforeConfirmModal, loadColorDropdown, loadColorsContent, loadFileContent, loadSchemeColorData, loadSchemePreviewResponse, schemeColorsChangesSetDefault, unsavedChangesSetDefault} from "../../store/colors/color.actions";
import { Observable, Subscription } from "rxjs";
import { selectClickedElementBeforeConfirmModal, selectColorConfig, selectColorPreview, selectSchemeColorsChanges, selectUnsavedChanges} from "../../store/colors/color.selector";
import { Router } from "@angular/router";
import { first } from "rxjs/operators";
import { selectQueryParams } from '../../store/router/router.selectors';
import unsavedChanges from '../../../../../../../../../../../src/assets/js/components/rsthemes/unsaved-changes';
import { ColorsComponent } from './files/colors/colors.component';
import { DynamicViewsComponent } from './files/dynamic-views/dynamic-views.component';

declare var $:any;
declare global { interface Window { luNotification: any; } }
@Component({
  selector: 'app-colors-manager', 
  templateUrl: './colors-manager.component.html',
  styleUrls: ['./colors-manager.component.scss']
})
export class ColorsManagerComponent implements OnInit {
  colorsScheme$: Observable<any> = this.store.pipe(select(selectColorPreview));
  colorConfig$: Observable<any> = this.store.pipe(select(selectColorConfig));
  public colorsManagerComponentInstance: ColorsManagerComponent;
  subscription: Subscription;
  unsavedChanges: any;
  currentFile = 'colors';
  currentScheme: any;
  currentSchemeType: any;
  currentFileTitle: any;
  filesList: any;
  saveChangesModal: any;
  saveChagnesButtonConfirm: any;
  restoreStyleModal: any;
  restoreButtonConfirm: any;
  restoreStyleType: any;
  clickedElBeforeModalConfirm: any;

  @ViewChild(ColorsComponent) colorsComponent;
  @ViewChild(DynamicViewsComponent) dynamicViewsComponent;

  initialQueryParams = {
    templateName: 'lagom2',
    styleName: 'Default',
    controller: 'Template',
    module: 'RSThemes',
    action: 'manageStyle'
  }

  queryParams = { ...this.initialQueryParams };

  constructor(
    private colorsService: ColorsService,
    private store: Store,
    private router: Router,
    private routerStore: Store,
    private eRef: ElementRef
  ) {
    this.getQueryParamsOnLoad();
    this.colorsManagerComponentInstance = this;
  }

  @HostListener('document:click', ['$event'])
  onClick(event) {
    if(!this.eRef.nativeElement.contains(event.target)){
      if(event.target.nodeName === "A" || event.target.parentNode.nodeName === "A"){
        this.store.dispatch(clickElementBeforeConfirmModal({clickedElement: 'outside'}))
      }
    }
  }

  private getQueryParamsOnLoad(): void {
    this.routerStore
      .pipe(
        select(selectQueryParams),
        first()
      )
      .subscribe(queryParams => {
        this.queryParams = { ...this.queryParams, ...queryParams };
    });
  }

  ngOnInit(): void {
    this.initUnsavedChangesModal()

    this.restoreButtonConfirm = document.querySelector('[data-restore-default-modal-btn]');
    this.restoreStyleModal = document.querySelector('[data-restore-default-modal]');
    this.saveChangesModal = document.querySelector('[data-unsaved-changes-modal]');
    this.saveChagnesButtonConfirm = document.querySelector('[data-confirm-save-changes]');


    this.router.navigate(['addonmodules.php'], { queryParams: this.queryParams }).then(() => {
    });

    this.colorsService.listFiles().subscribe(files => {
      this.filesList = files;
    })

    this.store.pipe(select(selectColorConfig)).subscribe(config =>{
      this.currentScheme = config[0].name
      this.currentSchemeType = config[0].type
    })

    if(this.restoreButtonConfirm){
      this.restoreStyle()
    }

    this.saveChagnesButtonConfirm.addEventListener('click',()=>{
      if (this.colorsComponent) {
        this.colorsComponent.advancedColors.saveChanges()
      }else if ( this.dynamicViewsComponent ) {
        this.dynamicViewsComponent.saveChanges()
      }
    })
    this.store.pipe(select(selectClickedElementBeforeConfirmModal)).subscribe(el =>{
      this.clickedElBeforeModalConfirm = el;
    })

    this.unsavedChanges.modalConfirmBtn.on('click', () => {
      if(this.clickedElBeforeModalConfirm !== 'outside'){
        if(this.clickedElBeforeModalConfirm === 'scheme'){
          this.colorsComponent.confirmModalChangeScheme()
        } else {
          this.confirmModalSelectFile()
        }
      }
    })
  }

  selectFile(event, fileName: string, currentFileTitle?): void {
    let unsavedContentChanges;
    let unsavedColorsSchemeChange;

    this.store.dispatch(clickElementBeforeConfirmModal({clickedElement: fileName}))

    this.store.pipe(select(selectUnsavedChanges)).subscribe(flag => {
      unsavedContentChanges = flag
    })

    this.store.pipe(select(selectSchemeColorsChanges)).subscribe(flag => {
      unsavedColorsSchemeChange = flag
    })


    if(event.currentTarget.classList.contains('nav__link')){
      if(!unsavedColorsSchemeChange && !unsavedContentChanges){
        this.currentFile = fileName;
        this.currentFileTitle = currentFileTitle;
        if(fileName !== 'colors'){
          this.store.dispatch(loadFileContent({fileName:this.currentFile}))
        } else {
          this.store.dispatch(loadColorsContent({fileName:'colors'}))
        }
      }
    }
  }

  confirmModalSelectFile(){
    this.currentFile = this.clickedElBeforeModalConfirm;
    this.currentFileTitle = this.clickedElBeforeModalConfirm.charAt(0).toUpperCase() + this.clickedElBeforeModalConfirm.slice(1);
    this.hideUnsavedChangesModal()

    if (this.clickedElBeforeModalConfirm !== 'colors') {
      this.store.dispatch(loadFileContent({fileName: this.clickedElBeforeModalConfirm}))
    }

    this.store.dispatch(unsavedChangesSetDefault())
    this.store.dispatch(schemeColorsChangesSetDefault())
  }

  restoreStyle(): void {

    this.restoreButtonConfirm.addEventListener('click', ()=>{
      this.restoreStyleType = document.querySelector('input[name = "restore-confirm-radio"]:checked')

      if (this.restoreStyleType.value === "activeTab") {

        if (this.currentFile === 'colors') {

          this.colorsService.restoreColorScheme(this.currentScheme).subscribe((restoreResponse: any) => {
            if (restoreResponse) {
              if (restoreResponse.status === true) {
                this.store.dispatch(loadSchemeColorData({schemeName: this.currentScheme, schemeType: this.currentSchemeType}))
                this.colorsService.getColors().subscribe(colorsSchemes =>{
                  this.store.dispatch(loadSchemePreviewResponse({colorPreview: colorsSchemes}))
                })
                this.store.dispatch(loadColorDropdown({update: true}))
                this.successNoti(restoreResponse)

              } else {
                this.errorNoti(restoreResponse)
              }

              $("#restoreDefaultModal").modal("hide");
            }

          });
        } else {
          this.colorsService.restoreStyle(this.currentFile).subscribe((restoreResponse: any) => {
            if (restoreResponse) {
              if (restoreResponse.status === true) {
                this.store.dispatch(loadFileContent({fileName: this.currentFile}))
                this.successNoti(restoreResponse)
              } else {
                this.errorNoti(restoreResponse)
              }
              $("#restoreDefaultModal").modal("hide");
            }
          });
        }
      } else {
        this.colorsService.restoreAllStyle().subscribe((restoreResponse: any) => {
          if (restoreResponse) {
            if (restoreResponse.status === true) {
              if(this.currentFile === 'colors'){
                this.store.dispatch(loadColorDropdown({update: true}))
                this.store.dispatch(loadSchemeColorData({schemeName: this.currentScheme, schemeType: this.currentSchemeType}))
                this.colorsService.getColors().subscribe(colorsSchemes =>{
                  this.store.dispatch(loadSchemePreviewResponse({colorPreview: colorsSchemes}))
                })
                
              } else {
                this.store.dispatch(loadColorDropdown({update: true})) 
                
                this.store.dispatch(loadFileContent({fileName: this.currentFile}))
              }

              this.successNoti(restoreResponse)
            } else {
              this.errorNoti(restoreResponse)
            }

            $("#restoreDefaultModal").modal("hide");
          }
        });
      }
    })
  }


  initUnsavedChangesModal(){
    this.store.pipe(select(selectUnsavedChanges)).subscribe(unsavedChangesExist => {
      this.store.pipe(select(selectSchemeColorsChanges)).subscribe(unsavedSchemeColors => {
        this.unsavedChanges = new unsavedChanges()
        if (unsavedChangesExist || unsavedSchemeColors) {
          this.unsavedChanges.bindEvents()
        } else if((!unsavedChangesExist && this.unsavedChanges) && (!unsavedSchemeColors && this.unsavedChanges) ) {
          this.unsavedChanges.unbindEvents()
        }
      })
    })


  }

  hideUnsavedChangesModal(){
    if (this.unsavedChanges) {
      this.unsavedChanges.modal.modal('hide')
    }
  }

  checkIsModalOpen(){
    if (this.unsavedChanges.modal.hasClass('show')) {
      return true
    } else {
      return false
    }
  }

  successNoti(response){
    window.luNotification({
      size:'md',
      status: 'success',
      title: 'Success',
      body: response.text,
    });
  }

  errorNoti(response){
    window.luNotification({
      size:'md',
      status: 'danger',
      title: 'Error',
      body: response.text,
    });
  }

}
