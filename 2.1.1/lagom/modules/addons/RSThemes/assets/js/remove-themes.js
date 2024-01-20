/* Remove Lagom Theme from General Settings if Lagom license is not active*/

$(document).ready(function(){
    let themes = $('head').find('[data-lagom-templates]');
    if (themes.length){
        var themesList = themes.data('lagom-templates');
        themesList = themesList.split(',');
    }
    if (themesList.length){
        themesList.forEach(function(template, index){
            $('form[name="configfrm"] select[name="template"] option[value="'+template+'"]').remove();                
            $('form[name="configfrm"] input[type="radio"][name="orderformtemplate"][value="'+template+'"]').parent().parent().remove();  
        });
    }
});