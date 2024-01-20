{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type="style_manage"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl" type="style"}
{/block}
{block name="template-content"}
    <h1>Add Custom CSS Rules 
        <span class="label-docs">
            <a href="https://lagom.rsstudio.net/docs/style-manager.html#custom-css" class="btn--doc btn btn--link btn--xs" target="_blank" rel="noopener noreferrer">docs</a>
        </span>
    </h1>
    <div class="row">
        <div class="col-md-12">
            <div class="tabs__body">
                <div class="tab-content">
                    <div class="tab-pane is-active" id="tabls-1">
                        <form id="cssLiveEditorForm" action="{$helper->url('Template@styleCustomCSSSave',['templateName'=>$template->getMainName(), 'styleName'=>$styleName])}" name="colorScheme" method="POST">
                            <textarea name="cssContent" id="cssLiveContent" class="d-none"></textarea>
                            <div id="cssLiveEditor">{{$styleContent}}</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style type="text/css" media="screen">
        #cssLiveEditor {
            width:100%;
            height:500px;
            margin-bottom:30px;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.6/ace.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $editor = ace.edit("cssLiveEditor");
        $editor.setTheme("ace/theme/monokai");
        $editor.session.setMode("ace/mode/css");
        function submitForm()
        {
            $('#cssLiveContent').val($editor.getValue());
            $('#cssLiveEditorForm').submit();
        }
    </script>
{/block}
{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <button class="btn btn btn--primary" onclick="submitForm()" >
                <span class="btn__text">Save Changes</span>
                <span class="btn__preloader preloader"></span>
            </button>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}
