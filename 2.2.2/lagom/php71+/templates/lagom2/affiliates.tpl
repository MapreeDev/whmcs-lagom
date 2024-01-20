{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $inactive}
        {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.affiliatesdisabled textcenter=true}
    {else}
        {include file="$template/includes/flashmessage.tpl"}
        <div class="section">
            <div class="tiles swiper-container">
                <div class="row swiper-wrapper">
                    <div class="col-md-4 swiper-slide">
                        <div class="tile">
                            <div class="tile-icon-absolute">
                                <i class="lm lm-mouse"></i>
                            </div>
                            <div class="tile-stat">{$visitors}</div>
                            <div class="tile-title">{$LANG.affiliatesclicks}</div>
                        </div>
                    </div>
                    <div class="col-md-4 swiper-slide">
                        <div class="tile">
                            <div class="tile-icon-absolute">
                                <i class="lm lm-user"></i>
                            </div>
                            <div class="tile-stat">{$signups}</div>
                            <div class="tile-title">{$LANG.affiliatessignups}</div>
                        </div>
                    </div>
                    <div class="col-md-4 swiper-slide">
                        <div class="tile">
                            <div class="tile-icon-absolute">
                                <i class="lm lm-bar-graph"></i>
                            </div>  
                            <div class="tile-stat">{if $conversionrate|string_format:"%d" < 100}{$conversionrate}{else}{$conversionrate|string_format:"%.1f"}{/if}%</div>
                            <div class="tile-title">{$LANG.affiliatesconversionrate}</div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="section">
            <div class="search-box search-box-{$searchBoxStyle}">
                <div class="input-group input-group-lg flex-column-sm">
                    <div class="input-group-addon">{$LANG.affiliatesreferallink}</div>
                    <input class="form-control m-0" type="text" readonly value="{$referrallink}"> 
                </div>
            </div>
        </div>
        <div class="section">
            <div class="section-header d-flex space-between align-center m-b-2x">
                <h5 class="section-title m-b-0">{$LANG.affiliatesreferals}</h5>
                {if $referrals}
                    <div class="search-group">
                        <input type="text" class="form-control" id="table-search" placeholder="{$LANG.tableentersearchterm}"> 
                    </div>
                {/if}
            </div>
            <div class="section-body">
                {if $referrals}
                    {include file="$template/includes/tablelist.tpl" tableName="AffiliatesList" filterColumn="4"}
                    <script type="text/javascript">
                        jQuery(document).ready( function ()
                        {
                            var table = jQuery('#tableAffiliatesList').removeClass('hidden').DataTable();
                            {if $orderby == 'regdate'}
                                table.order(0, '{$sort}');
                            {elseif $orderby == 'product'}
                                table.order(1, '{$sort}');
                            {elseif $orderby == 'amount'}
                                table.order(2, '{$sort}');
                            {elseif $orderby == 'status'}
                                table.order(4, '{$sort}');
                            {/if}
                            table.draw();
                            jQuery('.table-container').removeClass('loading');
                            jQuery('#tableLoading').addClass('hidden');
                        });
                    </script>
                    <div class="table-container loading clearfix">
                        <div class="table-top">
                            <div class="d-flex">
                                <label>{$LANG.clientareahostingaddonsview}</label>
                                <div class="dropdown view-filter-btns {if $RSThemes.addonSettings.show_status_icon == 'displayed'}iconsEnabled{/if}">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        <span class="status hidden"></span>
                                        <span class="filter-name">{$rslang->trans('generals.all_entries')}</span>
                                        <i class="ls ls-caret"></i>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#"><span data-value="all">{$rslang->trans('generals.all_entries')}</span></a></li>
                                        {foreach key=num item=status from=$RSReferralsStatuses}
                                            <li><a href="#"><span class="status status-{$status.statusClass}" data-value="{$status.statustext}" data-status-class="{$status.statusClass}">{$status.statustext}</span></a></li>
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>  
                        </div>
                        <table id="tableAffiliatesList" class="table table-list">
                            <thead>
                                <tr>
                                    <th data-priority="1"><button type="button" class="btn-table-collapse"></button>{$LANG.affiliatessignupdate}</th>
                                    <th data-priority="3">{$LANG.orderproduct}</th>
                                    <th data-priority="4">{$LANG.affiliatesamount}</th>
                                    <th data-priority="5">{$LANG.affiliatescommission}</th>
                                    <th data-priority="2">{$LANG.affiliatesstatus}</th>
                                </tr>
                            </thead>
                            <tbody>
                            {foreach from=$referrals item=referral}
                                <tr class="text-center">
                                    <td><button type="button" class="btn-table-collapse"></button><span class="hidden">{$referral.datets}</span>{$referral.date}</td>
                                    <td>{$referral.service}</td>
                                    <td data-order="{$referral.amountnum}">{$referral.amountdesc}</td>
                                    <td data-order="{$referral.commissionnum}">{$referral.commission}</td>
                                    <td><span class='status status-{$referral.rawstatus|strtolower}'>{$referral.status}</span></td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                        <div class="loader loader-table" id="tableLoading">
                            {include file="$template/includes/common/loader.tpl"}    
                        </div>
                    </div>
                {else}
                    <div class="message message-no-data">
                        <div class="message-image">
                            {include file="$template/includes/common/svg-icon.tpl" icon="track"}  
                        </div>
                        <h6 class="message-title">{$LANG.norecordsfound}</h6>
                    </div>
                {/if}        
            </div>    
        </div>                             
        {if $affiliatelinkscode}
            <div class="section">
                 <div class="section-header">
                    <h2 class="section-title">{$LANG.affiliateslinktous}</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            {$affiliatelinkscode}
                        </div>
                    </div>
                </div>
            </div>    
        {/if}
    {/if}
{/if}