import { createFeatureSelector, createSelector } from '@ngrx/store';
import * as fromColors from '../colors/color.state';

export const selectColorState = createFeatureSelector<fromColors.ColorState>(
  fromColors.colorsFeatureKey
);

// export const selectColorsDropdown = createSelector(
//   selectColorState,
//   (state: fromColors.ColorState) => {
//     if(state.currentScheme && state.dropdownColorsData && state.dropdownColorsData[state.currentScheme]){
//       return state.dropdownColorsData[state.currentScheme]
//     }
//   }
// );

export const selectColorsDropdown = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.dropdownColorsData.data
);

export const selectSchemesColorsDropdown = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.dropdownColorsData
);

export const selectColorIsLoading = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.isLoading
);

export const selectFontsDropdown = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.dropdownFontsData.data
);

export const selectFontsIsLoading = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.isLoading
);

export const selectFileName = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.fileName
);

export const selectFileContent = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.fileContent
);

export const selectCurrentFileContent = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => {
    if(state.fileContent && state.fileContent[state.fileName]){
      return state.fileContent[state.fileName]
    }
  }
);

export const selectColorPreview = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.colorPreview
);

export const selectColorSchemeData = createSelector(
  selectColorState,
  (state: fromColors.ColorState) =>  state.colorSchemeData
);

export const selectCurrentColorSchemeData = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => {
    if(state.currentScheme && state.colorSchemeData){
      return state.colorSchemeData[state.currentScheme]
    }
  }
);

export const selectColorConfig = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => [{
    name: state.currentScheme,
    type: state.currentSchemeType,
    colors: state.colorPreview
  }]
);

export const selectActivatedScheme = createSelector(
  selectColorState, (state: fromColors.ColorState) => state.colorPreview.is_active
)

export const selectFontsConfig = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => [{
    name: state.currentScheme,
    type: state.currentSchemeType
  }]
);

export const selectCurrentScheme = createSelector(
  selectColorState,
  (state: fromColors.ColorState) => state.currentScheme
)

export const selectUnsavedChanges = createSelector (
  selectColorState,
  (state: fromColors.ColorState) => state.unsavedContentChanges
);

export const selectSchemeColorsChanges = createSelector (
  selectColorState,
  (state: fromColors.ColorState) => state.unsavedColorsSchemeChange
);

export const selectClickedElementBeforeConfirmModal = createSelector (
  selectColorState,
  (state: fromColors.ColorState) => state.clickedElementBeforeConfrimModal
);
