{if $pageOption && $pageOption->renderPageSettings()}
    <h6>{$page->getMainName()|capitalize} - <i>{$pageOption->getName()}</i> Settings</h6>
    <div class="m-w-720">
        <div class="form-section row">
            <div class="col-md-4">
                {$pageOption->renderPageSettings($pageOption->getSettings())}
            </div>
        </div>
    </div>
{/if}