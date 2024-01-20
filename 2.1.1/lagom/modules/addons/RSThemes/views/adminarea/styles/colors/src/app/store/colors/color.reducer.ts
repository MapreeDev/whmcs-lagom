import { createReducer, on } from '@ngrx/store';
import { initialState } from './color.state';
import {
  loadColorDropdown,
  loadColorDropdownResponse, loadColorFieldUpdate,
  loadFontsDropdown,
  loadFontsDropdownResponse,
  loadFileContent,
  loadFileContentResponse,
  loadSchemeColorData,
  loadSchemeColorDataResponse,
  loadSchemePreview,
  loadSchemePreviewResponse,
  unsavedChangesExist,
  unsavedChangesSetDefault,
  changeDynamicView,
  changeDynamicViewResponse,
  setDataToSave,
  schemeColorsChangesExist,
  schemeColorsChangesSetDefault,
  clickElementBeforeConfirmModal,
  loadColorsContent,
} from './color.actions';

export const colorReducer = createReducer(
  initialState,

  on(loadFontsDropdown, state =>
    ({...state, isLoading: true})
  ),

  on(loadFontsDropdownResponse, (state, dropdownFontsData) =>
    ({...state, dropdownFontsData, isLoading: false})
  ),

  on(loadColorDropdown, state =>
    ({...state, isLoading: true})
  ),

  on(loadColorDropdownResponse, (state, dropdownColorsData) =>
    ({...state, dropdownColorsData, isLoading: false})
  ),

  // on(loadColorDropdownResponse, (state, {schemeName, dropdownColorsData}) =>{
  //   return ({...state, dropdownColorsData: {
  //       ...state.dropdownColorsData, [schemeName]: {...dropdownColorsData},
  //    }, isLoading: false})
  // }),

  on(loadFileContent, (state, {fileName}) =>
    ({...state, fileName, isLoading: true})
  ),

  on(loadFileContentResponse, (state, {fileContent, fileName}) => {
    return ({...state, fileContent: {
          ...state.fileContent, [fileName]: {...fileContent}
    }, isLoading: false})
  }),

  on(loadSchemePreview, (state, {schemeName}) =>
    ({...state, isLoading: true, currentScheme:  schemeName})
  ),

  on(loadSchemePreviewResponse, (state, {colorPreview}) => {
    return ({
      ...state,
      colorPreview,
      isLoading: false,
      currentScheme: colorPreview.is_active
    })
  }),

  on(loadSchemeColorData, (state, {schemeName, schemeType}) => {
      return ({
        ...state,
        currentScheme: schemeName,
        currentSchemeType: schemeType,
        isLoading: true
      })
    }
  ),

  on(loadSchemeColorDataResponse, (state, {schemeName, colorSchemeData}) => {
      return ({
        ...state,
        colorSchemeData:{
          ...state.colorSchemeData, [schemeName]: {...colorSchemeData}
        },
        isLoading: false
      })
    }
  ),

  on(loadColorFieldUpdate, (state, {colorItem, section}) => {
      return ({
        ...state,
      })
    }
  ),

  on(unsavedChangesExist, state =>
    ({...state, unsavedContentChanges: true})
  ),

  on(unsavedChangesSetDefault, state =>
    ({...state, unsavedContentChanges: false})
  ),

  on(schemeColorsChangesExist, state =>
    ({...state, unsavedColorsSchemeChange: true})
  ),

  on(schemeColorsChangesSetDefault, state =>
    ({...state, unsavedColorsSchemeChange: false})
  ),

  on(changeDynamicView, state =>
    ({...state, changeDynamicView: true})
  ),

  on(changeDynamicViewResponse, state =>
    ({...state, changeDynamicView: false})
  ),
  on(loadColorsContent, (state, {fileName}) =>
    ({...state, fileName})
  ),
  on(clickElementBeforeConfirmModal, (state, {clickedElement}) =>{
    return ({
      ...state,
       clickedElementBeforeConfrimModal: clickedElement,
       })
  })

);
