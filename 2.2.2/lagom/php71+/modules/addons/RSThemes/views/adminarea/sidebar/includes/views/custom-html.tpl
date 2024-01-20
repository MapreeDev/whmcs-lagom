<div class="col-md-12">
    <div class="form-group">
        <label class="form-label">HTML
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.html}
        </label>
        <textarea class="form-control" name="items[{$parent}][{$index}][html]" rows="10" data-menu-html-editor>{$content['html']}</textarea>
    </div>
</div>
<input class="translation-{$parent}-{$index}" type="hidden" name="items[{$parent}][{$index}][translation]" value="{$customTranslation}">
