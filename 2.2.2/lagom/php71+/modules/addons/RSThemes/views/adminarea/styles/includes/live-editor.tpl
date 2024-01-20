<div id="accordion" class="scroll-y-auto">
    {foreach $dataSectionList as $sectionName => $cssData}
        <div class="panel panel-default panel-accordion">
            <div class="panel-settings" data-toggle="collapse" data-parent="#accordion" data-target="#{$sectionName|replace:' ':'_'}">
                <h5 class="panel-title">{$sectionName}</h5>
            </div>
            <div id="{$sectionName|replace:' ':'_'}" class="panel-collapse collapse">
                <div class="panel-body">
                    {foreach $cssData as $k=>$val}
                        <div class="color-chose__container">
                            <label>{$val->name}</label>
                            <div class="form-group">
                                {if $val->variable}
                                    {if $val->args['var_group']}
                                        <select name="config[{$k}]">
                                            {foreach $dataSectionList as $dataList}
                                                {foreach $dataList as $index => $dataItem}
                                                    {if $dataItem->args['group'] eq $val->args['var_group']}
                                                        <option value="{$index}" {if $val->variable == $index} selected {/if}>{$dataItem->name}</option>
                                                    {/if}
                                                {/foreach}
                                            {/foreach}
                                        </select>
                                    {else}
                                        <div class="color-preview"></div>
                                        <select class="color-preview-buttons" name="config[{$k}]" class="setButtonColorType">
                                            {foreach $RSThemes['styles']['colors']->getColorScheme($RSThemes['styles']['colors']->getActiveColorScheme()) as $section => $activeSchemeSections}
                                                {if $section!="args"}
                                                    {foreach $activeSchemeSections as $colorIndex => $colorScheme}
                                                        <option value="{$colorIndex}" {if $val->variable == $colorIndex} selected {/if}>{$section} {$colorScheme->name}</option>
                                                    {/foreach}
                                                {/if}
                                            {/foreach}
                                        </select>
                                    {/if}
                                {elseif $val->font}
                                    <div class="form-group">
                                        <select name="config[{$k}]">
                                            {foreach $RSThemes['styles']['colors']->getGoogleFonts() as $font}
                                                <option {if $font->family eq $val->font}selected{/if} value="{$font->family}">{$font->family}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                {elseif $val->text}
                                    <div class="form-group">
                                        <input autocomplete="off" class="form-control form-control--xs"
                                               type="text" name="config[{$k}]" value="{$val->text}">
                                    </div>
                                {else}
                                    {if $val->gradient}
                                        <div class="form-group">
                                            <div class="color-preview" style="background-image: linear-gradient( 90deg, {$val->gradient[0]} 0%, {$val->gradient[1]})"></div>
                                            <input autocomplete="off" class="form-control color-picker form-control--xs"
                                                   type="text" name="config[{$k}][]" value="{$val->gradient[0]}">
                                            <input autocomplete="off" class="form-control color-picker form-control--xs"
                                                   type="text" name="config[{$k}][]" value="{$val->gradient[1]}">
                                        </div>
                                    {else}
                                        <div class="form-group">
                                            <div class="color-preview" style="background-color: {$val->color}"></div>
                                            <input autocomplete="off" class="form-control color-picker form-control--xs"
                                                   type="text" name="config[{$k}]" value="{$val->color}">
                                        </div>
                                    {/if}
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    {/foreach}
</div>
