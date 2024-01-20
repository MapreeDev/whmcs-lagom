import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { catchError, share, shareReplay } from "rxjs/operators";
import { selectQueryParams } from '../store/router/router.selectors';
import { select, Store } from '@ngrx/store';

declare global {
  interface Window {
    whmcsURL?: any;
  }
}

const CACHE_SIZE = 1;

@Injectable({
  providedIn: 'root'
})
export class ColorsService {
  private cache$ = [];
  // apiUrl = `http://dev9.rsstudio.net/modules/addons/RSThemes/src/Api/adminApi.php?controller=ColorApi&method=`;
  templateName;
  apiUrl = '';
  

  constructor(
    private http: HttpClient,
    private store: Store,
  ) {
    this.getTemplateName()
    this.setApiUrl()
  }

  getTemplateName() {
    let urlStr = window.location.href
    let url = new URL(urlStr);
    this.templateName = url.searchParams.get('templateName')
  }

  setApiUrl() {
    this.store.pipe(select(selectQueryParams)).subscribe(data => {
      if(data){
        this.apiUrl = `${window.whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=ColorApi&templateName=${this.templateName}&theme=${data.styleName}&method=`;
      }
    })
  }

  // Get colors (all scheme)
  getColors() {
    return this.http
      .get(`${this.apiUrl}getColors`);
  }

  // Get fonts
  getFonts() {
    return this.http
      .get(`${this.apiUrl}getFonts`);
  }

  // Get preview scheme data
  getSchemeValues(scheme: string, type?: string) {
    return this.http
      .get(`${this.apiUrl}getColors&scheme=${scheme}&type=${type}`);
  }

  // Save color data simple / advanced
  saveSchemeColors(scheme: string, data, type) {
    return this.http.post(`${this.apiUrl}saveColor&scheme=${scheme}&type=${type}`, {data: data})
  }

  //Send colors form when switch type. we need this when change simple color, then load colors from this form in advanced type
  sendColorsUpdatedForm(scheme: string, data, type) {
    return this.http.post(`${this.apiUrl}currentColorState&scheme=${scheme}&type=${type}&savedColors=false`, {data: data})
  }

  // Restore color scheme (schemeName: string)
  restoreColorScheme(scheme: string) {
    return this.http.get(`${this.apiUrl}restoreColor&color=${scheme}`)
  }

  // Restore dynamic views style
  restoreStyle(fileName: string) {
    return this.http.get(`${this.apiUrl}restoreStyle&style=${fileName}`)
  }

  restoreAllStyle() {
    return this.http.get(`${this.apiUrl}restoreAll`)
  }

  // Get file list in left menu (typography, general, navigation, )
  listFiles() {
    return this.http
      .get(`${this.apiUrl}getStyles`);
  }

  // get file content example: typography
  getFileContent(fileName: string) {
    if (fileName) {
      return this.http
        .get(`${this.apiUrl}getStyles&style=${fileName}`);
    }
    return;
  }

  // save file example: typography
  saveFileContent(fileName: string, data) {
    return this.http.post(`${this.apiUrl}saveStyle&style=${fileName}`, {data: data});
  }

  saveGlobalFileContent(data){
    return this.http.post(`${this.apiUrl}saveStyle`, data);
  }

  // Data in dropdown colors
  getColorsForSelect(scheme = 'default') {
    return this.http
      .get(`${this.apiUrl}getColors&scheme=${scheme}&type=select`);
  }

  getFontsForSelect() {
    return this.http
      .get(`${this.apiUrl}getFonts&type=font`);
  }

  getGroupItems(groupName: string) {
    if (!this.cache$[groupName]) {
      this.cache$[groupName] = this.getGroupResourcesItems(groupName).pipe(
        shareReplay(CACHE_SIZE)
      );
    }
    return this.cache$[groupName];
  }

  // list items assigned group name
  private getGroupResourcesItems(groupName: string) {
    return this.http
      .get(`${this.apiUrl}getGroup&group=${groupName}`);
  }
}
