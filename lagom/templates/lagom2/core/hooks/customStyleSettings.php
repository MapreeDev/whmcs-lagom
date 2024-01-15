<?php
use RSThemes\Template\Template;
use \RSThemes\Template\Style;
add_hook('ClientAreaPage', 2, function($vars) {
    GLOBAL $smarty;
    $templateVars = $smarty->getTemplateVars();
	$template = new Template($templateVars['template']);
    $style = new Style($template,$template->getActiveStyle());
	$items = $style->getCustomSettings();
	$data = [];
	foreach($items['group'] as $indexGroup=>$valueGroup){
		foreach($valueGroup['styles'] as $indexItem=>$valueItem){
			$value = $valueItem['default'];
			if(isset($valueItem['value']))
				$value = $valueItem['value'];
			if(isset($valueItem['variableName']))
				$data[$valueItem['variableName'].""] = $value;
			else
				$data[$indexGroup.$indexItem.""] = $value;
		}
	}
	return $data;
});