var GraphicConfiguration = {
    tabContainer: '.graphic-tab__container',
    radioClass:'.graphic_type',
    tabCLass: '.graphic_type--tab',
    activeClass: 'is-active',
    that: this,

    getGraphicType: function () {
        return $(this.radioClass +':checked').value;
    },
    changeGraphicTab: function(tabName){
        $(this.tabContainer).find(this.tabCLass).removeClass(this.activeClass);
        $(this.tabCLass + '[data-value="'+tabName+'"]').addClass(this.activeClass)
    }
};

$(GraphicConfiguration.radioClass).on('change', function() {
    GraphicConfiguration.changeGraphicTab(this.value);
});
