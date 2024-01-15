{assign var="iconLocation" value="./../../../assets/svg-icons"}
{assign var="iconsPath" value="./../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="ilustrationPath" value="./../../../../../../templates/{$themeName}/assets/svg-illustrations"}
{assign var="imagesPath" value="{$whmcsURL}/templates/{$themeName}/assets/img"}
{foreach $template->getAllIcons() as $key => $icon}
    <label class="media__item" data-media-item="{$icon['name']}" data-toggle="lu-tooltip" data-title="{$icon['name']}">
        <div class="media__item-icon">
            {include file="{$icon.path}"}
        </div>
        <input class="media__item-input lagom-icon" type="radio" name="item[icon]" value="{$icon['name']}">
        <span class="media__item-border"></span>
        <span class="media__item-label"></span>
    </label>
{/foreach}
<div class="media__no-data msg p-3x is-hidden" data-media-no-data>
    <div class="msg__icon i-c-6x">
        {include file="$iconLocation/no-data.tpl"}
    </div>
    <div class="msg__body">
        <span class="msg__title">No media found</span>
    </div>
</div>