{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}  
    {if empty($dlcats)}
        <div class="message message-no-data">
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="downloads"}
            </div>
            <h6 class="message-title">{$LANG.downloadsnone}</h6>
        </div>
    {else}
        <div class="search-box search-box-{$searchBoxStyle}">
            <form role="form" method="post" action="{routePath('download-search')}">
                <div class="search-group">
                    <div class="search-field search-field-lg">
                        <i class="search-field-icon lm lm-search"></i>
                        <input class="form-control form-control-lg" type="text" name="search" id="inputDownloadsSearch"  placeholder="{$LANG.downloadssearch}" />
                    </div>
                    <div class="search-group-btn">
                        <button class="btn btn-lg btn-primary{if $searchBoxStyle == 'primary'}-faded{/if}" type="submit" id="btnDownloadsSearch"/>{$LANG.search}</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.downloadscategories}</h2>
            </div>
            <div class="section-body">
                {if $dlcats}
                    <div class="list-group">
                        {foreach $dlcats as $dlcat}  
                            <a class="list-group-item has-icon" href="{routePath('download-by-cat', $dlcat.id, $dlcat.urlfriendlyname)}">
                                <i class="list-group-item-icon lm lm-folder"></i>
                                <div class="list-group-item-body">
                                    <div class="list-group-item-heading">{$dlcat.name} ({$dlcat.numarticles})</div>
                                    {if $dlcat.description}<p class="list-group-item-text">{$dlcat.description}</p>{/if}
                                </div>
                            </a>
                        {/foreach}
                    </div>
                {else}
                    <div class="message message-no-data">
                        <div class="message-image">
                            {include file="$template/includes/common/svg-icon.tpl" icon="downloads"}
                        </div>
                        <h6 class="message-title">{$LANG.downloadsnone}</h6>
                    </div>
                {/if}
            </div>
        </div>
        {if $mostdownloads}
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.downloadspopular}</h2>
                </div>  
                <div class="section-body">
                    <div class="list-group list-group-sm">
                        {foreach $mostdownloads as $download} 
                            <a class="list-group-item has-icon" href={$download.link}">
                                <i class="list-group-item-icon ls ls-document"></i>
                                <div class="list-group-item-body">
                                    <div class="list-group-item-heading">{$download.title} {if $download.clientsonly}<i class="ls ls-padlock text-faded"></i> {/if}</div>
                                    <p class="list-group-item-text">{$download.filesize}<i class="ls ls-bullet-small"></i>{$download.description}</p>
                                </div>
                            </a>
                        {/foreach}
                    </div>
                </div>
            </div>
        {/if}
    {/if}
{/if}