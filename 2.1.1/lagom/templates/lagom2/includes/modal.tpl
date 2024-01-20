{if file_exists("templates/$template/includes/overwrites/modal.tpl")}
    {include file="{$template}/includes/overwrites/modal.tpl"}  
{else}
    <div class="modal fade" id="modal{$name}">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="modal{$name}Title">
                        {$title}
                    </h4>
                </div>
                <div class="modal-body text-center hidden" id="modal{$name}Loader">
                    <div class="loader">{include file="$template/includes/common/loader.tpl"}</div>
                </div>
                <div class="modal-body" id="modal{$name}Body">
                    {if isset($content)}
                        <p>{$content}</p>
                    {/if}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {if isset($closeLabel)}
                            {$closeLabel}
                        {else}
                            {$LANG.closewindow}
                        {/if}
                    </button>
                    {if isset($submitAction)}
                        <button type="button" class="btn btn-primary" onclick="{$submitAction}">
                            {if isset($submitLabel)}
                                {$submitLabel}
                            {else}
                                {$LANG.clientareasavechanges}
                            {/if}
                        </button>
                    {/if}
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
{/if}