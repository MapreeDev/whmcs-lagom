import { FormControl, FormGroup } from "@angular/forms";

export const generateForm = (config, data) => {
  config.form = config.fb.group({});
  config.formFields = data;

  for (let [sectionName, sectionValues] of Object.entries(data)) {
    config.form.addControl(sectionName, config.fb.group({}));
    for (let itemValue of Object.values(sectionValues)) {
      if(typeof itemValue === 'object' && itemValue !== null && itemValue !== 'hidden'){
        oneSection(sectionName, config.form).addControl(
          itemValue.variable.name, new FormControl(itemValue.variable.value, []));
      }

    }

  }
  return config;
}

export const oneSection = (sectionName: string, form: FormGroup):FormGroup => {
  return form.get(sectionName) as FormGroup
}

export const getColorVarName = (colorVariable: string): string => {
  if (colorVariable.includes('var(-')) {
    return colorVariable.slice(4, -1);
  } return;
}
