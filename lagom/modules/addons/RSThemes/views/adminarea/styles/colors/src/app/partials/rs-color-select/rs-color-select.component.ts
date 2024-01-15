import { AfterViewInit, Component, Renderer2, ElementRef, EventEmitter, Input, OnInit, Output, ViewChild, HostListener} from '@angular/core';
import { select, Store } from "@ngrx/store";
import { selectColorIsLoading, selectColorsDropdown, selectFontsDropdown, selectUnsavedChanges } from "../../store/colors/color.selector";
import { Observable } from "rxjs";
import { ColorsService } from "../../services/colors.service";
import { unsavedChangesExist } from 'src/app/store/colors/color.actions';
import { NgSelectComponent } from '@ng-select/ng-select';
@Component({
  selector: 'app-rs-color-select',
  templateUrl: './rs-color-select.component.html',
  styleUrls: ['./rs-color-select.component.scss'],
})



export class RsColorSelectComponent implements OnInit, AfterViewInit {
  isLoading$: Observable<boolean> = this.store.pipe(select(selectColorIsLoading));
  fontList$: Observable<boolean> = this.store.pipe(select(selectFontsDropdown));
  colorsList$: Observable<boolean> = this.store.pipe(select(selectColorsDropdown));

  @ViewChild('colorSelect') ngselect: NgSelectComponent;  
    
  @Input() form;
  @Input() sectionName: string;
  @Input() sectionField;

  @Output() valueChange = new EventEmitter;

  public togglePicker: boolean = false;
  public colorPickerValue: any;
  public colorPreviewValue: any;
  public tmpName:  boolean = false;
  public selectTab: string = 'predefined'
  public gradientColorValue: any;
  public colorDropdown: any;
  public isDropdownOpen: boolean = false;
  public showDropdownList: boolean = false;
  items$;
  fontsItems$;
  colorsPalete$;

  constructor(
    private store: Store,
    private colorService: ColorsService,
    private eRef: ElementRef
  ) {
    
  }
  
  
  ngOnInit(): void {
    if (this.sectionField?.description?.var_group) {
      this.items$ = this.colorService.getGroupItems(this.sectionField?.description?.var_group);
    }else if (this.sectionField?.description?.type === 'font') {
      this.fontsItems$ = this.fontList$
    }
    else {
      this.items$ = this.colorsList$
    }
    this.colorsPalete$ = this.colorsList$

  }
  ngAfterViewInit():void{
      this.setGradientToPreview()
  }

  asIsOrder(a, b) {
    return 1;
  }

  changeColorValue($value, $type?, $colorsPalete?) {

    if ($type === 'update_form_from_picker') {
      this.colorPickerValue = $value;
      this.form['controls'][this.sectionField?.description?.section]['controls'][this.sectionField.variable.name].patchValue($value);

      if(this.eRef.nativeElement.querySelector('.rs-color-predefined').classList.contains('is-active')){
        this.eRef.nativeElement.querySelector('.rs-color-predefined').classList.remove('is-active')
        this.eRef.nativeElement.querySelector('.rs-color-input').classList.add('is-active')
      }

    } else if ($type === 'update_form_from_predefined') {
      this.tmpName = $value.name

      if (this.sectionField?.description?.var_group) {
        this.colorPickerValue = $colorsPalete[$value.value]?.value
      } else {
        if ($value.gradient === false) {
          this.colorPickerValue = $value?.value
        } else {
          if ($value.gradient[2] === 'horizontal'){
            this.colorPickerValue = `linear-gradient(90deg, ${$colorsPalete[$value.gradient[0]].value}  0%, ${$colorsPalete[$value.gradient[1]].value} 100% )`
          } else if ($value.gradient[2] === 'vertical'){
            this.colorPickerValue = `linear-gradient(0deg, ${$colorsPalete[$value.gradient[0]].value}  0%, ${$colorsPalete[$value.gradient[1]].value} 100% )`
          }
        }
      }

      if(this.eRef.nativeElement.querySelector('.rs-color-input').classList.contains('is-active')){
        this.eRef.nativeElement.querySelector('.rs-color-input').classList.remove('is-active')
        this.eRef.nativeElement.querySelector('.rs-color-predefined').classList.add('is-active')
      }

      this.isDropdownOpen = false;
    }
    this.changesDetect()

  }

  setInputValue($event) {
    this.colorPickerValue= $event.target.value
    this.form['controls'][this.sectionField?.description?.section]['controls'][this.sectionField.variable.name].patchValue(this.colorPickerValue);
    this.changesDetect()
  }

  changesDetect(){
    this.store.dispatch(unsavedChangesExist())
  }

  selectDropdownTab(tabName: string): void {
    this.selectTab = tabName;
  }

  dropdownToggle(event) {
    this.isDropdownOpen = !this.isDropdownOpen;
    this.colorDropdown = event.currentTarget.closest('.rs-style-dropdown')
    let dropdownToggler = event.currentTarget; 
   
   
    if (this.isDropdownOpen) {
      this.setDropdownPosition(dropdownToggler, this.colorDropdown)
      setTimeout(() => {
        if(this.ngselect && !this.showDropdownList)
          this.showDropdownList = true;
          this.ngselect.open();
          this.ngselect.dropdownPanel.outsideClick.isStopped = true;
       }, 1);
    } else if (!this.isDropdownOpen && this.showDropdownList) {
      this.showDropdownList = false
      this.resetDropdownPosition(this.colorDropdown)
    } 
  }

  setDropdownPosition(dropdownToggler, dropdownMenu) {
    let viewportOffset = dropdownToggler.getBoundingClientRect()
    if ((window.innerHeight / 2) < viewportOffset.top) {
      dropdownMenu.classList.add('dropup')
    } else {
      dropdownMenu.classList.add('dropdown')
    }
  }

  resetDropdownPosition(dropdownMenu) {
    if (dropdownMenu.classList.contains('dropup')) {
      dropdownMenu.classList.remove('dropup')
    } else if (dropdownMenu.classList.contains('dropdown')) {
      dropdownMenu.classList.remove('dropdown')
    }
  } 

  hideDropdown(e) { 
    if (this.isDropdownOpen && this.showDropdownList) {
      this.isDropdownOpen = false;
      this.showDropdownList = false;
      this.resetDropdownPosition(this.colorDropdown)
    } 
  }

  setGradientToPreview(){ 
    if(this.ngselect){
      let selectedGradient = this.ngselect.element.querySelector('.ng-value-label [data-active-option-gradient]')
      if(selectedGradient){
        let gradientStyle = selectedGradient.getAttribute('style')
        let gradientPreview = selectedGradient.closest('.rs-select-value--colors').querySelector<HTMLElement>('.rs-color-preview')
        gradientPreview.setAttribute('style', `${gradientStyle}`)
      }
    }
  }

}
