{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else} 
    {include file="orderforms/$carttpl/common.tpl"}
    {if trim(strtolower($errortitle)) == "outofstock" && $product_restock_notifierAddonIsActive}
        {$redir = "m=product_restock_notifier&pid=$pid"}
        {redir($redir)}
    {else}
        <div class="message message-danger message-lg">
            <div class="message-icon">
                <i class="lm lm-close"></i>
            </div>
            <h2 class="message-title">{$errortitle}</h2>
            <p class="message-desc">{$errormsg}</p>
                <div class="message-actions">
                <a href="javascript:history.go(-1)" class="btn btn-primary">
                    {$LANG.problemgoback}
                </a>
            </div>
        </div>
    {/if}
{/if}