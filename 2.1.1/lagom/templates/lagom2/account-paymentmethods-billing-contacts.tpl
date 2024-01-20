{if file_exists("templates/$template/overwrites/account-paymentmethods-billing-contacts.tpl")}
    {include file="{$template}/overwrites/account-paymentmethods-billing-contacts.tpl"}
{else}
    <div id="innerBillingContactsContainer">
        <div class="radio">
            <label class="billing-contact-0">
                <input 
                    type="radio" 
                    class="icheck-control" 
                    name="billingcontact" 
                    value="0"
                    {if $payMethod->contactType == 'Client' || ($payMethod->contactType === null && $client->billingContactId === 0)}
                        checked
                    {/if}
                >
                <strong class="name">{$client->fullName}</strong>
                <span class="address1">{$client->address1}</span>,
                {if $client->address2}<span class="address2">{$client->address2}</span>,{/if}
                <span class="city">{$client->city}</span>,
                <span class="state">{$client->state}</span>,
                <span class="postcode">{$client->postcode}</span>,
                <span class="country">{$client->country}</span>
            </label>
        </div>

        {foreach $client->contacts()->orderBy('firstname', 'asc')->orderBy('lastname', 'asc')->get() as $contact}
            <div class="radio">
                <label class="billing-contact-{$contact->id}">
                    <input 
                        type="radio" 
                        class="icheck-control" 
                        name="billingcontact" 
                        value="{$contact->id}"
                        {if $payMethod->contactType == 'Contact' && $contact->id == $payMethod->getContactId()}
                            checked
                        {elseif $payMethod->contactType === null && $client->billingContactId > 0}
                            {if $contact->id == $client->billingContactId || $contact->id == $selectedContactId}
                                checked
                            {/if}
                        {/if}
                    >
                    <strong class="name">{$contact->fullName}</strong>
                    <span class="address1">{$contact->address1}</span>,
                    {if $contact->address2}<span class="address2">{$contact->address2}</span>,{/if}
                    <span class="city">{$contact->city}</span>,
                    <span class="state">{$contact->state}</span>,
                    <span class="postcode">{$contact->postcode}</span>,
                    <span class="country">{$contact->country}</span>
                </label>
            </div>
        {/foreach}
    </div>
{/if}    