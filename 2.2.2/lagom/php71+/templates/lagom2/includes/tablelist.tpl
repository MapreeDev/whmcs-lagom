{if file_exists("templates/$template/includes/overwrites/tablelist.tpl")}
    {include file="{$template}/includes/overwrites/tablelist.tpl"}  
{else}
    <link rel="stylesheet" type="text/css" href="{$BASE_PATH_CSS}/dataTables.responsive.css">   
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.js"></script>

    {if isset($filterColumn) && $filterColumn}
    <script type="text/javascript">
        if (typeof(buildFilterRegex) !== "function") {
            function buildFilterRegex(filterValue) {
                if (filterValue.indexOf('&') === -1) {
                    return '[~>]\\s*' + jQuery.fn.dataTable.util.escapeRegex(filterValue) + '\\s*[<~]';
                } else {
                    var tempDiv = document.createElement('div');
                    tempDiv.innerHTML = filterValue;
                    return '\\s*' + jQuery.fn.dataTable.util.escapeRegex(tempDiv.innerText) + '\\s*';
                }
            }
        }
        jQuery(document).ready(function () {ldelim}
            if($('.main-content').hasClass('status-icons-enabled')){
                jQuery(".view-filter-btns .dropdown-menu a").click(function(e) {ldelim}
                    var filterValue = jQuery(this).find("span").data('value');
                    var filterText = jQuery(this).find("span.filter-name").html().trim();
                    var filterIcon = jQuery(this).find("span.status-icon").html().trim();
                    var filterStatusClass = jQuery(this).find("span").data('status-class');
                    var filterStatusColor = jQuery(this).data('status-color');
                    var dataTable = jQuery('#table{$tableName}').DataTable();
                    var filterValueRegex;
                    $(this).closest('.dropdown-menu').find('.active').removeClass('active');
                    $(this).parent().addClass('active');
                    $(this).closest('.view-filter-btns').find('.dropdown-toggle span.filter-name').html(filterText);
                    $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status-icon').attr('class','status-icon').addClass('status-'+filterStatusClass).html(filterIcon);
                    if (filterValue == "all") {ldelim}
                        dataTable.column({$filterColumn}).search('').draw();
                        $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('hidden');
                        {rdelim} else {ldelim}
                        if (filterStatusColor != undefined){ldelim} 
                            $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('style','--status-color:'+filterStatusColor).removeClass('hidden');
                        {rdelim} else {ldelim} 
                            $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('status-'+filterStatusClass).removeClass('hidden');
                        {rdelim}

                        if (filterValue != undefined){ldelim} 
                            filterValueRegex = buildFilterRegex(filterValue);
                        {rdelim} else {ldelim} 
                            filterValueRegex = buildFilterRegex(filterText);
                        {rdelim}

                        dataTable.column({$filterColumn})
                            .search(filterValueRegex, true, false, false)
                            .draw();
                    {rdelim}
                    // Prevent jumping to the top of the page
                    // when no matching tag is found.
                    e.preventDefault();
                    
                {rdelim});

            }else{
                jQuery(".view-filter-btns .dropdown-menu a").click(function(e) {ldelim}
                var filterValue = jQuery(this).find("span").data('value');
                var filterText = jQuery(this).find("span").html().trim();
                var filterStatusClass = jQuery(this).find("span").data('status-class');
                var filterStatusColor = jQuery(this).data('status-color');
                var dataTable = jQuery('#table{$tableName}').DataTable();
                var filterValueRegex;

                $(this).closest('.dropdown-menu').find('.active').removeClass('active');
                $(this).parent().addClass('active');
                $(this).closest('.view-filter-btns').find('.dropdown-toggle span:not(.status)').text(filterText);
                if (filterValue == "all") {ldelim}
                    dataTable.column({$filterColumn}).search('').draw();
                    $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('hidden');
                    {rdelim} else {ldelim}
                    if (filterStatusColor != undefined){ldelim} 
                        $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('style','--status-color:'+filterStatusColor).removeClass('hidden');
                    {rdelim} else {ldelim} 
                        $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('class','status').addClass('status-'+filterStatusClass).removeClass('hidden');
                    {rdelim}

                     if (filterValue != undefined){ldelim} 
                        filterValueRegex = buildFilterRegex(filterValue);
                    {rdelim} else {ldelim} 
                        filterValueRegex = buildFilterRegex(filterText);
                    {rdelim}

                    dataTable.column({$filterColumn})
                        .search(filterValueRegex, true, false, false)
                        .draw();
                {rdelim}
                // Prevent jumping to the top of the page
                // when no matching tag is found.
                e.preventDefault();
                
            {rdelim});
            }
           
        {rdelim});
       
    

        jQuery(document).ready(function () {
            jQuery(".sidebar .view-filter-btns a").click(function (e) {
                var filterValue = jQuery(this).find("span").not('.badge').html().trim(),
                    dataTable = jQuery('#table{$tableName}').DataTable(),
                    filterValueRegex;
                if (jQuery(this).hasClass('active')) {
                    {if !isset($dontControlActiveClass) || !$dontControlActiveClass}
                        jQuery(this).removeClass('active');                    
                    {/if}
                    dataTable.column({$filterColumn}).search('').draw();
                } else {
                    {if !isset($dontControlActiveClass) || !$dontControlActiveClass}
                        jQuery('.view-filter-btns .list-group-item').removeClass('active');                    
                        jQuery(this).addClass('active');
                    {/if}
                    filterValueRegex = buildFilterRegex(filterValue);
                    dataTable.column({$filterColumn})
                        .search(filterValueRegex, true, false, false)
                        .draw();
                }

                // Prevent jumping to the top of the page when no matching tag is found.
                e.preventDefault();
            });
        });
        </script>   
    {/if}

    <script type="text/javascript">
        function checkAll(){
            let checkAll = $('#selectAll');
            let checkboxes = $('.domids').not(':disabled');
            checkAll.on('ifChecked ifUnchecked', function(e) {
                if (e.type == 'ifChecked') {
                    checkboxes.iCheck('check');
                } else {
                    checkboxes.iCheck('uncheck');
                }
            });
            checkboxes.on('ifChanged', function(e){
                if(checkboxes.filter(':checked').length > 0){
                    $('#domainSelectedCounter').addClass('badge-primary');
                    $('.bottom-action-sticky').removeClass('hidden');           
                }
                else{
                    $('#domainSelectedCounter').removeClass('badge-primary');
                    $('.bottom-action-sticky').addClass('hidden');   
                }
                $('#domainSelectedCounter').text(checkboxes.filter(':checked').length);
                if(checkboxes.filter(':checked').length == checkboxes.length) {
                    checkAll.prop('checked', 'checked');
                } else {
                    checkAll.removeProp('checked');
                }
                checkAll.iCheck('update');
            });
        };

        var alreadyReady = false; // The ready function is being called twice on page load.

        {if $saveState}
            var saveState = {$saveState}
        {else}
            var saveState = true;
        {/if}

        {if isset($RSThemes['addonSettings']['enable_table_cache']) && $RSThemes['addonSettings']['enable_table_cache'] == "displayed"}
            {if isset($RSThemes['addonSettings']['table_cache_duration'])}
                {if $RSThemes['addonSettings']['table_cache_duration'] == "disabled"}
                    var saveState = false;
                    var stateDuration = 7200;
                    var noStartFilters = true;
                {else}
                    var stateDuration = {$RSThemes['addonSettings']['table_cache_duration']}
                    var noStartFilters = false;
                {/if}
            {else}
                var stateDuration = 7200;
                var noStartFilters = false;
            {/if}
        {else}
            var noStartFilters = false;
            var stateDuration = 7200;
        {/if}

        jQuery(document).ready( function () {ldelim}

            var table = jQuery("#table{$tableName}").DataTable({ldelim}
                "dom": '<"listtable"fit>pl',{if isset($noPagination) && $noPagination}
                "paging": false,{/if}
                "info": false,{if isset($noSearch) && $noSearch}
                "filter": false,{/if}
                "responsive": true,
                "oLanguage": {ldelim}
                    "sEmptyTable":     "{$LANG.norecordsfound}",
                    "sInfo":           "{$LANG.tableshowing}",
                    "sInfoEmpty":      "{$LANG.tableempty}",
                    "sInfoFiltered":   "{$LANG.tablefiltered}",
                    "sInfoPostFix":    "",
                    "sInfoThousands":  ",",
                    "sLengthMenu":     "{$LANG.tablelength}",
                    "sLoadingRecords": "{$LANG.tableloading}",
                    "sProcessing":     "{$LANG.tableprocessing}",
                    "sSearch":         "",
                    "sZeroRecords":    "{$LANG.norecordsfound}",
                    "oPaginate": {ldelim}
                        "sFirst":    "{$LANG.tablepagesfirst}",
                        "sLast":     "{$LANG.tablepageslast}",
                        "sNext":     "{$LANG.tablepagesnext}",
                        "sPrevious": "{$LANG.tablepagesprevious}"
                    {rdelim}
                {rdelim},
                "pageLength": 10,
                "order": [
                    [ {if isset($startOrderCol) && $startOrderCol}{$startOrderCol}{else}0{/if}, "asc" ]
                ],
                "lengthMenu": [
                    [10, 25, 50, -1],
                    [10, 25, 50, "{$LANG.tableviewall}"]
                ],
                "aoColumnDefs": [
                    {ldelim}
                        "bSortable": false,
                        "aTargets": [ {if isset($noSortColumns) && $noSortColumns !== ''}{$noSortColumns}{/if} ]
                    {rdelim},
                    {ldelim}
                        "sType": "string",
                        "aTargets": [ {if isset($filterColumn) && $filterColumn}{$filterColumn}{/if} ]
                    {rdelim}
                ],
                "stateSave": saveState,
                "stateDuration": stateDuration,
                "autoWidth": false,
            {rdelim});
               
            {if isset($filterColumn) && $filterColumn}
            // highlight remembered filter on page re-load
            if (!noStartFilters){
                var rememberedFilterTerm = table.state().columns[{$filterColumn}].search.search;
            }
            if (rememberedFilterTerm && !alreadyReady) {
                // This should only run on the first "ready" event.
                if($('.main-content').hasClass('status-icons-enabled')){
                    jQuery(".view-filter-btns a > span").each(function(index) {
                        if (buildFilterRegex(jQuery(this).text().trim()) == rememberedFilterTerm) {
                            var filterValue = jQuery(this).data('value');
                            var filterStatusClass = jQuery(this).data('status-class');
                            var filterStatusColor = jQuery(this).parent().data('status-color');
                            var filterFullStatusClass = 'status-' + filterStatusClass;
                            var ifTicket = jQuery(this).data('status');
                            $(this).closest('li').addClass('active');
                            var icon = $(this).find('.status-icon').html();

                            $(this).closest('.view-filter-btns').find('.dropdown-toggle span:not(.status)').text(jQuery(this).text());
                            $('<span class="status-icon"></span>').insertAfter($(this).closest('.view-filter-btns').find('.dropdown-toggle span.status'));
                            if(ifTicket == 'ticket'){
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle .status-icon').addClass(filterFullStatusClass).attr('data-status', 'ticket').append(icon);
                            }else{
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle .status-icon').addClass(filterFullStatusClass).append(icon);
                            }
                            
                            if (filterStatusColor != 'undefined') {
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('style','--status-color:'+filterStatusColor).removeClass('hidden');
                            } 
                            else {
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('status-'+filterStatusClass).removeClass('hidden');
                            }
                        }
                    });
                }else{
                    jQuery(".view-filter-btns a span").each(function(index) {
                        if (buildFilterRegex(jQuery(this).text().trim()) == rememberedFilterTerm) {
                            var filterValue = jQuery(this).data('value');
                            var filterStatusClass = jQuery(this).data('status-class');
                            var filterStatusColor = jQuery(this).parent().data('status-color');

                            $(this).closest('li').addClass('active');
                            $(this).closest('.view-filter-btns').find('.dropdown-toggle span:not(.status)').text(jQuery(this).text());
                            if (filterStatusColor != undefined) {
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('style','--status-color:'+filterStatusColor).removeClass('hidden');
                            } 
                            else {
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('status-'+filterStatusClass).removeClass('hidden');
                            }
                        }
                    });
                }
            }
            {/if}
            alreadyReady = true;
            if ($('#table-search').length > 0 && $('.dataTables_filter').length > 0){
                var searchTableVal = $('.dataTables_filter input').val();
                $('#table-search').val(searchTableVal);
                var searchVal = $('#table-search').val();
                table.search(searchVal, true).draw();
            }

            $('#table-search').on('keyup', function () {
                table.search(this.value, true).draw();
            });
            table.on('draw.dt', function () {
                $('body').find('input:not(.icheck-input):not(.switch__checkbox)').iCheck({
                    checkboxClass: 'checkbox-styled',
                    radioClass: 'radio-styled',
                    increaseArea: '40%'
                });
                checkAll();

            });  

            $('[data-inactive-services-checkbox]').on('change', function(){ldelim}
                if ($(this)[0].checked === true) {ldelim}
                    table.column(0).search("lagomshowservice", true, false, false).draw();      
                {rdelim}
                else {ldelim}
                    table.column(0).search("", true, false, false).draw();    
                {rdelim}
            {rdelim});
            
            {if $templatefile == "clientareaproducts"}
                {if !$hideInactiveServices['inactiveServices'] && isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideInactiveServices'] == "1" && !empty($RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus'])}
                    table.column(0).search("lagomshowservice", true, false, false).draw();    
                {else}
                    table.column(0).search("", true, false, false).draw();     
                {/if}
            {/if}
            {if $templatefile == "clientareadomains"}
                {if !$hideInactiveServices['inactiveDomains'] && isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideInactiveServices'] == "1" && !empty($RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus'])}
                    table.column(0).search("lagomshowservice", true, false, false).draw();    
                {else}
                    table.column(0).search("", true, false, false).draw();     
                {/if}
            {/if}
        {rdelim});

    </script>
{/if}