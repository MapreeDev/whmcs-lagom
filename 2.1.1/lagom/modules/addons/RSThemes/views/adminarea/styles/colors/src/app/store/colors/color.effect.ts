import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { map, mergeMap, switchMap, withLatestFrom } from 'rxjs/operators';
import { Store, select } from '@ngrx/store';
import {
  loadColorDropdown,
  loadColorDropdownResponse,
  loadFontsDropdown,
  loadFontsDropdownResponse,
  loadFileContent,
  loadFileContentResponse, loadRestoreColorScheme,
  loadSchemeColorData,
  loadSchemeColorDataResponse,
  loadSchemePreview, loadSchemePreviewResponse, saveColorScheme,
  sendColorsUpdatedForm,
  saveFileContent,
  unsavedChangesSetDefault,
} from "./color.actions";
import {
  selectColorConfig,
  selectFontsConfig,
  selectColorSchemeData,
  selectColorsDropdown,
  selectFontsDropdown,
  selectFileContent,
} from "./color.selector";
import { ColorsService } from "../../services/colors.service";
import { of } from "rxjs";

@Injectable()
export class ColorEffect {

  loadFontsDropdown$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadFontsDropdown),
      withLatestFrom(this.store.pipe(select(selectFontsDropdown)), this.store.pipe(select(selectFontsConfig))),
      switchMap(([action, fonts, options]) => {
          if (fonts === null || action.update) {
            return this.colorService.getFontsForSelect().pipe(
              map((data) =>
                loadFontsDropdownResponse({data: data})
              ),
            );
          }
          return of(loadFontsDropdownResponse({data: fonts}));
        }
      ),
    ),
  );

  loadColorsDropdown$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadColorDropdown),
      withLatestFrom(this.store.pipe(select(selectColorsDropdown)), this.store.pipe(select(selectColorConfig))),
      switchMap(([action, colors, options]) => {
        if (colors === null || action.update) {
            return this.colorService.getColorsForSelect(options[0].colors.is_active).pipe(
              map((data) =>
                loadColorDropdownResponse({data: data})
              ),
            );
          }
          return of(loadColorDropdownResponse({data: colors}))
        }
      ),
    ),
  );

  loadFileContent$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadFileContent),
      withLatestFrom(this.store.pipe(select(selectFileContent))),
      switchMap(([action, content]) => {
        // if (content && content[action.fileName]) {
        //   return of(loadFileContentResponse({fileContent: content[action.fileName], fileName: action.fileName}));
        // } else { }
        return this.colorService.getFileContent(action.fileName).pipe(
          map((data) =>
            loadFileContentResponse({fileContent: data, fileName: action.fileName})),
        );
      }),
    ),
  );

  loadSchemePreview$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadSchemePreview),
      withLatestFrom(this.store.pipe(select(selectColorConfig))),
      switchMap(([action, content]) => {
        // if (content[0].colors) {
        //   let colorName;
        //   if (action.schemeName === 'init') {
        //     //@ts-ignore
        //     colorName = content[0].colors.is_active;
        //   } else {
        //     colorName = action.schemeName;
        //   }
        //   return [
        //     loadSchemePreviewResponse({colorPreview: content[0].colors}),
        //     loadSchemeColorData({schemeName: colorName, schemeType: content[0].type})
        //   ]
        // } else {
            return this.colorService.getColors().pipe(
              mergeMap((data) => {
                let colorName;
                if (action.schemeName === 'init') {
                  //@ts-ignore
                  colorName = data.is_active;
                } else {
                  colorName = action.schemeName;
                }
                if (data) {
                  return [
                    loadSchemePreviewResponse({colorPreview: data}),
                    loadSchemeColorData({schemeName: colorName, schemeType: content[0].type}),
                  ]
                }
              }),
            );
          // }
        }
      ),
    ),
  );

  loadColorSchemeData$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadSchemeColorData),
      withLatestFrom(this.store.pipe(select(selectColorSchemeData))),
      switchMap(([action, content]) => {
        // if (content && content[action.schemeName]){
        //   return of(loadSchemeColorDataResponse({schemeName: action.schemeName, colorSchemeData: content[action.schemeName]}))
        // } else {}
        return this.colorService.getSchemeValues(action.schemeName, action.schemeType).pipe(
          mergeMap((data) => [
              loadSchemeColorDataResponse({schemeName: action.schemeName, colorSchemeData: data})
            ]
          ),
        );
      }),
    ),
  );

  saveColorScheme$ = createEffect(() =>
    this.actions$.pipe(
      ofType(saveColorScheme),
      withLatestFrom(this.store.pipe(select(selectColorConfig))),
      switchMap(([payload, config]) => {
          return this.colorService.saveSchemeColors(config[0].name, payload.colorSchemeData, config[0].type).pipe(
            map(() => {
              return loadSchemeColorData({schemeName: config[0].name, schemeType: config[0].type}), loadColorDropdown({update: true}), unsavedChangesSetDefault();
            })
          )
        }
      ),
    ),
  );

  restoreColorScheme$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadRestoreColorScheme),
      withLatestFrom(this.store.pipe(select(selectColorConfig))),
      switchMap(([payload, config]) => {
          return this.colorService.restoreColorScheme(config[0].name).pipe(
            mergeMap(() => {
              return [loadSchemeColorData({schemeName: config[0].name, schemeType: config[0].type})]
            })
          )
        }
      ),
    ),
  );

  sendColorsUpdatedForm$ = createEffect(() =>
    this.actions$.pipe(
      ofType(sendColorsUpdatedForm),
      withLatestFrom(this.store.pipe(select(selectColorConfig))),
      switchMap(([payload, config]) => {
          return this.colorService.sendColorsUpdatedForm(config[0].name, payload.colorSchemeData, config[0].type).pipe(
            map(() => {
              return loadSchemeColorData({schemeName: config[0].name, schemeType: config[0].type}), loadColorDropdown({update: false});
            })
          );
        }
      ),
    ),
  );

  saveFileContent$ = createEffect(() =>
    this.actions$.pipe(
      ofType(saveFileContent),
      withLatestFrom(this.store.pipe(select(selectFileContent)), this.store.pipe(select(selectColorSchemeData))),
      switchMap(([payload, contentFile, contentColors]) => {
          return this.colorService.saveGlobalFileContent({contentFile, contentColors}).pipe(
            map(() => {
              return loadFileContentResponse({fileName: contentFile.fileName, fileContent: contentFile})
            })
          );
        }
      ),
    ),
  );

  constructor(
    private actions$: Actions,
    private store: Store,
    private colorService: ColorsService
  ) {}
}
