var navPageActiveAdminx = "addonsPageMenuAdminx";
jQuery(document).ready(function(){
    jQuery("#"+navPageActiveAdminx).find("a").eq("0").trigger('click');
    adminxSettingSubNavigation();
});
function adminxSettingSubNavigation(){
    var adminxPageUrlGet = window.location.href.substr(window.location.href.lastIndexOf("/")+1);
    var adminxFriendlyUrl = jQuery(location).attr('pathname')+jQuery(location).attr('search');
    jQuery("ul.adminx-nav-list li a").each(function(){
        if((jQuery(this).attr("href") ==  decodeURI(adminxPageUrlGet)) || (jQuery(this).attr("href") == decodeURI(adminxFriendlyUrl))){
            if(jQuery(this).parent("li").parent("ul").hasClass("parent-sub-nav")){
                if(!jQuery(this).parent("li").parent("ul").parent("li").hasClass("home-menu-adminx")){
                    jQuery(this).parent("li").parent("ul").parent("li").addClass("active");
                    jQuery(this).parent("li").parent("ul").addClass("nav-menu-open");
                    jQuery(this).parent("li").parent("ul").slideDown();
                    jQuery(this).parent("li").addClass("active");
                }
            }else{
                jQuery(this).parent("li").addClass("active");
            }
        }
    });
}