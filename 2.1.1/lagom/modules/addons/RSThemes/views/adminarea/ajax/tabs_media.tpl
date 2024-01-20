{assign var="iconLocation" value="./../../../assets/svg-icons"}
{assign var="iconsPath" value="./../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="ilustrationPath" value="./../../../../../../templates/{$themeName}/assets/svg-illustrations"}
{assign var="imagesPath" value="{$whmcsURL}/templates/{$themeName}/assets/img"}
{foreach $media as $media_img}
    <label class="media__item media__item--lg col-md-4">
        {*media_img['extension'] to get file extension*}
        <div class="media__item-content">
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
            <div class="media__item-footer">
                <span class="media__item-filename">{$media_img['filename']}</span>
            </div>
        </div>
    </label>
{/foreach}
{if empty($media)}
    <div class="media-images__placeholder">
        <div class="msg__icon">
            {include file="$iconLocation/no-data.tpl"}
        </div>
        <div class="msg__body">
            <span class="msg__title">No images found</span>
        </div>
    </div>
{/if}