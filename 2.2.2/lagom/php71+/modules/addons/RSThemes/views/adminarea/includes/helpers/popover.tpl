<span class="{$popoverClasses} popover-container" data-popover-container>
    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg" data-popover-open="hover">
        <circle cx="6" cy="6" r="5.5" stroke="#B9BDC5"/>
        <path d="M7 6V9H5V6H7ZM5 5V3H7V5H5Z" fill="#B9BDC5"/>
    </svg>
    <div class="popover" data-popover>
        <div class="popover__body">
            {$popoverBody|unescape:'html'}                                                   
        </div>
        {if $popoverFooter && $popoverFooter != ""}
            <div class="popover__footer">
                {$popoverFooter|unescape:'html'}
            </div>
        {/if}
    </div>
</span>