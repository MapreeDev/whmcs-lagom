{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}	     
    {include file="$template/includes/tablelist.tpl" tableName="EmailsList" noSortColumns="-1"}
    <script type="text/javascript">
        jQuery(document).ready( function ()
        {
            var table = jQuery('#tableEmailsList').removeClass('hidden').DataTable();
            {if $orderby == 'date'}
                table.order(0, '{$sort}');
            {elseif $orderby == 'subject'}
                table.order(1, '{$sort}');
            {/if}
            table.draw();
			 
			jQuery('.table-container').removeClass('loading');
            jQuery('#tableLoading').addClass('hidden');
        });
    </script>
    <div class="table-container loading clearfix">
        <table id="tableEmailsList" class="table table-list">
            <thead>
                <tr>
                    <th>{$LANG.clientareaemailsdate}<span class="sorting-arrows"></span></th>
                    <th>{$LANG.clientareaemailssubject}<span class="sorting-arrows"></span></th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$emails item=email}
                <tr onclick="popupWindow('viewemail.php?id={$email.id}', 'emailWin', '650', '450')">
                    <td class=""><span class="hidden">{$email.normalisedDate}</span>{$email.date}</td>
                    <td><a href="">{if $email.attachmentCount > 0}<i class="fal fa-paperclip"></i> {/if}{$email.subject}</a></td>
                </tr>
                {/foreach}
            </tbody>
        </table>
        <div class="loader loader-table" id="tableLoading">
            {include file="$template/includes/common/loader.tpl"}    
        </div>
    </div>
{/if}    