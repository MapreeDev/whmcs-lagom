export const colorsFeatureKey = 'colors';

export interface ColorState {
  currentScheme: string;
  currentSchemeType: string;
  colorPreview: any;
  colorSchemeData: any;
  dropdownColorsData: any;
  dropdownFontsData: any;
  isLoading: boolean;
  fileContent: any,
  fileName: string,
  unsavedContentChanges: boolean,
  unsavedColorsSchemeChange: boolean,
  clickedElementBeforeConfrimModal: any;
}

export const initialState: ColorState = {
  currentScheme: '',
  currentSchemeType: 'advanced',
  colorPreview: null,
  colorSchemeData: null,
  dropdownColorsData: {data: null},
  dropdownFontsData: {data: null},
  isLoading: false,
  fileContent: null,
  fileName: 'colors',
  unsavedContentChanges: false,
  unsavedColorsSchemeChange:false,
  clickedElementBeforeConfrimModal: null,
};
