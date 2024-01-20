<div class="app-main__nav">
    <div class="container">
        <ul class="nav nav--md nav--h nav--tabs">
            {if isset($type) && $type === "style"}
                <li class="nav__item {if $activeTab == 'standard'}is-active{/if}">
                    <a class="nav__link"
                    href="{$helper->url('Template@manageStyle',['templateName'=>$template->getMainName(), 'styleName' => $styleName])}">
                        <span class="nav__link-text">{$lang.tabs.style_variables}</span>
                    </a>
                </li>
                <li class="nav__item {if $activeTab == 'styleSettings'}is-active{/if}">
                    <a class="nav__link"
                    href="{$helper->url('Template@styleSettings',['templateName'=>$template->getMainName() , 'styleName' => $styleName])}">
                        <span class="nav__link-text">Style Settings</span>
                    </a>
                </li> 
                <li class="nav__item {if $activeTab == 'advanced'}is-active{/if}">
                    <a class="nav__link"
                    href="{$helper->url('Template@manageStyleCustomCSS',['templateName'=>$template->getMainName() , 'styleName' => $styleName])}">
                        <span class="nav__link-text">{$lang.tabs.custom_css}</span>
                    </a>
                </li>
            {elseif isset($type) && $type === 'display'}
                {if isset($display) && isset($displayRule)}
                    {foreach $display->rules as $rule}
                        <li class="nav__item {if $displayRule->id == $rule->id} is-active{/if}">
                            <a class="nav__link" data-toggle="lu-tab" href="#display-rule-{$rule->id}">
                                <span class="nav__link-text">{$rule->name}</span>
                            </a>
                        </li>
                    {/foreach}
                {/if}
            {else}
                {foreach $template->getFunctions() as $function}
                    {if $function.label != 'Extensions'}
                    <li class="nav__item {if !$template->license()->isActive() && $function.action!='info'}is-disabled{/if} {if $smarty.get.action==$function.action} is-active{/if}">
                        <a class="nav__link" href="{$helper->url("Template@{$function.action}",['templateName'=>$template->getMainName()])}">
                            <span class="nav__link-text">{$function.label}</span>
                        </a>
                    </li>
                    {else}
                    <li class="nav__item m-l-a {if !$template->license()->isActive() && $function.action!='info'}is-disabled{/if} {if $smarty.get.action==$function.action} is-active{/if}">
                        <a class="nav__link" href="{$helper->url("Template@{$function.action}",['templateName'=>$template->getMainName()])}">
                            <span class="nav__link-text">{$function.label}</span>
                        </a>
                    </li>    
                    {/if}
                {/foreach}
            {/if}
        </ul>
    </div>
</div>
