import { createAction, props } from '@ngrx/store';
import { ColorsProperties } from "../../model/colorsProperties";

export const loadFontsDropdown = createAction(
  '[Colors API] Load fonts dropdown',
  props<{ update: boolean}>()
);

export const loadFontsDropdownResponse = createAction(
  '[Colors API] Load fonts Response',
  props<{ data: any}>()
);

export const loadColorDropdown = createAction(
  '[Colors API] Load colors dropdown',
  props<{ update: boolean}>()
);

export const loadColorDropdownResponse = createAction(
  '[Colors API] Load colors Response',
  props<{ data: any }>()
);

export const loadFileContent = createAction(
  '[Colors API] Load file content',
  props<{ fileName: string}>()
);

export const loadColorsContent = createAction(
  '[Colors API] Load colors content',
  props<{ fileName: string}>()
);

export const loadFileContentResponse = createAction(
  '[Colors API] Load file content Response',
  props<{ fileContent: any; fileName: string}>()
);

export const loadSchemePreview = createAction(
  '[Colors API] Load color preview',
  props<{schemeName?: string}>()
);

export const loadSchemePreviewResponse = createAction(
  '[Colors API] Load color preview Response',
  props<{colorPreview: any}>()
);

export const loadSchemeColorData = createAction(
  '[Colors API] Load color scheme data',
  props<{ schemeName: string; schemeType: string}>()
);

export const loadSchemeColorDataResponse = createAction(
  '[Colors API] Load color scheme data Response',
  props<{ schemeName: string; colorSchemeData: any}>()
);

export const saveColorScheme = createAction(
  '[Colors API] Save color scheme',
  props<{ colorSchemeData: ColorsProperties[]}>()
);

export const loadColorFieldUpdate = createAction(
  '[Colors API] Update color field',
  props<{ colorItem: any, section: string}>()
);

export const loadRestoreColorScheme = createAction(
  '[Colors API] Restore color scheme',
);

export const saveFileContent = createAction(
  '[Colors API] Save file content',
  props<{ colorSchemeData: ColorsProperties[]; fileContent: any;}>()
)

export const sendColorsUpdatedForm = createAction(
  '[Colors API] Send color updated form',
  props<{ colorSchemeData: ColorsProperties[]}>()
);

export const unsavedChangesExist = createAction(
  '[Colors API] File content change',
)

export const unsavedChangesSetDefault = createAction(
  '[Colors API] File content changes set default',
)

export const schemeColorsChangesExist = createAction(
  '[Colors API] Scheme colors change',
)

export const schemeColorsChangesSetDefault = createAction(
  '[Colors API] Scheme colors changes set default',
)

export const changeDynamicView = createAction(
  '[Colors API] Change dynamic view',
  props<{ fileName }>()
);

export const changeDynamicViewResponse = createAction(
  '[Colors API] Change dynamic view response',
);

export const setDataToSave = createAction(
  '[Colors API] Set data to save',
  props<{schemeName: string; dataToSave: any}>()
)

export const clickElementBeforeConfirmModal = createAction(
  '[Colors API] Click on nav or scheme',
  props<{clickedElement: any}>()
)
