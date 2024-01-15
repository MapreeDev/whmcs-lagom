import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { IndexComponent } from './pages/index/index.component';
import { ColorsManagerComponent } from './pages/colors-manager/colors-manager.component';
import { RsColorInputComponent } from './partials/rs-color-input/rs-color-input.component';
import { ColorPickerModule } from 'ngx-color-picker';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgxSkeletonLoaderModule } from 'ngx-skeleton-loader';
import { AdvancedComponent } from './pages/colors-manager/files/colors/advanced/advanced.component';
import { DynamicViewsComponent } from './pages/colors-manager/files/dynamic-views/dynamic-views.component';
import { RsColorSelectComponent } from './partials/rs-color-select/rs-color-select.component';
import { NgSelectModule } from '@ng-select/ng-select';
import { StoreModule } from '@ngrx/store';
import { DEFAULT_ROUTER_FEATURENAME, routerReducer, StoreRouterConnectingModule } from '@ngrx/router-store';
import { StoreDevtoolsModule } from '@ngrx/store-devtools';
import { environment } from '../environments/environment';
import { colorsFeatureKey } from "./store/colors/color.state";
import { colorReducer } from "./store/colors/color.reducer";
import { ColorEffect } from "./store/colors/color.effect";
import { EffectsModule } from '@ngrx/effects';
import { ReactiveComponentModule } from '@ngrx/component';
import { ColorsComponent } from './pages/colors-manager/files/colors/colors.component';
import { NgbDropdownModule, NgbModalModule, NgbTooltipModule } from '@ng-bootstrap/ng-bootstrap';
import { ClickOutsideDirective } from '../app/helpers/click-outside.directive';

const storeReducers: { [key: string]: any } = {};
storeReducers[DEFAULT_ROUTER_FEATURENAME] = routerReducer;
storeReducers[colorsFeatureKey] = colorReducer

@NgModule({
  declarations: [
    AppComponent,
    ClickOutsideDirective,
    IndexComponent,
    ColorsManagerComponent,
    RsColorInputComponent,
    AdvancedComponent,
    DynamicViewsComponent,
    RsColorSelectComponent,
    ColorsComponent,
  ],
  imports: [
    CommonModule,
    BrowserModule,
    AppRoutingModule,
    ColorPickerModule,
    HttpClientModule,
    ReactiveFormsModule,
    NgxSkeletonLoaderModule,
    FormsModule,
    NgSelectModule,
    StoreModule.forRoot(storeReducers, {
      runtimeChecks: {
        strictStateImmutability: false,
        strictStateSerializability: false,
      },
    }),
    !environment.production ? StoreDevtoolsModule.instrument() : [],
    EffectsModule.forRoot([ColorEffect]),
    StoreRouterConnectingModule.forRoot(),
    StoreDevtoolsModule.instrument({ maxAge: 25, logOnly: environment.production }),
    ReactiveComponentModule,
    NgbDropdownModule,
    NgbModalModule,
    NgbTooltipModule,
  ],
  providers: [
    { provide: Window, useValue: window }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
