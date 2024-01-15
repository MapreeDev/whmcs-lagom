{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $stillopen}
        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.feedbackclosed textcenter=true}
        <p class="text-center">
            <a href="clientarea.php" class="btn btn-primary">{$LANG.returnclient}</a>
        </p>
    {elseif $feedbackdone}
        <div class="message message-success message-lg">
            <div class="message-icon">
                <i class="lm lm-check"></i>
            </div>
            <h2 class="message-title">{$LANG.feedbackprovided}</h2>                    
            <p class="message-desc">{$LANG.feedbackthankyou}</p>
            <div class="message-actions">
                <a href="clientarea.php" class="btn btn-primary">{$LANG.returnclient}</a>
            </div>
        </div>
    {elseif $success}
        <div class="message message-success message-lg">
            <div class="message-icon">
                <i class="lm lm-check"></i>
            </div>
            <h2 class="message-title">{$LANG.feedbackreceived}</h2>                    
            <p class="message-desc">{$LANG.feedbackthankyou}</p>
            <div class="message-actions">
                <a href="clientarea.php" class="btn btn-primary">{$LANG.returnclient}</a>
            </div>
        </div>
    {else}
        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}
        <div class="section">
            <div class="section-body">
            <div class="panel panel-default">
                <ul class="list-info list-info-50 list-info-bordered">
                    <li>
                        <span class="list-info-title">{$LANG.feedbackopenedat}:</span>
                        <span class="list-info-text">{$opened}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$LANG.feedbacklastreplied}:</span>
                        <span class="list-info-text">{$lastreply}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$LANG.feedbackstaffinvolved}:</span>
                        <span class="list-info-text">{if $staffinvolvedtext}{$staffinvolvedtext}{else}{$LANG.none}{/if}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$LANG.feedbacktotalduration}:</span>
                        <span class="list-info-text">{$duration}</span>
                    </li>
                </ul>   
                <div class="panel-footer"><a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-primary-faded">{$LANG.feedbackclickreview}</a>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="section-body">
                <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&c={$c}&feedback=1">
                    <input type="hidden" name="validate" value="true" />
                    <div class="panel panel-default panel-feedback">
                        <div class="list-group">
                            {foreach from=$staffinvolved key=staffid item=staff}
                                <div class="list-group-item">
                                    <p>{$LANG.feedbackpleaserate1} <strong>{$staff}</strong> {$LANG.feedbackhandled}:</p>
                                    <div class="btn-group btn-group-toggle m-b-3x" data-toggle="buttons">
                                        {foreach from=$ratings item=rating}
                                        <label class="btn btn-primary-faded{if $rate.$staffid eq $rating} active{/if}">
                                            <input type="radio" name="rate[{$staffid}]" value="{$rating}"{if $rate.$staffid eq $rating} checked{/if} > {$rating}
                                        </label>
                                        {/foreach}
                                    </div>                                    
                                    <p>{$LANG.feedbackpleasecomment1} <strong>{$staff}</strong> {$LANG.feedbackhandled}.</p>
                                    <textarea name="comments[{$staffid}]" rows="4" class="form-control">{$comments.$staffid}</textarea>
                                </div>
                            {/foreach}
                            <div class="list-group-item">
                            <p>{$LANG.feedbackimprove}</p>
                            
                                    <textarea name="comments[generic]" rows="4" class="form-control">{$comments.generic}</textarea>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <input class="btn btn-lg btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
                            <input class="btn btn-lg btn-default" type="reset" value="{$LANG.cancel}" />
                        </div>
                    </div>
                </div>
            </form>
        </div> 
    </div>
    {/if}
{/if}