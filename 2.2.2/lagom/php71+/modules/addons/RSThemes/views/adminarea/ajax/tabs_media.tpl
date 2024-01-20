{assign var="iconLocation" value="./../../../assets/svg-icons"}
{assign var="iconsPath" value="./../../../../../../templates/{$template->getMainName()}/assets/svg-icon"}
{assign var="ilustrationPath" value="./../../../../../../templates/{$template->getMainName()}/assets/svg-illustrations"}
{assign var="imagesPath" value="{$whmcsURL}/templates/{$template->getMainName()}/assets/img"}
{foreach $media as $media_img}
    <label class="media__item media__item--lg" data-media-item="{$media_img['filename']}" data-toggle="lu-tooltip" data-title="{$media_img['filename']}">
        {*media_img['extension'] to get file extension*}
        {* <div class="media__item-content"> *}
            {if $media_img['type'] == 'custom'}
                <div class="media__item-icon">
                    <img src="{$imagesPath}/page-manager/{$media_img['filename']}" alt="{$media_img['filename']}">
                </div>
                <input class="media__item-input media-icon" type="radio" name="item[media]" value="{$media_img['filename']}">
            {elseif $media_img['type'] == 'default'}
                <div class="media__item-icon">
                    <img src="{$imagesPath}/page-manager/default/{$media_img['filename']}" alt="{$media_img['filename']}">
                </div>
                <input class="media__item-input media-icon" type="radio" name="item[media]" value="default/{$media_img['filename']}">
            {/if}
            <span class="media__item-border"></span>
            <span class="media__item-label"></span>
            {* <div class="media__item-footer">
                <span class="media__item-filename">{$media_img['filename']}</span>
            </div> *}
        {* </div> *}
    </label>
{/foreach}
{include file="./../includes/media/no-data.tpl"}