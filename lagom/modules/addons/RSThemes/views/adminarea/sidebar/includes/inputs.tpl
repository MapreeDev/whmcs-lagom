<div class="inputs-container">
    <div class="item-{$parent}-{$index}-settings row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">Type {include file="adminarea/includes/helpers/tooltip.tpl" classes="self-center" tooltip=$tooltips.menu.menu_items.type}</label>
                <select 
                    class="form-control sidebar-item-type type-{$parent}-{$index} opacity-1" 
                    name="items[{$parent}][{$index}][name]" 
                    data-translation-method="{if !empty($content['translation-method'])}{$content['translation-method']}{else}custom{/if}"
                    data-ajax-url="{$helper->url('Sidebar@changeSidebarType',['templateName'=>$template->getMainName(), 'location' => $location])}"
                    data-menu-item-type="sidebar"
                    data-parent="{$parent}" 
                    data-index="{$index}" 
                    data-level="{$level}" 
                    data-whmcs-var="{$translations['whmcs']}"
                >
                    <option value="whmcs-page" {if $view === 'whmcs-page'} selected {/if}>WHMCS Page</option>
                    <option value="custom-link" {if $view === 'custom-link'} selected {/if}>Custom Link</option>
                    <option value="custom-html" {if $view === 'custom-html'} selected {/if}>Custom HTML</option>
                    <option value="predefined-list" {if $view === 'predefined-list'} selected {/if}>Predefined List</option>
                </select>
            </div>
        </div>
    </div>
    <div class="item-{$parent}-{$index}-inputs row" data-menu-item-inputs data-index="{$index}" data-parent="{$parent}">
        {include file="adminarea/sidebar/includes/views/{$view}.tpl" type=$parent}
    </div>
    <input type="hidden" class="parent-order" data-item-order name="items[{$parent}][{$index}][order]" value="{$order}">
</div>