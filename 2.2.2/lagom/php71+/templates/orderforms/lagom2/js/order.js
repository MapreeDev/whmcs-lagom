/*******************************************
Lagom Orderform Scripts
1. Product domain search box
2. Product domain search results
3. Add Domain To Cart
4. Domain Register Search
5. Update Config Options
6. Serialize Config Form
7. Domain Renewals
8. Empty Cart
9. Use Credit on Checkout
*******************************************
*/
/*******************************************
Lagom Orderform Functions
1. Product Domain Lookup Ended
2. Domain Lookup Ended
2. Recalc Totals
3. Recalc Renew Totals
4. Remove Item
5. Select Domain Period
6. Validate Captcha
7. More Suggestions
8. Checkout Form
9. Select Product Billing Cycle
10. Remove Addon
11. Check Tos
*******************************************
*/


function scrollToGatewayInputError() {
    var displayError = jQuery('.gateway-errors,.assisted-cc-input-feedback').first(),
        frm = displayError.closest('form');
    if (!frm) {
        frm = jQuery('form').first();
    }
    frm.find('button[type="submit"],input[type="submit"]')
        .prop('disabled', false)
        .removeClass('disabled')
        .find('i.fas,i.far,i.fal,i.fab')
        .removeAttr('class')
        .addClass('fas fa-arrow-circle-right')
        .find('span').toggleClass('hidden');

    if (displayError.length) {
        if (elementOutOfViewPort(displayError[0])) {
            jQuery('html, body').animate(
                {
                    scrollTop: displayError.offset().top - 50
                },
                500
            );
        }
    }
}

function elementOutOfViewPort(element) {
    // Get element's bounding
    var bounding = element.getBoundingClientRect();
    // Check if it's out of the viewport on each side
    var out = {};
    out.top = bounding.top < 0;
    out.left = bounding.left < 0;
    out.bottom = bounding.bottom > (window.innerHeight || document.documentElement.clientHeight);
    out.right = bounding.right > (window.innerWidth || document.documentElement.clientWidth);
    out.any = out.top || out.left || out.bottom || out.right;

    return out.any;
};

/**
 * WHMCS authentication module
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2017
 * @license http://www.whmcs.com/license/ WHMCS Eula
 */

(function(module) {
    if (!WHMCS.hasModule('authn')) {
        WHMCS.loadModule('authn', module);
    }
})({
provider: function () {
    var callbackFired = false;

    /**
     * @return {jQuery}
     */
    this.feedbackContainer = function () {
        return jQuery(".providerLinkingFeedback");
    };

    /**
     * @returns {jQuery}
     */
    this.btnContainer = function () {
        return jQuery(".providerPreLinking");
    };

    this.feedbackMessage = function (context) {
        if (typeof context === 'undefined') {
            context = 'complete_sign_in';
        }
        var msgContainer = jQuery('p.providerLinkingMsg-preLink-' + context);
        if (msgContainer.length) {
            return msgContainer.first().html();
        }

        return '';
    };

    this.showProgressMessage = function(callback) {
        this.feedbackContainer().fadeIn('fast', function () {
            if (typeof callback === 'function' && !callbackFired) {
                callbackFired = true;
                callback();
            }
        });
    };

    this.preLinkInit = function (callback) {
        var icon = '<i class="fas fa-fw fa-spinner fa-spin"></i> ';

        this.feedbackContainer()
            .removeClass('alert-danger alert-success')
            .addClass('alert alert-info')
            .html(icon + this.feedbackMessage())
            .hide();

        var btnContainer = this.btnContainer();
        if (btnContainer.length) {
            if (btnContainer.data('hideOnPrelink')) {
                var self = this;
                btnContainer.fadeOut('false', function ()
                {
                    self.showProgressMessage(callback)
                });
            } else if (btnContainer.data('disableOnPrelink')) {
                btnContainer.find('.btn').addClass('disabled');
                this.showProgressMessage(callback);
            } else {
                this.showProgressMessage(callback);
            }
        } else {
            this.showProgressMessage(callback);
        }
    };

    this.displayError = function (provider, errorCondition, providerErrorText){
        jQuery('#providerLinkingMessages .provider-name').html(provider);

        var feedbackMsg = this.feedbackMessage('connect_error');
        if (errorCondition) {
            var errorMsg = this.feedbackMessage(errorCondition);
            if (errorMsg) {
                feedbackMsg = errorMsg
            }
        }

        if (providerErrorText && $('.btn-logged-in-admin').length > 0) {
            feedbackMsg += ' Error: ' + providerErrorText;
        }

        this.feedbackContainer().removeClass('alert-info alert-success')
            .addClass('alert alert-danger')
            .html(feedbackMsg).slideDown();
    };

    this.displaySuccess = function (data, context, provider) {
        var icon = provider.icon;
        var htmlTarget = context.htmlTarget;
        var targetLogin = context.targetLogin;
        var targetRegister = context.targetRegister;
        var displayName = provider.name;
        var feedbackMsg = '';

        switch (data.result) {
            case "logged_in":
            case "2fa_needed":
                feedbackMsg = this.feedbackMessage('2fa_needed');
                this.feedbackContainer().removeClass('alert-danger alert-warning alert-success')
                    .addClass('alert alert-info')
                    .html(feedbackMsg);
                    window.location = data.redirect_url
                        ? decodeURIComponent(data.redirect_url)
                        : decodeURIComponent(context.redirectUrl);
                break;

            case "linking_complete":
                var accountInfo = '';
                if (data.remote_account.email) {
                    accountInfo = data.remote_account.email;
                } else {
                    accountInfo = data.remote_account.firstname + " " + data.remote_account.lastname;
                }

                accountInfo = accountInfo.trim();

                feedbackMsg = this.feedbackMessage('linking_complete').trim().replace(':displayName', displayName);
                if (accountInfo) {
                    feedbackMsg = feedbackMsg.replace(/\.$/, ' (' + accountInfo + ').');
                }

                this.feedbackContainer().removeClass('alert-danger alert-warning alert-info')
                    .addClass('alert alert-success')
                    .html(icon + feedbackMsg);
                break;

            case "login_to_link":
                if (htmlTarget === targetLogin) {
                    feedbackMsg = this.feedbackMessage('login_to_link-signin-required');
                    this.feedbackContainer().removeClass('alert-danger alert-success alert-info')
                        .addClass('alert alert-warning')
                        .html(icon + feedbackMsg);
                } else {
                    var emailField = jQuery("input[name=email]");
                    var firstNameField = jQuery("input[name=firstname]");
                    var lastNameField = jQuery("input[name=lastname]");

                    if (emailField.val() === "") {
                        emailField.val(data.remote_account.email);
                    }

                    if (firstNameField.val() === "") {
                        firstNameField.val(data.remote_account.firstname);
                    }

                    if (lastNameField.val() === "") {
                        lastNameField.val(data.remote_account.lastname);
                    }

                    if (htmlTarget === targetRegister) {
                        if (typeof WHMCS.client.registration === 'object') {
                            WHMCS.client.registration.prefillPassword();
                        }
                        feedbackMsg = this.feedbackMessage('login_to_link-registration-required');
                        this.feedbackContainer().fadeOut('slow', function () {
                            $(this).removeClass('alert-danger alert-success alert-info')
                                .addClass('alert alert-warning')
                                .html(icon + feedbackMsg).fadeIn('fast');
                        });

                    } else {
                        // this is checkout
                        if (typeof WHMCS.client.registration === 'object') {
                            WHMCS.client.registration.prefillPassword();
                        }

                        var self = this;
                        this.feedbackContainer().each(function (i, el) {
                            var container = $(el);
                            var linkContext = container.siblings('div .providerPreLinking').data('linkContext');

                            container.fadeOut('slow', function () {
                                if (linkContext === 'checkout-new') {
                                    feedbackMsg = self.feedbackMessage('checkout-new');
                                } else {
                                    feedbackMsg = self.feedbackMessage('login_to_link-signin-required');
                                }
                                container.removeClass('alert-danger alert-success alert-info')
                                    .addClass('alert alert-warning')
                                    .html(icon + feedbackMsg).fadeIn('fast');
                            });
                        });
                    }
                }

                break;

            case "other_user_exists":
                feedbackMsg = this.feedbackMessage('other_user_exists');
                this.feedbackContainer().removeClass('alert-info alert-success')
                    .addClass('alert alert-danger')
                    .html(icon + feedbackMsg).slideDown();
                break;

            case "already_linked":
                feedbackMsg = this.feedbackMessage('already_linked');
                this.feedbackContainer().removeClass('alert-info alert-success')
                    .addClass('alert alert-danger')
                    .html(icon + feedbackMsg).slideDown();
                break;

            default:
                feedbackMsg = this.feedbackMessage('default');
                this.feedbackContainer().removeClass('alert-info alert-success')
                    .addClass('alert alert-danger')
                    .html(icon + feedbackMsg).slideDown();
                break;
        }
    };

    this.signIn = function (config, context, provider, providerDone, providerError) {
        jQuery.ajax(config).done(function(data) {
            providerDone();
            WHMCS.authn.provider.displaySuccess(data, context, provider);
            var table = jQuery('#tableLinkedAccounts');
            if (table.length) {
                WHMCS.ui.dataTable.getTableById('tableLinkedAccounts').ajax.reload();
            }
        }).error(function() {
            providerError();
            WHMCS.authn.provider.displayError();
        });
    };

    return this;
}});

/**
 * WHMCS client module
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2017
 * @license http://www.whmcs.com/license/ WHMCS Eula
 */
(function(module) {
    if (!WHMCS.hasModule('client')) {
        WHMCS.loadModule('client', module);
    }
})({
registration: function () {
    this.prefillPassword = function (params) {
        params = params || {};
        if (typeof params.hideContainer === 'undefined') {
            var id = (jQuery('#inputSecurityQId').attr('id')) ? '#containerPassword' : '#containerNewUserSecurity';
            params.hideContainer = jQuery(id);
            params.hideInputs = true;
        } else if (typeof params.hideContainer === 'string' && params.hideContainer.length) {
            params.hideContainer = jQuery(params.hideContainer);
        }

        if (typeof params.form === 'undefined') {
            params.form = {
                password: [
                    {id: 'inputNewPassword1'},
                    {id: 'inputNewPassword2'}
                ]
            };
        }

        var prefillFunc = function () {
            var $randomPasswd = WHMCS.utils.simpleRNG();
            for (var i = 0, len = params.form.password.length; i < len; i++) {
                jQuery('#' + params.form.password[i].id)
                    .val($randomPasswd).trigger('keyup');
            }
        };

        if (params.hideInputs) {
            params.hideContainer.slideUp('fast', prefillFunc);
        } else {
            prefillFunc();
        }
    };

    return this;
}});

/**
 * WHMCS HTTP module
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2018
 * @license http://www.whmcs.com/license/ WHMCS Eula
 */
(function(module) {
    if (!WHMCS.hasModule('http')) {
        WHMCS.loadModule('http', module);
    }
})({
jqClient: function () {
    _getSettings = function (url, data, success, dataType)
    {
        if (typeof url === 'object') {
            /*
                Settings may be the only argument
             */
            return url;
        }

        if (typeof data === 'function') {
            /*
                If 'data' is omitted, 'success' will come in its place
             */
            success = data;
            data = null;
        }

        return {
            url: url,
            data: data,
            success: success,
            dataType: dataType
        };
    };

    /**
     * @param url
     * @param data
     * @param success
     * @param dataType
     * @returns {*}
     */
    this.get = function (url, data, success, dataType)
    {
        return WHMCS.http.client.request(
            jQuery.extend(
                _getSettings(url, data, success, dataType),
                {
                    type: 'GET'
                }
            )
        );
    };

    /**
     * @param url
     * @param data
     * @param success
     * @param dataType
     * @returns {*}
     */
    this.post = function (url, data, success, dataType)
    {
        return WHMCS.http.client.request(
            jQuery.extend(
                _getSettings(url, data, success, dataType),
                {
                    type: 'POST'
                }
            )
        );
    };
    this.jsonGet = function (options) {
        options = options || {};
        this.get(options.url, options.data, function(response) {
            if (response.warning) {
                console.log('[WHMCS] Warning: ' + response.warning);
                if (typeof options.warning === 'function') {
                    options.warning(response.warning);
                }
            } else if (response.error) {
                console.log('[WHMCS] Error: ' + response.error);
                if (typeof options.error === 'function') {
                    options.error(response.error);
                }
            } else {
                if (typeof options.success === 'function') {
                    options.success(response);
                }
            }
        }, 'json').fail(function(xhr, errorMsg){
            console.log('[WHMCS] Fail: ' + errorMsg);
            if (typeof options.fail === 'function') {
                options.fail(errorMsg, xhr);
            }
        }).always(function() {
            if (typeof options.always === 'function') {
                options.always();
            }
        });
    };

    /**
     * @param options
     * @returns {*}
     */
    this.jsonPost = function (options) {
        options = options || {};
        this.post(options.url, options.data, function(response) {
            if (response.warning) {
                console.log('[WHMCS] Warning: ' + response.warning);
                if (typeof options.warning === 'function') {
                    options.warning(response.warning);
                }
            } else if (response.error) {
                console.log('[WHMCS] Error: ' + response.error);
                if (typeof options.error === 'function') {
                    options.error(response.error);
                }
            } else {
                if (typeof options.success === 'function') {
                    options.success(response);
                }
            }
        }, 'json').error(function(xhr, errorMsg){
            console.log('[WHMCS] Error: ' + errorMsg);
            if (typeof options.fail === 'function') {
                options.fail(errorMsg);
            }
        }).always(function() {
            if (typeof options.always === 'function') {
                options.always();
            }
        });
    };

    return this;
},

client: function () {
    var methods = ['get', 'post', 'put', 'delete'];
    var client = this;

    _beforeRequest = function (settings)
    {
        /*
            Enforcing dataType was found to break many invocations expecting HTML back.
            If/when those are refactored, this may be uncommented to enforce a safer
            data transit.
         */
        /*if (typeof settings.dataType === 'undefined') {
            settings.dataType = 'json';
        }*/

        if (typeof settings.type === 'undefined') {
            // default request type is GET
            settings.type = 'GET';
        }

        /*
            Add other preprocessing here if required
         */

        return settings;
    };

    this.request = function (settings)
    {
        settings = _beforeRequest(settings || {});
        return jQuery.ajax(settings);
    };

    /*
        Create shortcut methods for methods[] array above
     */
    jQuery.each(methods, function(index, method) {
        client[method] = (function(method, client) {
            return function (settings)
            {
                settings = settings || {};

                settings.type = method.toUpperCase();

                return client.request(settings);
            }
        })(method, client);
    });

    return this;
}

});

/**
 * WHMCS UI module
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2017
 * @license http://www.whmcs.com/license/ WHMCS Eula
 */
(function(module) {
    if (!WHMCS.hasModule('ui')) {
        WHMCS.loadModule('ui', module);
    }
})({
/**
 * Confirmation PopUp
 */
confirmation: function () {

    /**
     * @type {Array} Registered confirmation root selectors
     */
    var toggles = [];

    /**
     * Register/Re-Register all confirmation elements with jQuery
     * By default all elements of data toggle "confirmation" will be registered
     *
     * @param {(string|undefined)} rootSelector
     * @return {Array} array of registered toggles
     */
    this.register = function (rootSelector) {
        if (typeof rootSelector === 'undefined') {
            rootSelector = '[data-toggle=confirmation]';
        }
        if (toggles.indexOf(rootSelector) < 0) {
            toggles.push(rootSelector);
        }

        jQuery(rootSelector).confirmation({
            rootSelector: rootSelector
        });

        return toggles;
    };

    return this;
},

/**
 * Data Driven Table
 */
dataTable: function () {

    /**
     * @type {{}}
     */
    this.tables = {};

    /**
     * Register all tables on page with the class "data-driven"
     */
    this.register = function () {
        var self = this;
        jQuery('table.data-driven').each(function (i, table) {
            self.getTableById(table.id, undefined);
        });
    };

    /**
     * Get a table by id; create table object on fly as necessary
     *
     * @param {string} id
     * @param {({}|undefined)} options
     * @returns {DataTable}
     */
    this.getTableById = function (id, options) {
        var self = this;
        var el = jQuery('#' + id);
        if (typeof self.tables[id] === 'undefined') {
            if (typeof options === 'undefined') {
                options = {
                    dom: '<"listtable"ift>pl',
                    paging: false,
                    lengthChange: false,
                    searching: false,
                    ordering: true,
                    info: false,
                    autoWidth: true,
                    columns: [],
                    lengthMenu: [10, 25, 50, 100, 500, 1000],
                    language: {
                        emptyTable: (el.data('langEmptyTable')) ? el.data('langEmptyTable') : "No records found"
                    }
                };
            }
            jQuery.each(el.data(), function (key, value) {
                if (typeof value === 'undefined') {
                    return;
                }
                if (key === 'ajaxUrl') {
                    options.ajax = {
                        url: value
                    };
                    return;
                }
                if (key === 'lengthChange') {
                    options.lengthChange = value;
                    return;
                }
                if (key === 'pageLength') {
                    options.pageLength = value;
                    return;
                }
                if (key === 'langEmptyTable') {
                    if (typeof options.language === "undefined") {
                        options.language = {};
                    }
                    options.language.emptyTable = value;
                    return
                }
                if (key === 'langZeroRecords') {
                    if (typeof options.language === "undefined") {
                        options.language = {};
                    }
                    options.language.zeroRecords = value;
                    return
                }
                options.key = value;
            });
            jQuery.each(el.find('th'), function() {
                if (typeof options.columns === "undefined") {
                    options.columns = [];
                }
                options.columns.push({data:jQuery(this).data('name')});
            });


            self.tables[id] = self.initTable(el, options);
        } else if (typeof options !== 'undefined') {
            var oldTable = self.tables[id];
            var initOpts = oldTable.init();
            var newOpts = jQuery.extend( initOpts, options);
            oldTable.destroy();
            self.tables[id] = self.initTable(el, newOpts);
        }

        return self.tables[id];
    };

    this.initTable = function (el, options) {
        var table = el.DataTable(options);
        var self = this;
        if (el.data('on-draw')) {
            table.on('draw.dt', function (e, settings) {
                var namedCallback = el.data('on-draw');
                if (typeof window[namedCallback] === 'function') {
                    window[namedCallback](e, settings);
                }
            });
        } else if (el.data('on-draw-rebind-confirmation')) {
            table.on('draw.dt', function (e) {
                self.rebindConfirmation(e);
            });
        }

        return table;
    };

    this.rebindConfirmation = function (e) {
        var self = this;
        var tableId = e.target.id;
        var toggles = WHMCS.ui.confirmation.register();
        for(var i = 0, len = toggles.length; i < len; i++ ) {
            jQuery(toggles[i]).on(
                'confirmed.bs.confirmation',
                function (e)
                {
                    e.preventDefault();
                    WHMCS.http.jqClient.post(
                        jQuery(e.target).data('target-url'),
                        {
                            'token': csrfToken
                        }
                    ).done(function (data)
                    {
                        if (data.status === 'success' || data.status === 'okay') {
                            self.getTableById(tableId, undefined).ajax.reload();
                        }
                    });

                }
            );
        }
    };

    return this;
},

clipboard: function() {
    this.copy = function(e) {
        e.preventDefault();

        var trigger = $(e.currentTarget);
        var contentElement = $(trigger).data('clipboard-target');
        var container = $(contentElement).parent();

        try {
            var tempElement = $('<textarea>')
                .css('position', 'fixed')
                .css('opacity', '0')
                .css('width', '1px')
                .css('height', '1px')
                .val($(contentElement).val());

            container.append(tempElement);
            tempElement.focus().select();
            document.execCommand('copy');
        } finally {
            tempElement.remove();
        }

        trigger.tooltip({
            trigger: 'click',
            placement: 'bottom'
        });

        WHMCS.ui.toolTip.setTip(trigger, 'Copied!');
        WHMCS.ui.toolTip.hideTip(trigger);
    };
    return this;
},

/**
 * ToolTip and Clipboard behaviors
 */
toolTip: function () {
    this.setTip = function (btn, message) {
        var tip = btn.data('bs.tooltip');
        if (tip.hoverState !== 'in') {
            tip.hoverState = 'in';
        }
        btn.attr('data-original-title', message);
        tip.show();

        return tip;
    };

    this.hideTip = function (btn, timeout) {
        if (!timeout) {
            timeout = 2000;
        }
        return setTimeout(function() {
            btn.data('bs.tooltip').hide()
        }, timeout);
    }
},

jsonForm: function() {
    this.managedElements = 'input,textarea,select';

    this.initFields = function (form) {
        var self = this;
        $(form).find(self.managedElements).each(function () {
            var field = this;

            $(field).on('keypress change', function () {
                if (self.fieldHasError(field)) {
                    self.clearFieldError(field);
                }
            });
        });
    };

    this.init = function (form) {
        var self = this;

        self.initFields(form);

        $(form).on('submit', function(e) {
            e.preventDefault();
            e.stopPropagation();

            self.clearErrors(form);

            var formModal = $(form).parents('.modal[role="dialog"]').first();

            if ($(formModal).length) {
                $(formModal).on('show.bs.modal hidden.bs.modal', function() {
                    self.clearErrors(form);
                });

                /*
                 * Make this optional if the form is used for editing
                 */
                $(formModal).on('show.bs.modal', function() {
                    $(form)[0].reset();
                });
            }

            WHMCS.http.client.post({
                url: $(form).attr('action'),
                data: $(form).serializeArray(),
            })
                .done(function (response) {
                    self.onSuccess(form, response);
                })
                .fail(function (jqXHR) {
                    self.onError(form, jqXHR);
                })
                .always(function (data) {
                    self.onRequestComplete(form, data);
                });
        });
    };

    this.initAll = function () {
        var self = this;

        $('form[data-role="json-form"]').each(function() {
            var formElement = this;
            self.init(formElement);
        });
    };

    this.markFieldErrors = function (form, fields)
    {
        var self = this;
        var errorMessage = null;
        var field, fieldLookup;

        for (var fieldName in fields) {
            if (fields.hasOwnProperty(fieldName)) {
                errorMessage = fields[fieldName];
            }

            fieldLookup = self.managedElements.split(',').map(function(element) {
                return element + '[name="' + fieldName + '"]';
            }).join(',');

            field = $(form).find(fieldLookup);

            if (errorMessage) {
                $(field).parents('.form-group').addClass('has-error');
                $(field).attr('title', errorMessage);
                $(field).tooltip();
            }
        }

        $(form).find('.form-group.has-error input[title]').first().tooltip('show');
    };

    this.fieldHasError = function (field) {
        return $(field).parents('.form-group').hasClass('has-error');
    };

    this.clearFieldError = function (field) {
        /**
         * Try dispose first for BS 4, which will raise error
         * on BS 3 or older, then we use destroy instead
         */
        try {
            $(field).tooltip('dispose');
        } catch (err) {
            $(field).tooltip('destroy');
        }
        $(field).parents('.form-group').removeClass('has-error');
    };

    this.onSuccess = function (form, response) {
        var formOnSuccess = $(form).data('on-success');

        if (typeof formOnSuccess === 'function') {
            formOnSuccess(response.data);
        }
    };

    this.onError = function (form, jqXHR) {
        if (jqXHR.responseJSON && jqXHR.responseJSON.fields && typeof jqXHR.responseJSON.fields === 'object') {
            this.markFieldErrors(form, jqXHR.responseJSON.fields);
        } else {
            // TODO: replace with client-accessible generic error messaging
            console.log('Unknown error - please try again later.');
        }

        var formOnError = $(form).data('on-error');

        if (typeof formOnError === 'function') {
            formOnError(jqXHR);
        }
    };

    this.clearErrors = function (form) {
        var self = this;

        $(form).find(self.managedElements).each(function () {
            self.clearFieldError(this);
        })
    };

    this.onRequestComplete = function (form, data) {
        // implement as needed
    };

    return this;
},

effects: function () {
    this.errorShake = function (element) {
        /**
         * Shake effect without jQuery UI inspired by Hiren Patel | ninty9notout:
         * @see https://github.com/ninty9notout/jquery-shake/blob/51f3dcf625970c78505bcac831fd9e28fc85d374/jquery.ui.shake.js
         */
        options = options || {};
        var options = $.extend({
            direction: "left",
            distance: 8,
            times: 3,
            speed: 90
        }, options);

        return element.each(function () {
            var el = $(this), props = {
                position: el.css("position"),
                top: el.css("top"),
                bottom: el.css("bottom"),
                left: el.css("left"),
                right: el.css("right")
            };

            el.css("position", "relative");

            var ref = (options.direction === "up" || options.direction === "down") ? "top" : "left";
            var motion = (options.direction === "up" || options.direction === "left") ? "pos" : "neg";

            var animation = {}, animation1 = {}, animation2 = {};
            animation[ref] = (motion === "pos" ? "-=" : "+=") + options.distance;
            animation1[ref] = (motion === "pos" ? "+=" : "-=") + options.distance * 2;
            animation2[ref] = (motion === "pos" ? "-=" : "+=") + options.distance * 2;

            el.animate(animation, options.speed);
            for (var i = 1; i < options.times; i++) {
                el.animate(animation1, options.speed).animate(animation2, options.speed);
            }

            el.animate(animation1, options.speed).animate(animation, options.speed / 2, function () {
                el.css(props);
            });
        });
    };

}
});



/**
 * Form module
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2017
 * @license http://www.whmcs.com/license/ WHMCS Eula
 */
(function(module) {
    if (!WHMCS.hasModule('form')) {
        WHMCS.loadModule('form', module);
    }
})(
function () {
    this.checkAllBound = false;

    this.register = function () {
        if (!this.checkAllBound) {
            this.bindCheckAll();
            this.checkAllBound = true;
        }
    };

    this.bindCheckAll = function ()
    {
        var huntSelector = '.btn-check-all';
        jQuery('body').on('click', huntSelector, function (e) {
            var btn = jQuery(e.target);
            var targetInputs = jQuery(
                '#' + btn.data('checkbox-container') + ' input[type="checkbox"]'
            );
            if (btn.data('btn-check-toggle')) {
                // one control that changes
                var textDeselect = 'Deselect All';
                var textSelect = 'Select All';
                if (btn.data('label-text-deselect')) {
                    textDeselect = btn.data('label-text-deselect');
                }
                if (btn.data('label-text-select')) {
                    textSelect = btn.data('label-text-select');
                }

                if (btn.hasClass('toggle-active')) {
                    targetInputs.prop('checked',false);
                    btn.text(textSelect);
                    btn.removeClass('toggle-active');
                } else {
                    targetInputs.prop('checked',true);
                    btn.text(textDeselect);
                    btn.addClass('toggle-active');
                }
            } else {
                // two controls that are static
                if (btn.data('btn-toggle-on')) {
                    targetInputs.prop('checked',true);
                } else {
                    targetInputs.prop('checked',false);
                }
            }
        });
    };

    this.reloadCaptcha = function (element)
    {
        if (typeof grecaptcha !== 'undefined') {
            grecaptcha.reset();
        } else {    
            if (!element) {
                element = jQuery('#inputCaptchaImage');
            }
        }

        var src = jQuery(element).data('src');
        jQuery(element).attr('src', src + '?nocache=' + (new Date()).getTime());

        var userInput = jQuery('#inputCaptcha');
        if (userInput.length) {
            userInput.val('');
        }
    };
    return this;
});

/**
 * reCaptcha module
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2020
 * @license http://www.whmcs.com/license/ WHMCS Eula
 */
var recaptchaLoadComplete = false,
    recaptchaCount = 0,
    recaptchaType = 'recaptcha',
    recaptchaValidationComplete = false;

(function(module) {
    if (!WHMCS.hasModule('recaptcha')) {
        WHMCS.loadModule('recaptcha', module);
    }
})(
    function () {

        this.register = function () {
            if (recaptchaLoadComplete) {
                return;
            }
            var postLoad = [],
                recaptchaForms = jQuery(".btn-recaptcha").parents('form'),
                isInvisible = false;
            recaptchaForms.each(function (i, el){
                if (typeof recaptchaSiteKey === 'undefined') {
                    console.log('Recaptcha site key not defined');
                    return;
                }
                recaptchaCount += 1;
                var frm = jQuery(el),
                    btnRecaptcha = frm.find(".btn-recaptcha"),
                    required = (typeof requiredText !== 'undefined') ? requiredText : 'Required',
                    recaptchaId = 'divDynamicRecaptcha' + recaptchaCount;

                isInvisible = btnRecaptcha.hasClass('btn-recaptcha-invisible')

                // if no recaptcha element, make one
                var recaptchaContent = frm.find('#' + recaptchaId + ' .g-recaptcha'),
                    recaptchaElement = frm.find('.recaptcha-container'),
                    appendElement = frm;

                if (recaptchaElement.length) {
                    recaptchaElement.attr('id', recaptchaElement.attr('id') + recaptchaCount);
                    appendElement = recaptchaElement;
                }
                if (!recaptchaContent.length) {
                    appendElement.append('<div id="#' + recaptchaId + '" class="g-recaptcha"></div>');
                    recaptchaContent = appendElement.find('#' + recaptchaId);
                }
                // propagate invisible recaptcha if necessary
                if (!isInvisible) {
                    recaptchaContent.data('toggle', 'tooltip')
                        .data('placement', 'bottom')
                        .data('trigger', 'manual')
                        .attr('title', required)
                        .hide();
                }


                // alter form to work around JS behavior on .submit() when there
                // there is an input with the name 'submit'
                var btnSubmit = frm.find("input[name='submit']");
                if (btnSubmit.length) {
                    var action = frm.prop('action');
                    frm.prop('action', action + '&submit=1');
                    btnSubmit.remove();
                }

                // make callback for grecaptcha to invoke after
                // injecting token & make it known via data-callback
                var funcName = recaptchaId + 'Callback';
                window[funcName] = function () {
                    if (isInvisible) {
                        frm.submit();
                    }
                };

                // setup an on form submit event to ensure that we
                // are allowing required field validation to occur before
                // we do the invisible recaptcha checking
                if (isInvisible) {
                    recaptchaType = 'invisible';
                    frm.on('submit.recaptcha', function (event) {
                        var recaptchaId = frm.find('.g-recaptcha').data('recaptcha-id');
                        if (!grecaptcha.getResponse(recaptchaId).trim()) {
                            event.preventDefault();
                            grecaptcha.execute(recaptchaId);
                            recaptchaValidationComplete = false;
                        } else {
                            recaptchaValidationComplete = true;
                        }
                    });
                } else {
                    postLoad.push(function () {
                        recaptchaContent.slideDown('fast', function() {
                            // just in case there's a delay in DOM; rare
                            recaptchaContent.find(':first').addClass('center-block');
                        });
                    });
                    postLoad.push(function() {
                        recaptchaContent.find(':first').addClass('center-block');
                    });
                }
            });

            window.recaptchaLoadCallback = function() {
                jQuery('.g-recaptcha').each(function(i, el) {
                    var element = jQuery(el),
                        frm = element.closest('form'),
                        btn = frm.find('.btn-recaptcha'),
                        idToUse = element.attr('id').substring(1);
                    var recaptchaId = grecaptcha.render(
                        el,
                        {
                            sitekey: recaptchaSiteKey,
                            size: (btn.hasClass('btn-recaptcha-invisible')) ? 'invisible' : 'normal',
                            callback: idToUse + 'Callback'
                        }
                    );
                    element.data('recaptcha-id', recaptchaId);
                });
            }

            // fetch/invoke the grecaptcha lib
            if (recaptchaForms.length) {
                var gUrl = "https://www.google.com/recaptcha/api.js?onload=recaptchaLoadCallback&render=explicit";
                jQuery.getScript(gUrl, function () {
                    for(var i = postLoad.length - 1; i >= 0 ; i--){
                        postLoad[i]();
                    }
                });
            }
            recaptchaLoadComplete = true;
        };

        return this;
    });
    
/**
 * General utilities module
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2017
 * @license http://www.whmcs.com/license/ WHMCS Eula
 */
(function(module) {
    if (!WHMCS.hasModule('utils')) {
        WHMCS.loadModule('utils', module);
    }
})(
function () {
    /**
     * Not crypto strong; server-side must discard for
     * something with more entropy; the value is sufficient
     * for strong client-side validation check
     */
    this.simpleRNG = function () {
        var chars = './$_-#!,^*()|';
        var r = 0;
        for (var i = 0; r < 3; i++) {
            r += Math.floor((Math.random() * 10) / 2);
        }
        r = Math.floor(r);
        var s = '';
        for (var x = 0; x < r; x++) {
            v = (Math.random() + 1).toString(24).split('.')[1];
            if ((Math.random()) > 0.5) {
                s += btoa(v).substr(0,4)
            } else {
                s += v
            }

            if ((Math.random()) > 0.5) {
                s += chars.substr(
                    Math.floor(Math.random() * 13),
                    1
                );
            }
        }

        return s;
    };

    this.getRouteUrl = function (path) {
        return whmcsBaseUrl + "/index.php?rp=" + path;
    };

    this.validateBaseUrl = function() {
        if (typeof window.whmcsBaseUrl === 'undefined') {
            console.log('Warning: The WHMCS Base URL definition is missing '
                + 'from your active template. Please refer to '
                + 'https://docs.whmcs.com/WHMCS_Base_URL_Template_Variable '
                + 'for more information and details of how to resolve this '
                + 'warning.');
            window.whmcsBaseUrl = this.autoDetermineBaseUrl();
            window.whmcsBaseUrlAutoSet = true;
        } else if (window.whmcsBaseUrl === ''
            && typeof window.whmcsBaseUrlAutoSet !== 'undefined'
            && window.whmcsBaseUrlAutoSet === true
        ) {
            window.whmcsBaseUrl = this.autoDetermineBaseUrl();
        }
    };

    this.autoDetermineBaseUrl = function() {
        var windowLocation = window.location.href;
        var phpExtensionLocation = -1;

        if (typeof windowLocation !== 'undefined') {
            phpExtensionLocation = windowLocation.indexOf('.php');
        }

        if (phpExtensionLocation === -1) {
            windowLocation = jQuery('#Primary_Navbar-Home a').attr('href');
            if (typeof windowLocation !== 'undefined') {
                phpExtensionLocation = windowLocation.indexOf('.php');
            }
        }

        if (phpExtensionLocation !== -1) {
            windowLocation = windowLocation.substring(0, phpExtensionLocation);
            var lastTrailingSlash = windowLocation.lastIndexOf('/');
            if (lastTrailingSlash !== false) {
                return windowLocation.substring(0, lastTrailingSlash);
            }
        }

        return '';
    };

    this.normaliseStringValue = function(status) {
        return status ? status.toLowerCase().replace(/\s/g, '-') : '';
    };

    this.generatePassword = function(len) {
        var charset = this.getPasswordCharacterSet();
        var result = "";
        for (var i = 0; len > i; i++)
            result += charset[this.randomInt(charset.length)];
        return result;
    };
    this.getPasswordCharacterSet = function() {
        var rawCharset = '0123456789'
            + 'abcdefghijklmnopqrstuvwxyz'
            + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
            + '!#$%()*+,-.:;=@_|{ldelim}{rdelim}~';

        // Parse UTF-16, remove duplicates, convert to array of strings
        var charset = [];
        for (var i = 0; rawCharset.length > i; i++) {
            var c = rawCharset.charCodeAt(i);
            if (0xD800 > c || c >= 0xE000) {  // Regular UTF-16 character
                var s = rawCharset.charAt(i);
                if (charset.indexOf(s) == -1)
                    charset.push(s);
                continue;
            }
            if (0xDC00 > c ? rawCharset.length > i + 1 : false) {  // High surrogate
                var d = rawCharset.charCodeAt(i + 1);
                if (d >= 0xDC00 ? 0xE000 > d : false) {  // Low surrogate
                    var s = rawCharset.substring(i, i + 2);
                    i++;
                    if (charset.indexOf(s) == -1)
                        charset.push(s);
                    continue;
                }
            }
            throw "Invalid UTF-16";
        }
        return charset;
    };
    this.randomInt = function(n) {
        var x = this.randomIntMathRandom(n);
        x = (x + this.randomIntBrowserCrypto(n)) % n;
        return x;
    };
    this.randomIntMathRandom = function(n) {
        var x = Math.floor(Math.random() * n);
        if (0 > x || x >= n)
            throw "Arithmetic exception";
        return x;
    };
    this.randomIntBrowserCrypto = function(n) {
        var cryptoObject = null;

        if ("crypto" in window)
            cryptoObject = crypto;
        else if ("msCrypto" in window)
            cryptoObject = msCrypto;
        else
            return 0;

        if (!("getRandomValues" in cryptoObject) || !("Uint32Array" in window) || typeof Uint32Array != "function")
            cryptoObject = null;

        if (cryptoObject == null)
            return 0;

        // Generate an unbiased sample
        var x = new Uint32Array(1);
        do cryptoObject.getRandomValues(x);
        while (x[0] - x[0] % n > 4294967296 - n);
        return x[0] % n;
    };

    return this;
});

WHMCS.utils.validateBaseUrl();

jQuery(document).ready(function() {
    jQuery('#main-body').on('click', '.product-recommendations .product-recommendation .header', function(e) {
        if (jQuery(e.target).is('.btn, .btn span, .btn .fa')) {
            return;
        }
        e.preventDefault();
        if (jQuery('.fa-square', this).length > 0) {
            return;
        }
        jQuery(this).parent().find('.rotate').toggleClass('down');
        jQuery(this).parent().find('.body').slideToggle('fast');
    }).on('click', '.product-recommendations .product-recommendation .btn-add', function() {
        jQuery(this).attr('disabled', 'disabled')
            .find('span.arrow i')
            .removeClass('fa-chevron-right')
            .addClass('fa-spinner fa-spin');
    }).on('click', '.order-button, .order-btn, .btn-order-now', function(e) {
        if (jQuery(this).data('hasRecommendations') == 1) {
            e.preventDefault();
            var href = jQuery(this).attr('href');
            jQuery('i', this).removeClass().addClass('fas fa-spinner fa-spin');
            displayRecommendations(
                href,
                'addproductajax=1',
                true
            ).done(function() {
                window.location = href;
            });
        }
    });
    setRecommendationColors();
    if (document.URL.includes('cart.php?a=checkout') || document.URL.includes('cart.php?a=view')) {
        if (jQuery('#recommendationsModal .product-recommendation:not(.clonable)').length > 0) {
            jQuery('#recommendationsModal').modal('toggle');
        }
    }
});

function getRecommendationColors(hex, percentage) {
    var primary = tinycolor(hex),
        secondary,
        text = tinycolor('fff'),
        brightness = Math.round(Math.min(primary.getBrightness()/255) * 100),
        baseBrightnessPercent = 25;
    if (brightness < baseBrightnessPercent) {
        primary.lighten(baseBrightnessPercent - brightness);
    } else if (brightness > (100 - baseBrightnessPercent)) {
        primary.darken(brightness - (100 - baseBrightnessPercent));
    }
    secondary = primary.clone().darken(percentage);
    if (secondary.isLight()) {
        text = tinycolor('000');
    }
    return [primary.toHexString(), secondary.toHexString(), text.toHexString()];
};

function setRecommendationColors() {
    var colors,
        defaultColor = '#9abb3a';
    jQuery('.product-recommendations .product-recommendation').each(function() {
        var element = jQuery(this),
            primaryColor = element.data('color');
        if (!(primaryColor.length > 0) || (primaryColor.match(/^#[0-9A-Fa-f]{3,6}$/gi) == undefined)) {
            primaryColor = defaultColor;
        }
        colors = getRecommendationColors(primaryColor, 15);
        element.css('border-color', colors[0]);
        jQuery('.btn-add', element).css('background-color', colors[0]);
        jQuery('.expander', element).css('color', colors[0]);
        jQuery('.price', element).css('color', colors[1]);
        jQuery('.text', element).css({'color': colors[2]});
        jQuery('.arrow', element).css({'background-color': colors[1], 'color': colors[2]});
    });
}

function displayRecommendations(postUrl, postData, postForce) {
    var deferredObject = jQuery.Deferred(),
        hasRecommendations = jQuery('#divProductHasRecommendations').data('value'),
        modal = jQuery('#recommendationsModal'),
        shoppingCartBtn = jQuery('.cart-btn .badge');
    if (postForce || hasRecommendations) {
        jQuery('.cart-body button[type="submit"] i')
            .removeClass('fa-arrow-circle-right')
            .addClass('fa-spinner fa-spin');
        WHMCS.http.jqClient.jsonPost({
            url: postUrl,
            data: postData,
            success: function(data) {
                if (data.success && data.href) {
                    modal.on('hide.bs.modal', function() {
                        window.location = data.href;
                        return false;
                    });
                    jQuery('#btnContinueRecommendationsModal', modal)
                        .attr('href', data.href)
                        .click(function () {
                            jQuery('span', this).removeClass('w-hidden hidden');
                        });
                    jQuery('.modal-body', modal).html('').html(data.html);
                    setRecommendationColors();
                    modal.modal('show');
                    jQuery('i.fa-spinner.fa-spin:visible').removeClass('fa-spinner fa-spin').addClass('fa-check-circle');
                    shoppingCartBtn.text(data.count);
                } else if (!data.success && data.href) {
                    window.location = data.href;
                } else {
                    deferredObject.resolve(false);
                }
            },
            error: function() {
                deferredObject.resolve(false);
            }
        });
    } else {
        deferredObject.resolve(false);
    }
    return deferredObject.promise();
}

if (typeof localTrans === 'undefined') {
    localTrans = function (phraseId, fallback)
    {
        if (typeof _localLang !== 'undefined') {
            if (typeof _localLang[phraseId] !== 'undefined') {
                if (_localLang[phraseId].length > 0) {
                    return _localLang[phraseId];
                }
            }
        }

        return fallback;
    }
}

var domainLookupCallCount,
    furtherSuggestions,
    hideCvcOnCheckoutForExistingCard = 0;




jQuery(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    var cardNumber = jQuery('#inputCardNumber'),
        existingCvv = jQuery('#inputCardCVV2');
    if (cardNumber.length) {
        cardNumber.payment('formatCardNumber');
        jQuery('#inputCardCVV').payment('formatCardCVC');
        jQuery('#inputCardStart').payment('formatCardExpiry');
        jQuery('#inputCardExpiry').payment('formatCardExpiry');
    }
    if (existingCvv.length) {
        existingCvv.payment('formatCardCVC');
    }

    /*
    *******************************************
    1. Product domain search box
    *******************************************
    */
 
    jQuery(".panel-domain-option input").each(function(){
        let that = $(this);
        setTimeout(function(){
            if (that[0].checked === true){
                that.closest('.radio-styled').addClass('checked');
                var value = that.val();
                jQuery("#domain" + value).removeClass('hidden');
            }
        },50)
    });
    setTimeout(function(){
        var checkedOption = jQuery(".panel-domain-option .radio-styled.checked");
        if (!checkedOption.length){
            var firstInput = jQuery(".panel-domain-option input:first");
            jQuery(firstInput).iCheck('check');
            jQuery("#domain" + jQuery(".panel-domain-option input:first").val()).removeClass('hidden');
        }
    }, 60)

    jQuery(".panel-domain-option input").on('ifChecked', function (event) {
        jQuery(".inline-form").addClass('hidden');
        jQuery("#domain" + jQuery(this).val()).removeClass('hidden');
    });
    /*
    *******************************************
    2. Product domain search results
    *******************************************
    */
   jQuery('#frmProductDomain').submit(function (e) {
    e.preventDefault();
    var btnSearchObj = jQuery(this).find('button[type="submit"]'),
        domainSearchResults = jQuery("#DomainSearchResults"),
        spotlightTlds = jQuery('#spotlightTlds'),
        suggestions = jQuery('#domainSuggestions'),
        btnDomainContinue = jQuery('#btnDomainContinue'),
        domainoption = jQuery(".panel-domain-option input:checked").val(),
        sldInput = jQuery("#" + domainoption + "sld"),
        sld = sldInput.val(),
        tld = '',
        pid = jQuery('#frmProductDomainPid').val(),
        tldInput = '',
        idnLanguage = jQuery('#idnLanguageSelector');

    jQuery('.field-error-msg').hide();
    if (!idnLanguage.hasClass('hidden')) {
        idnLanguage.addClass('hidden');
        idnLanguage.find('select').val('');
    }
    if (domainoption == 'incart') {
        sldInput = jQuery("#" + domainoption + "sld option:selected");
        sld = sldInput.text();
    // } else if (domainoption == 'subdomain') {
    //     tldInput = jQuery("#" + domainoption + "tld option:selected");
    //     tld = tldInput.text();
    } else {
        tldInput = jQuery("#" + domainoption + "tld");
        tld = tldInput.val();
        if (sld && !tld) {
            tldInput.tooltip('show');
            tldInput.focus();
            return false;
        }
        if (tld.substr(0, 1) != '.') {
            tld = '.' + tld;
        }
    }
    if (!sld) {
        sldInput.tooltip('show');
        sldInput.focus();
        return false;
    }
    sldInput.tooltip('hide');
    if (tldInput.length) {
        tldInput.tooltip('hide');
    }


    

    jQuery('input[name="domainoption"]').iCheck('disable');
    domainLookupCallCount = 0;
    btnSearchObj.attr('disabled', 'disabled').addClass('disabled');
    btnSearchObj.find('span').addClass('invisible');
    //jQuery('.domain-lookup-loader').removeClass('hidden');
    
    //jQuery('#DomainSearchResults').addClass('hidden');
    
    if (domainoption == 'register') {
        var inputDomainLastCheck = sldInput.attr('data-last-check'),
            inputTldLastCheck = tldInput.attr('data-last-check');
        if (inputDomainLastCheck == sldInput.val() && inputTldLastCheck == tldInput.val()){
            setTimeout(function(){
                jQuery('input[name="domainoption"]').iCheck('enable');
                btnSearchObj.removeAttr('disabled').removeClass('disabled');
                btnSearchObj.find('span').removeClass('invisible');
            }, 500)
           
            return;
        }
    }
    else{
        $('#registersld').removeAttr('data-last-check');
        $('#registertld').removeAttr('data-last-check');
    }

    suggestions.find('li').addClass('hidden').end()
        .find('.clone').remove().end();
    jQuery('div.panel-footer.more-suggestions').addClass('hidden')
        .find('a').removeClass('hidden').end()
        .find('span.no-more').addClass('hidden');
    jQuery('.btn-add-to-cart').removeAttr('disabled')
        .find('span').hide().end()
        .find('span.to-add').show();
    btnDomainContinue.addClass('hidden').attr('disabled', 'disabled');
    if (domainoption != 'register') {
        jQuery('#primaryLookupResult > div').filter(function() {
            return $(this).closest('#idnLanguageSelector').length === 0;
        }).hide();
        spotlightTlds.hide();
        jQuery('.suggested-domains').hide();
    }
    // if (!domainSearchResults.is(":visible")) {
    //     domainSearchResults.removeClass('hidden');
    // }
    if (domainoption == 'register') {
        // jQuery('#DomainSearchResults').addClass('hidden');
        jQuery('#resultDomainOption').val(domainoption);
        var lookup = jQuery.post(
                WHMCS.utils.getRouteUrl('/domain/check'),
                {
                    token: csrfToken,
                    type: 'domain',
                    domain: sld + tld,
                    sld: sld,
                    tld: tld,
                    source: 'cartAddDomain'
                },
                'json'
            ),
            spotlight = jQuery.post(
                WHMCS.utils.getRouteUrl('/domain/check'),
                {
                    token: csrfToken,
                    type: 'spotlight',
                    domain: sld + tld,
                    sld: sld,
                    tld: tld,
                    source: 'cartAddDomain'
                },
                'json'
            ),
            suggestion = jQuery.post(
                WHMCS.utils.getRouteUrl('/domain/check'),
                {
                    token: csrfToken,
                    type: 'suggestions',
                    domain: sld + tld,
                    sld: sld,
                    tld: tld,
                    source: 'cartAddDomain'
                },
                'json'
            );
        // primary lookup handler
        lookup.done(function (data) {
            jQuery.each(data.result, function (index, domain) {
                var pricing = null,
                    result = jQuery('#primaryLookupResult'),
                    available = result.find('.domain-available'),
                    availablePrice = result.find('.domain-price'),
                    unavailable = result.find('.domain-unavailable'),
                    invalid = result.find('.domain-invalid'),
                    contactSupport = result.find('.domain-contact-support'),
                    resultDomain = jQuery('#resultDomain'),
                    resultDomainPricing = jQuery('#resultDomainPricingTerm');
                    transferEligible = result.find('.transfer-eligible');
                    transferNotEligible = result.find('.transfer-not-eligible');
                    error = result.find('.domain-error');
                result.removeClass('hidden').show();               
                if (typeof domain !== 'string' && !domain.error && domain.isValidDomain) {
                    unavailable.hide();
                    contactSupport.hide();
                    invalid.hide();
                    transferEligible.hide();
                    transferNotEligible.hide();
                    error.hide();
                    pricing = domain.pricing;
                    if (domain.isAvailable && typeof pricing !== 'string') {
                        if (domain.domainName !== domain.idnDomainName && idnLanguage.hasClass('hidden')) {
                            idnLanguage.removeClass('hidden');
                        }
                        if (domain.preferredTLDNotAvailable) {
                            unavailableTld.show().find('strong').html(domain.originalUnavailableTld);
                        }
                        available.show().find('strong').html(domain.domainName);
                        availablePrice.show().find('.price').html(pricing[Object.keys(pricing)[0]].register).end();
                        available.find('button').attr('data-domain', domain.domainName);
                        
                        var isAutomaticAddToCart = $('#primaryLookupResult').attr('data-add-to-cart-on-search');

                        var isBundle = $('#primaryLookupResult').attr('data-product-bundle');
                        if ((typeof isBundle !== 'undefined' && isBundle !== false) || (typeof isAutomaticAddToCart !== 'undefined' && isAutomaticAddToCart !== false)) {
                            resultDomain.val(domain.domainName);
                            resultDomainPricing.val(Object.keys(pricing)[0]).attr('name', 'domainsregperiod[' + domain.domainName + ']');
                            var counterDomain =  parseInt(jQuery('#cartItemCount').text()),
                            domainNumber = counterDomain + 1;
                            $('.bottom-action-sticky').removeClass('hidden').addClass('is-fixed');
                            jQuery('#cartItemCount').html(domainNumber).addClass('badge-primary');
                        }
                        
                        if (typeof isAutomaticAddToCart !== 'undefined' && isAutomaticAddToCart !== false){

                            var addButton = jQuery('button[data-domain="' + domain.domainName + '"]').not('.btn-remove-domain'),
                                removeButton = jQuery('.btn-remove-domain[data-domain="' + domain.domainName + '"]');
                                addButton.find('span.to-add').hide();
                                addButton.find('span.added').show().parent().removeClass('btn-primary-faded').addClass('btn-primary').addClass('checkout').end();
                                addButton.each(function(){
                                    if ($(this).data("system-style") && $(this).data("system-style") == "futuristic"){
                                        $(this).removeClass('btn-outline');
                                    }
                                });
                                removeButton.removeClass('hidden');
                        }
                        btnDomainContinue.removeAttr('disabled');
                        

                    } else {
                        available.hide();
                        availablePrice.hide();
                        contactSupport.hide();
                        invalid.hide();
                        transferEligible.hide();
                        transferNotEligible.hide();
                        error.hide();
                        var displayDomain = domain.originalUnavailableDomain
                            ? domain.originalUnavailableDomain
                            : domain.domainName;
                        unavailable.show().find('strong').html(displayDomain);
                        if (typeof pricing === 'string' && pricing == 'ContactUs') {
                            contactSupport.show();
                        }
                    }
                } else {
                    var invalidLength = invalid.find('span.domain-length-restrictions'),
                        done = false,
                        reg = /<br\s*\/>/,
                        errors = [];
                    invalidLength.hide();
                    error.hide();
                    available.hide();
                    availablePrice.hide();
                    contactSupport.hide();
                    invalid.hide();
                    transferEligible.hide();
                    transferNotEligible.hide();
                    error.hide();
                    unavailable.hide();
                    var errorText = error.find('.message-title');
                    if (domain.minLength > 0 && domain.maxLength > 0) {
                        invalidLength.find('.min-length').html(domain.minLength).end()
                            .find('.max-length').html(domain.maxLength).end();
                        invalidLength.show();
                    } else if (data.result.error) {
                        if (!data.result.error.match(reg)) {
                            errorText.text(data.result.error);
                        } else {
                            errorText.text('');
                            errors = data.result.error.split(reg);
                            for(var i=0; i < errors.length; i++) {
                                var errorMsg = errors[i];
                                if (errorMsg.length) {
                                    if (errorText.text()) {
                                        // only add line break if there is
                                        // multiple lines of text
                                        errorText.append('<br />');
                                    }
                                    errorText.append(jQuery('<span></span>').text(errorMsg));
                                }
                            }
                        }
                        error.show();
                        done = true;
                    }
                    if (!done) {
                        invalid.show();
                    }
                }
            });
            sldInput.attr('data-last-check', sldInput.val());
            tldInput.attr('data-last-check', tldInput.val());

        }).always(function () {
            //jQuery('.domain-lookup-loader').addClass('hidden');
            jQuery('#DomainSearchResults').removeClass('hidden');
            if(jQuery('#DomainSearchResults').data('scroll-to-results') == true){
                jQuery("html, body").animate({ scrollTop: $('#DomainSearchResults').offset().top - 150 }, 500);
            }
            btnSearchObj.removeAttr('disabled').removeClass('disabled');
            btnSearchObj.find('span').removeClass('invisible');
            hasProductDomainLookupEnded(3, btnSearchObj);
        });
        // spotlight lookup handler
        spotlight.done(function (data) {
       
            if (typeof data != 'object' || data.result.length == 0 || data.result.error) {
                jQuery('.domain-lookup-spotlight-loader').hide();
                return;
            }
            else{
                spotlightTlds.show();
            }

            jQuery.each(data.result, function (index, domain) {
                var tld = domain.tldNoDots,
                    pricing = domain.pricing,
                    result = jQuery('#spotlight' + tld + ' .domain-lookup-result');
                jQuery('.domain-lookup-spotlight-loader').hide();
                result.find('button').not('.btn-loading').addClass('hidden').removeClass('checkout').end();
                result.find('.btn-loading').removeClass('hidden')
                if (domain.isValidDomain) {
                    if (domain.isAvailable && typeof pricing !== 'string') {
                        if (domain.domainName !== domain.idnDomainName && idnLanguage.hasClass('hidden')) {
                            idnLanguage.removeClass('hidden');
                        }
                        result
                            .find('span.available').html(pricing[Object.keys(pricing)[0]].register).removeClass('hidden').end()
                            .find('button.btn-add-to-cart')
                            .attr('data-domain', domain.domainName)
                            .removeClass('hidden');
                        result.find('.btn-loading').addClass('hidden');    
                        result.find('button.btn-remove-domain').attr('data-domain', domain.domainName);    

                    } else {
                        if (typeof pricing === 'string') {
                            if (pricing == '') {
                                result.find('button.unavailable').removeClass('hidden').end();
                            } else {
                                result.find('button.domain-contact-support').removeClass('hidden').end();
                            }
                            result.find('span.available').addClass('hidden').end();
                            result.find('.btn-loading').addClass('hidden');    
                        } else {
                            result.find('button.unavailable').removeClass('hidden').end();
                            result.find('span.available').addClass('hidden').end();
                            result.closest('.spotlight').addClass("spotlight-disabled");
                            result.find('.btn-loading').addClass('hidden');    
                        }
                    }
                } else {
                    result.find('button.invalid.hidden').removeClass('hidden').end()
                        .find('span.available').addClass('hidden').end()
                        .find('button').not('button.invalid').addClass('hidden');
                        result.find('.btn-loading').addClass('hidden');    

                }
               
                
            });
        }).always(function () {
            hasProductDomainLookupEnded(3, btnSearchObj);
            var isAutomaticAddToCart = $('#primaryLookupResult').attr('data-add-to-cart-on-search');
            if (typeof isAutomaticAddToCart !== 'undefined' && isAutomaticAddToCart !== false){

                var domainName = jQuery('#primaryLookupResult .domain-available .btn-add-to-cart').data('domain');
                    addButton = jQuery('#spotlightTlds button[data-domain="' + domainName + '"]').not('.btn-remove-domain'),
                    removeButton = jQuery('#spotlightTlds .btn-remove-domain[data-domain="' + domainName + '"]');
                    addButton.find('span.to-add').hide();
                    addButton.find('span.added').show().parent().removeClass('btn-primary-faded').addClass('btn-primary').addClass('checkout').end();
                    addButton.each(function(){
                        if ($(this).data("system-style") && $(this).data("system-style") == "futuristic"){
                            $(this).removeClass('btn-outline');
                        }
                    });
                    removeButton.removeClass('hidden');
            }
        });
        // suggestions lookup handler
        suggestion.done(function (data) {
            if (typeof data != 'object' || data.result.length == 0 || data.result.error) {
                jQuery('.suggested-domains').fadeOut('fast', function () {
                    jQuery(this).addClass('hidden');
                });
                return;
            } else {
                jQuery('.suggested-domains').removeClass('hidden').show();
            }
            var suggestionCount = 1;
            jQuery.each(data.result, function (index, domain) {
                var tld = domain.tld,
                    pricing = domain.pricing;
                suggestions.find('li:first').clone(true, true).appendTo(suggestions);
                var newSuggestion = suggestions.find('li.domain-suggestion').last();
                newSuggestion.addClass('clone')
                    .find('span.domain').html(domain.sld).end()
                    .find('span.extension').html('.' + tld).end();
                    if (domain.domainName !== domain.idnDomainName && idnLanguage.hasClass('hidden')) {
                        idnLanguage.removeClass('hidden');
                    }
                if (typeof pricing === 'string') {
                    newSuggestion.find('button.btn-add-to-cart').remove();
                    if (pricing != '') {
                        newSuggestion.find('button.domain-contact-support').removeClass('hidden').end()
                            .find('span.price').hide();
                    } else {
                        newSuggestion.remove();
                    }
                } else {
                    newSuggestion.find('button.btn-add-to-cart').attr('data-domain', domain.domainName).end()
                        .find('span.price').html(pricing[Object.keys(pricing)[0]].register).end();
                    newSuggestion.find('button.btn-remove-domain').attr('data-domain', domain.domainName);
                    newSuggestion.find('button.btn-remove-domain').tooltip('enable');    
                }
                if (suggestionCount <= 10) {
                    newSuggestion.removeClass('hidden');
                }
                suggestionCount++;
                if (domain.group) {
                    newSuggestion.find('span.promo')
                        .addClass(domain.group)
                        .removeClass('hidden')
                        .end();
                    newSuggestion.find('span.sales-group-' + domain.group)
                        .removeClass('hidden')
                        .end();
                }
                furtherSuggestions = suggestions.find('li.domain-suggestion.clone.hidden').length;
                if (furtherSuggestions > 0) {
                    jQuery('div.more-suggestions').removeClass('hidden');
                }
            });
            jQuery('.domain-lookup-suggestions-loader').hide();
            jQuery('#domainSuggestions').removeClass('hidden');
        }).always(function () {
            hasProductDomainLookupEnded(3, btnSearchObj);
           
        });
    } else if (domainoption == 'transfer') {
        jQuery('#resultDomainOption').val(domainoption);
        var transfer = jQuery.post(
            WHMCS.utils.getRouteUrl('/domain/check'),
            {
                token: csrfToken,
                type: 'transfer',
                domain: sld + tld,
                sld: sld,
                tld: tld,
                source: 'cartAddDomain'
            },
            'json'
        );
        transfer.done(function (data) {
            if (typeof data != 'object' || data.result.length == 0) {
                jQuery('.domain-lookup-loader').addClass('hidden');
                return;
            }
            var result = jQuery('#primaryLookupResult'),
                transfereligible = result.find('.transfer-eligible'),
                transferPrice = result.find('.domain-price'),
                transfernoteligible = result.find('.transfer-not-eligible'),
                resultDomain = jQuery('#resultDomain'),
                resultDomainPricing = jQuery('#resultDomainPricingTerm'),
                transferEligibleDesc = transfereligible.find('.transfer-eligible-desc'),
                transferEligibleDescUk = transfereligible.find('.transfer-eligible-desc-uk'),
                domainPriceText = transfereligible.find('.domain-price-text');
            if (Object.keys(data.result).length === 0) {
                jQuery('.domain-lookup-loader').addClass('hidden');
                result.removeClass('hidden').show();
                transfernoteligible.show();
            }
            jQuery.each(data.result, function (index, domain) {
                var pricing = domain.pricing;
                jQuery('.domain-lookup-loader').addClass('hidden');
                result.removeClass('hidden').show();
                if (domain.isRegistered) {
                    transfereligible.show();
                    transferPrice.show().find('.register-price-label').hide().end()
                        .find('.transfer-price-label').removeClass('hidden').show().end()
                        .find('.price').html(pricing[Object.keys(pricing)[0]].transfer).end()
                        .find('button').attr('data-domain', domain.domainName);
                    if (domain.tld.includes('uk')){
                        transferEligibleDesc.addClass('hidden');
                        transferEligibleDescUk.removeClass('hidden');
                        domainPriceText.addClass('hidden');
                    }    
                    else{
                        transferEligibleDesc.removeClass('hidden');
                        transferEligibleDescUk.addClass('hidden');
                        domainPriceText.removeClass('hidden');
                    }
                    resultDomain.val(domain.domainName);
                    resultDomainPricing.val(Object.keys(pricing)[0]).attr('name', 'domainsregperiod[' + domain.domainName + ']');
                    btnDomainContinue.removeAttr('disabled');
                } else {
                    transfernoteligible.show();
                }
            });
        }).always(function () {
            hasProductDomainLookupEnded(1, btnSearchObj);
            jQuery('.domain-lookup-loader').addClass('hidden');
            jQuery('#DomainSearchResults').removeClass('hidden');
        });
    } else if (domainoption == 'owndomain' || domainoption == 'subdomain' || domainoption == 'incart') {
        var otherDomain = WHMCS.http.jqClient.post(
            WHMCS.utils.getRouteUrl('/domain/check'),
            {
                token: csrfToken,
                type: domainoption,
                pid: pid,
                domain: sld + tld,
                sld: sld,
                tld: tld,
                source: 'cartAddDomain'
            },
            'json'
        );
        otherDomain.done(function (data) {
            if (typeof data != 'object' || data.result.length == 0) {
                jQuery('.domain-lookup-subdomain-loader').hide();
                return;
            }
            jQuery.each(data.result, function (index, result) {
                if (result.status === true) {
                    displayRecommendations(
                        whmcsBaseUrl + '/cart.php',
                        'addproductajax=1&a=confproduct&i=' + result.num,
                        false
                    ).done(function() {
                        window.location = whmcsBaseUrl + '/cart.php?a=confproduct&i=' + result.num;
                    });
                } else {
                    jQuery('.domain-lookup-loader').addClass('hidden');
                    if (typeof result === 'string') {
                        jQuery('#primaryLookupResult').removeClass('hidden').show().find('.domain-error .message-title').text(result).closest('.domain-error').show(); 
                    } else {
                        jQuery('#primaryLookupResult').removeClass('hidden').show().find('.domain-invalid').show();
                    }
                }
            });
        }).always(function () {
            hasProductDomainLookupEnded(1, btnSearchObj);
            jQuery('.domain-lookup-loader').addClass('hidden');
            jQuery('#DomainSearchResults').removeClass('hidden');
        });
    }
    btnDomainContinue.removeClass('hidden');
});
    /*
    *******************************************
    3. Add Domain To Cart
    *******************************************
    */
    jQuery('.btn-add-to-cart').on('click', function (e) {
        if (jQuery(this).hasClass('checkout')) {
            if (jQuery(this).data('product-domain')){
                $('#frmProductDomainSelections').submit();
                return;
            } 
            else{
                window.location = 'cart.php?a=confdomains';
                return;
            }
        }
        else{
            e.preventDefault();
        }
        var domain = jQuery(this).attr('data-domain'),
            buttons = jQuery('button[data-domain="' + domain + '"]').not('.btn-remove-domain'),
            buttonsRemove = jQuery('.btn-remove-domain[data-domain="' + domain + '"]'),
            whois = jQuery(this).attr('data-whois'),
            isProductDomain = jQuery(this).hasClass('product-domain'),
            btnDomainContinue = jQuery('#btnDomainContinue'),
            resultDomain = jQuery('#resultDomain'),
            resultDomainPricing = jQuery('#resultDomainPricingTerm'),
            idnLanguage = jQuery('#idnLanguageSelector'),
            idnLanguageInput = idnLanguage.find('select');

        if (!idnLanguage.hasClass('hidden') && !idnLanguageInput.val()) {
            idnLanguageInput.showInputError();
            return;
        }    
        buttons.attr('disabled', 'disabled');
        var sideOrder = ((jQuery(this).parents('.spotlight-tlds').length > 0) || (jQuery(this).parents('.suggested-domains').length > 0)) ? 1 : 0;

        if (window.location.pathname.indexOf("cart.php") < 0 ){
            var ajaxUrl = whmcsBaseUrl+'/cart.php';
        }
        else{
            var ajaxUrl = window.location.pathname;
        }

        var addToCart = jQuery.post(
            ajaxUrl,
            {
                a: 'addToCart',
                domain: domain,
                token: csrfToken,
                whois: whois,
                sideorder: sideOrder,
                idnlanguage: idnLanguageInput.val()
            },
            'json'
        ).done(function (data) {
            buttons.find('span.to-add').hide();
            if (data.result === 'added') {
                buttons.find('span.added').show().parent().removeClass('btn-primary-faded').addClass('btn-primary').end();
                buttons.each(function(){
                    if ($(this).data("system-style") && $(this).data("system-style") == "futuristic"){
                        $(this).removeClass('btn-outline');
                    }
                });
               
                buttonsRemove.removeClass('hidden');
                $('.bottom-action-sticky').removeClass('hidden').addClass('is-fixed');
                if (!isProductDomain) {
                    buttons.removeAttr('disabled').addClass('checkout').closest('.list-group-item').addClass('added');
                }
                if (resultDomain.length && !resultDomain.val()) {
                    resultDomain.val(domain);
                    resultDomainPricing.val(data.period).attr('name', 'domainsregperiod[' + domain + ']');
                    if (btnDomainContinue.length > 0 && btnDomainContinue.is(':disabled')) {
                        btnDomainContinue.removeAttr('disabled');
                    }
                }
                var counterDomain =  parseInt(jQuery('#cartItemCount').text()),
                    domainNumber = counterDomain + 1;

                jQuery('#cartItemCount').html(domainNumber).addClass('badge-primary');
            } else {
                buttons.find('span.available.price').hide();
                buttons.find('span.unavailable').show();
                buttons.attr('disabled', 'disabled');
            }
        });
    });

    $('#frmProductDomainSelections').on('submit', function(e){
        var idnLanguage = jQuery('#idnLanguageSelector'),
            idnLanguageInput = idnLanguage.find('select'),
            form = jQuery(this);

        if (!idnLanguage.hasClass('hidden') && !idnLanguageInput.val()) {
            e.preventDefault();
            idnLanguageInput.showInputError();
            $('#btnDomainContinue span.invisible').removeClass('invisible');
            return false;
        }
        e.preventDefault();
        displayRecommendations(
            form.attr('action'),
            'addproductajax=1&' + form.serialize(),
            false
        ).done(function() {
            form.unbind().submit();
            form.submit();
        });
    });

    jQuery('#idnLanguageSelector').find('select').on('change', function(){
        var idnLanguage = jQuery('#idnLanguageSelector'),
            idnLanguageInput = idnLanguage.find('select');
           
        if (!idnLanguage.hasClass('hidden') && idnLanguageInput.val()) {
            idnLanguageInput.closest('.form-group').removeClass('has-error').find('.field-error-msg').hide();
        }
    });

    $('.btn-remove-domain').on('click', function (e) {
        let btnRemoveDomain = $(this), 
            template = btnRemoveDomain.data('system-template'),
            btnAddDomain = btnRemoveDomain.siblings('.btn-add-to-cart');
          
        $.ajax({
            type: 'POST',
            data: {
                domainId: ''
                },
            url: whmcsBaseUrl+'/templates/'+template+'/core/api/getcartsession.php',
            success: function (response) {
                response = JSON.parse(response);
                var domainsArr = response.session.domains,
                    domainIndex = false,
                    domain = btnRemoveDomain[0].dataset.domain; 

                btnRemoveDomain.find('i').addClass('invisible');
                btnRemoveDomain.find('.loader').removeClass('hidden');
                btnAddDomain.addClass('disabled');

                domainsArr.map((singleDomain, index) => {
                    
                    if(btnRemoveDomain[0].dataset.domain == singleDomain.domain) {
                        domainIndex = index
                    }
                });
               
                if ((domainIndex || domainIndex === 0) && domain){
                    $.ajax({
                        type: 'POST',
                        url: 'cart.php?a=remove&r=d&i=' + domainIndex,
                        success: function (responseCart) {
                            var buttons = jQuery('button[data-domain="' + domain + '"]').not('.btn-remove-domain'),
                                buttonsRemove = jQuery('.btn-remove-domain[data-domain="' + domain + '"]'),
                                resultDomain = jQuery('#resultDomain'),
                                resultDomainPricing = jQuery('#resultDomainPricingTerm');
                            
                            buttons.removeClass('btn-primary checkout disabled').addClass('btn-primary-faded');
                            buttons.each(function(){
                                if ($(this).data("system-style") && $(this).data("system-style") == "futuristic"){
                                    $(this).removeClass('btn-primary-faded').addClass('btn-outline');
                                }                               
                            });
                            
                            buttons.find('span.to-add').show();
                            buttons.find('span.added').hide()
                            btnRemoveDomain.find('.invisible').removeClass('invisible')
                            btnRemoveDomain.find('.loader').addClass('hidden')
                            buttonsRemove.addClass('hidden');

                            let domainNumber = $('#cartItemCount')
                            let domainsArrLength = [...document.querySelectorAll('#DomainSearchResults .btn-primary.checkout.btn-add-to-cart')].length
                            if(domainsArrLength == 0) {
                                $('.bottom-action-sticky').addClass('hidden');
                            }
                            domainNumber.text(domainsArrLength);

                            if (resultDomain.length && resultDomain.val() == domain) {
                                resultDomain.val('');
                                resultDomainPricing.val('');
                                resultDomainPricing.attr('name', '');
                            }
 
                        },
                        error: function (err) {
                            console.log(err)
                        },
                    });
                }
            },
            error: function (err) {
                console.log(err)
            }
        });
    });

    /*
    *******************************************
    4. Domain Register Search
    *******************************************
    */
    jQuery('#frmDomainChecker').submit(function (e) {
        e.preventDefault();

        if (
            typeof recaptchaValidationComplete !== 'undefined'
            && typeof recaptchaType !== 'undefined'
            && recaptchaType === 'invisible'
            && recaptchaValidationComplete === false
        ) {
            return;
        }

        //jQuery('#DomainSearchResults').addClass('hidden');
  
        var frmDomain = jQuery('#frmDomainChecker'),
            inputDomain = jQuery('#inputDomain'),
            suggestions = jQuery('#domainSuggestions'),
            reCaptchaContainer = jQuery('#divDynamicRecaptcha'),
            captcha = jQuery('#inputCaptcha'),
            idnLanguage = jQuery('#idnLanguageSelector');
        domainLookupCallCount = 0;

        jQuery('.field-error-msg').hide();

        if (!idnLanguage.hasClass('hidden')) {
            idnLanguage.addClass('hidden');
            idnLanguage.find('select').val('');
        }

        // check a domain has been entered
        if (!inputDomain.val()) {
            inputDomain.tooltip('show');
            inputDomain.focus();
            return;
        }
        inputDomain.tooltip('hide');
        if (jQuery('#captchaContainer').length) {
            validate_captcha(frmDomain);
            return;
        }

       

        reCaptchaContainer.tooltip('hide');
        jQuery('.domain-search-captcha').hide();
        captcha.tooltip('hide');
        // disable repeat submit and show loader
        jQuery('#btnCheckAvailability').attr('disabled', 'disabled').addClass('disabled');
        jQuery('#btnCheckAvailability > span').addClass('invisible');


        var inputDomainLastCheck = inputDomain.attr('data-last-check');

        if (inputDomainLastCheck == inputDomain.val()){
            setTimeout(function(){
                jQuery('#btnCheckAvailability').removeAttr('disabled').removeClass('disabled');
                jQuery('#btnCheckAvailability > span').removeClass('invisible');
            }, 500)
            return;
        }

        //jQuery('.domain-lookup-result').addClass('hidden');
        
        //jQuery('.domain-lookup-loader').removeClass('hidden');       
        jQuery('.spotlight-loader').removeClass('hidden');      
        
        

        // reset elements
        suggestions.find('li').addClass('hidden').end();
        suggestions.find('.clone').remove().end();
        jQuery('div.panel-footer.more-suggestions').addClass('hidden')
            .find('a').removeClass('hidden').end()
            .find('span.no-more').addClass('hidden');
        jQuery('.btn-add-to-cart').removeAttr('disabled')
            .find('span').hide().end()
            .find('span.to-add').show();
        jQuery('.suggested-domains').removeClass('hidden');
        var lookup = jQuery.post(
                WHMCS.utils.getRouteUrl('/domain/check'),
                frmDomain.serialize() + '&type=domain',
                'json'
            ),
            spotlight = jQuery.post(
                WHMCS.utils.getRouteUrl('/domain/check'),
                frmDomain.serialize() + '&type=spotlight',
                'json'
            ),
            suggestion = jQuery.post(
                WHMCS.utils.getRouteUrl('/domain/check'),
                frmDomain.serialize() + '&type=suggestions',
                'json'
            );
        // primary lookup handler
        lookup.done(function (data) {
            if (typeof data != 'object' || data.result.length == 0) {
                //jQuery('.domain-lookup-loader').addClass('hidden');
                return;
            }
            jQuery.each(data.result, function (index, domain) {
                var pricing = null,
                    result = jQuery('#primaryLookupResult'),
                    available = result.find('.domain-available'),
                    availablePrice = result.find('.domain-price'),
                    contactSupport = result.find('.domain-contact-support'),
                    unavailable = result.find('.domain-unavailable'),
                    unavailableTld = result.find('.domain-tld-unavailable'),
                    invalid = result.find('.domain-invalid'),
                    error = result.find('.domain-error');
                //jQuery('.domain-lookup-loader').addClass('hidden');
                result.find('.btn-add-to-cart').removeClass('checkout');
                result.removeClass('hidden').show();
                if (!data.result.error && domain.isValidDomain) {
                    pricing = domain.pricing;
                    unavailable.hide();
                    contactSupport.hide();
                    unavailableTld.hide();
                    invalid.hide();
                    error.hide();
                    if (domain.isAvailable && typeof pricing !== 'string') {
                        if (domain.domainName !== domain.idnDomainName && idnLanguage.hasClass('hidden')) {
                            idnLanguage.removeClass('hidden');
                        }
                        if (domain.preferredTLDNotAvailable) {
                            unavailableTld.show().find('strong').html(domain.originalUnavailableTld);
                        }
                        available.show().find('strong').html(domain.domainName);
                        availablePrice.show().find('.price').html(pricing[Object.keys(pricing)[0]].register).end()
                        available.find('button').attr('data-domain', domain.domainName);
                    } else {
                        available.hide();
                        availablePrice.hide();
                        contactSupport.hide();
                        if (domain.preferredTLDNotAvailable) {
                            unavailableTld.show().find('strong').html(domain.originalUnavailableTld);
                        } else {
                            unavailable.show().find('strong').html(domain.domainName);
                        }
                        if (typeof pricing === 'string' && pricing == 'ContactUs') {
                            contactSupport.show();
                        }
                    }
                } else {
                    available.hide();
                    availablePrice.hide();
                    unavailable.hide();
                    unavailableTld.hide();
                    contactSupport.hide();
                    invalid.hide();
                    error.hide();
                    var done = false,
                        reg = /<br\s*\/>/,
                        errors = [];
                    if (!domain.isValidDomain && domain.domainErrorMessage) {
                        invalid.find('.message-title').text(domain.domainErrorMessage);
                    } else if (domain.error || index === 'error') {
                        if (typeof domain === 'string') {
                            error.find('.message-title').text(domain);
                        } else if (!domain.error.match(reg)) {
                            error.find('.message-title').text(domain.error);
                        } else {
                            error.find('.message-title').text('');
                            errors = domain.error.split(reg);
                            for(var i=0; i < errors.length; i++) {
                                var errorMsg = errors[i];
                                if (errorMsg.length) {
                                    if (error.find('.message-title').text()) {
                                        // only add line break if there is
                                        // multiple lines of text
                                        error.find('.message-title').append('<br />');
                                    }
                                    error.find('.message-title').append(jQuery('<span></span>').text(errorMsg));
                                }
                            }
                        }                     
                        
                        error.show();
                        done = true;
                    }
                    if (!done) {
                        invalid.show();
                    }
                    
                }
            });
            inputDomain.attr('data-last-check', inputDomain.val());
        }).always(function () {
            //jQuery('.domain-lookup-loader').addClass('hidden');
            jQuery('#DomainSearchResults').removeClass('hidden');
            if(jQuery('#DomainSearchResults').data('scroll-to-results')){
                jQuery("html, body").animate({ scrollTop: $('#DomainSearchResults').offset().top - 150 }, 500);
            }
            jQuery('.domain-pricing').hide();
            jQuery('#btnCheckAvailability').removeAttr('disabled').removeClass('disabled');
            jQuery('#btnCheckAvailability > span').removeClass('invisible');
            hasDomainLookupEnded();
        });
        // spotlight lookup handler
        spotlight.done(function (data) {
            if (typeof data != 'object' || data.result.length == 0 || data.result.error) {
                jQuery('.spotlight-loader').addClass('hidden');
                return;
            }
            jQuery.each(data.result, function (index, domain) {
                var tld = domain.tldNoDots,
                    pricing = domain.pricing,
                    result = jQuery('#spotlight' + tld + ' .domain-lookup-result');
                jQuery('.spotlight-loader').removeClass('hidden');
                result.find('button').not('.btn-loading').addClass('hidden').end();
                result.find('.btn-loading').removeClass('hidden')
                if (domain.isValidDomain) {
                    if (domain.isAvailable && typeof pricing !== 'string') {      
                        if (domain.domainName !== domain.idnDomainName && idnLanguage.hasClass('hidden')) {
                            idnLanguage.removeClass('hidden');
                        }           
                        if (pricing[Object.keys(pricing)[0]] != undefined){
                            result.find('button.unavailable').addClass('hidden').end()
                            .find('button.invalid').addClass('hidden').end()
                            .find('span.available').html(pricing[Object.keys(pricing)[0]].register).removeClass('hidden').end()
                            .find('button').not('button.unavailable').not('button.invalid').not('button.btn-remove-domain')
                            .attr('data-domain', domain.domainName)
                            .removeClass('hidden');
                            result.find('.btn-loading').addClass('hidden');    
                            result.find('button.btn-remove-domain').attr('data-domain', domain.domainName);
                        }
                        else{
                            result.find('button.invalid').addClass('hidden').end()
                                .find('button.unavailable').removeClass('hidden').end()
                                .find('span.available').addClass('hidden').end()
                                .find('span.unavailable').removeClass('hidden').end();
                            result.closest('.spotlight').addClass('unavailable');
                            result.find('.btn-loading').addClass('hidden');    
                        } 
                    } else {
                        if (typeof pricing === 'string') {
                            if (pricing == '') {
                                result.find('button.unavailable').removeClass('hidden').end();
                            } else {
                                result.find('button.domain-contact-support').removeClass('hidden').end();
                            }
                            result.find('button.invalid').addClass('hidden').end();
                            result.find('span.available').addClass('hidden').end();
                            result.find('span.unavailable').removeClass('hidden').end()
                            result.find('.btn-loading').addClass('hidden');    
                        } else {
                            result.find('button.invalid').addClass('hidden').end()
                                .find('button.unavailable').removeClass('hidden').end()
                                .find('span.available').addClass('hidden').end()
                                .find('span.unavailable').removeClass('hidden').end();
                            result.closest('.spotlight').addClass('unavailable');
                            result.find('.btn-loading').addClass('hidden');    
                        }
                    }
                } else {
                    result.find('button.invalid.hidden').removeClass('hidden').end()
                        .find('span.available').addClass('hidden').end()
                        .find('span.unavailable').removeClass('hidden').end()
                        .find('button').not('button.invalid').addClass('hidden').end();
                        result.closest('.spotlight').addClass('unavailable');
                        result.find('.btn-loading').addClass('hidden');    
                }
                result.removeClass('hidden');
                jQuery('.spotlight-loader').addClass('hidden');
            });
        }).always(function () {
            hasDomainLookupEnded();
        });
        // suggestions lookup handler
        suggestion.done(function (data) {
            if (typeof data != 'object' || data.result.length == 0 || data.result.error) {
                jQuery('.suggested-domains').fadeOut('fast', function () {
                    jQuery(this).addClass('hidden');
                });
                return;
            } else {
                jQuery('.suggested-domains').removeClass('hidden');
            }
            var suggestionCount = 1;
            jQuery.each(data.result, function (index, domain) {
                var tld = domain.tld,
                    pricing = domain.pricing;
                suggestions.find('li:first').clone(true, true).appendTo(suggestions);
                var newSuggestion = suggestions.find('li.domain-suggestion').last();
                newSuggestion.addClass('clone')
                    .find('span.domain').html(domain.sld).end()
                    .find('span.extension').html('.' + tld).end();
                if (typeof pricing === 'string') {
                    newSuggestion.find('button.btn-add-to-cart').remove();
                    if (pricing != '') {
                        newSuggestion.find('button.domain-contact-support').removeClass('hidden').end()
                            .find('span.price').hide();
                    } else {
                        newSuggestion.remove();
                    }
                } else {
                    if (domain.domainName !== domain.idnDomainName && idnLanguage.hasClass('hidden')) {
                        idnLanguage.removeClass('hidden');
                    }
                    if (pricing[Object.keys(pricing)[0]] != undefined){
                        newSuggestion.find('button.btn-add-to-cart').attr('data-domain', domain.domainName).end()
                            .find('span.price').html(pricing[Object.keys(pricing)[0]].register).end();
                        newSuggestion.find('button.btn-remove-domain').attr('data-domain', domain.domainName);
                        newSuggestion.find('button.btn-remove-domain').tooltip('enable');
                    } else {
                        newSuggestion.find('button.domain-contact-support').removeClass('hidden').end()
                            .find('span.price').hide();
                    }

                }
                if (suggestionCount <= 10) {
                    newSuggestion.removeClass('hidden');
                }
                suggestionCount++;
                if (domain.group) {
                    newSuggestion.find('span.promo')
                        .addClass(domain.group)
                        .removeClass('hidden')
                        .end();
                    newSuggestion.find('span.sales-group-' + domain.group)
                        .removeClass('hidden')
                        .end();
                }
                furtherSuggestions = suggestions.find('li.domain-suggestion.clone.hidden').length;
                if (furtherSuggestions > 0) {
                    jQuery('div.more-suggestions').removeClass('hidden');
                }
            });
            jQuery('.domain-lookup-suggestions-loader').hide();
            jQuery('#domainSuggestions').removeClass('hidden');
        }).always(function () {
            hasDomainLookupEnded();
        });
    });
    /*
    *******************************************
    5. Domain Transfer
    *******************************************
    */
    jQuery('#frmDomainTransfer').submit(function (e) {
        e.preventDefault();

        if (
            typeof recaptchaValidationComplete !== 'undefined'
            && typeof recaptchaType !== 'undefined'
            && recaptchaType === 'invisible'
            && recaptchaValidationComplete === false
        ) {
            return;
        }

        var frmDomain = jQuery('#frmDomainTransfer'),
            transferButton = jQuery('#btnTransferDomain'),
            inputDomain = jQuery('#inputTransferDomain'),
            authField = jQuery('#inputAuthCode'),
            domain = inputDomain.val(),
            authCode = authField.val(),
            authCodeModal = jQuery('#modal-epp-code');
            redirect = false,
            reCaptchaContainer = jQuery('#divDynamicRecaptcha'),
            captcha = jQuery('#inputCaptcha');
        if (!domain) {
            inputDomain.tooltip('show');
            inputDomain.focus();
            return false;
        }
        inputDomain.tooltip('hide');
        if (jQuery('#captchaContainer').length) {
            validate_captcha(frmDomain);
            return;
        }
        reCaptchaContainer.tooltip('hide');
        captcha.tooltip('hide');
        transferButton.attr('disabled', 'disabled').addClass('disabled')
            .find('span:not(.loader)').addClass('invisible');
        jQuery.post(
            frmDomain.attr('action'),
            frmDomain.serialize(),
            'json'
        ).done(function (data) {
            if (typeof data != 'object') {
                transferButton.removeAttr('disabled').removeClass('disabled').find('#addToCart').removeClass('invisible');
                return false;
            }
            var result = data.result;
            if (result == 'added') {
                window.location = whmcsBaseUrl + '/cart.php?a=confdomains';
                redirect = true;
            } else {
                if (result.isRegistered == true) {
                    if (result.epp == true && !authCode) {
                        if(authCodeModal.hasClass('show')){
                            authField.tooltip('show');
                            authField.focus();  
                            authCodeModal.find('.invisible').removeClass('invisible');  
                        }
                        else{
                            authCodeModal.modal('show');
                        }
                    }
                } else {
                    authCodeModal.modal('hide');
                    authCodeModal.find('.invisible').removeClass('invisible');
                    jQuery('#transferUnavailable').html(result.unavailable)
                        .hide().removeClass('hidden').fadeIn('fast', function () {
                                setTimeout(function (input) {
                                        input.fadeOut('fast');
                                    },
                                    10000,
                                    jQuery(this)
                                );
                            }
                        );
                }
            }
        }).always(function () {
            if (redirect == false) {
                transferButton.removeAttr('disabled').removeClass('disabled').find('#addToCart').removeClass('invisible');
            }
        });
    });
    
    $('[data-epp-submit]').on('click', function(){
        var value = $('#inputAuthCode').val();
        $('input[name="epp"]').val(value);
        $('#frmDomainTransfer').submit();
    });

    /*
    *******************************************
    5. Update Config Options
    *******************************************
    */

    $("#frmConfigureProduct").on('change', 'select', function () {
        recalctotals();
    });
    jQuery("#frmConfigureProduct .section").not("#sectionCycles").on('ifChecked', 'input', function () {
        recalctotals();
    });
    jQuery("#frmConfigureProduct .section").not("#sectionCycles").on('ifUnchecked', 'input[type="checkbox"]', function () {
        recalctotals();
    });
    $("[data-change-billingcycle]").on('ifChecked', 'input', function () {
        setTimeout(function(){ recalctotals(); }, 150);
    });
    
    

    $("[data-update-config]").on('ifChecked', 'input', function () {
        $('#productConfigurableOptions').addClass('hidden');
        $('#lagomPageLoader').removeClass('hidden');
        $('#productAddonsContainer').addClass('hidden');      
        if (!jQuery("#orderSummaryLoader").is(":visible")) {
            jQuery("#orderSummaryLoader").fadeIn('fast');
        }
        if (!jQuery("#orderSummaryLoaderMob").is(":visible")) {
            jQuery("#orderSummaryLoaderMob").fadeIn('fast');
        }
        var i = $(this).closest('label').data("config-i");
        var billingCycle = $(this).closest('label').data("config-val");
        WHMCS.http.jqClient.post(whmcsBaseUrl + '/cart.php', 'a=cyclechange&ajax=1&i='+i+'&billingcycle='+billingCycle,
            function (data) {
                var co = jQuery('#productConfigurableOptions'),
                add = jQuery('#productAddonsContainer');
                if (co.length) {
                    co.html(jQuery(data).find('#productConfigurableOptions').html());
                }
                if (add.length) {
                    add.html(jQuery(data).find('#productAddonsContainer').html());
                }

                setTimeout(function(){
                    var checkboxes = $('#productConfigurableOptions, #productAddonsContainer').find('input:not(.icheck-input):not(.switch__checkbox)');

                    checkboxes.iCheck({
                        checkboxClass: 'checkbox-styled',
                        radioClass: 'radio-styled',
                        increaseArea: '40%'
                    });
                    reloadConfigOptions('#productConfigurableOptions');
                    if (typeof reloadCustomConfigOptions != 'undefined' && $.isFunction(reloadCustomConfigOptions) ) {
                        reloadCustomConfigOptions('#productConfigurableOptions');
                    }
                }, 100)

                $('#productConfigurableOptions').removeClass('hidden');
                $('#lagomPageLoader').addClass('hidden');
                $('#productAddonsContainer').removeClass('hidden');
                changeLogos();
            }
        )
        setTimeout(function(){ recalctotals(); }, 150);
    });
    /*
    *******************************************
    6. Serialize Config Form
    *******************************************
    */
    jQuery("#frmConfigureProduct").submit(function (e) {
        e.preventDefault();
        var button = jQuery('#btnCompleteProductConfig, #btnCompleteProductConfigMob'),
            btnOriginalText = jQuery(button).html(),
            postUrl = whmcsBaseUrl + '/cart.php',
            postData = 'a=confproduct&' + jQuery("#frmConfigureProduct").serialize();

        jQuery(button).find('.loader').removeClass('hidden');
        jQuery(button).find('span').addClass('invisible');

        displayRecommendations(
            postUrl,
            'addproductajax=1&' + postData,
            false
        ).done(function() {
            WHMCS.http.jqClient.post(
                postUrl,
                'ajax=1&' + postData,
                function(data) {
                    if (data) {
                        jQuery("#btnCompleteProductConfig").html(btnOriginalText);
                        jQuery("#btnCompleteProductConfigMob").html(btnOriginalText);
                        jQuery("#containerProductValidationErrorsList").html(data);
                        jQuery("#containerProductValidationErrors").removeClass('hidden').show();
                        jQuery(button).find('.loader').addClass('hidden');
                        jQuery(button).find('span').removeClass('invisible');
                        jQuery(button).prop('disabled', false).removeClass('disabled');
                        
                        // scroll to error container if below it
                        if (jQuery(window).scrollTop() > jQuery("#containerProductValidationErrors").offset().top) {
                            jQuery('html, body').scrollTop(jQuery("#containerProductValidationErrors").offset().top - 150);
                        }
                    } else {
                        window.location = whmcsBaseUrl + '/cart.php?a=confdomains';
                    }
                }
            );
        });
    });
    /*
    *******************************************
    7. Domain Renewals
    *******************************************
    */
    jQuery('#serviceRenewals').find('span.added').hide().end().find('span.to-add').find('i').hide();
    jQuery('.btn-add-renewal-to-cart').on('click', function () {
        var self = jQuery(this);
        var selfOuterWidth = self.outerWidth();
        var domainId = self.data('domain-id');
        var period = jQuery('#renewalPricing' + domainId).val();
        var postUrl;
        var postData;

        if (jQuery('#serviceRenewals').length >= 1) {
            postUrl = WHMCS.utils.getRouteUrl('/cart/service/' + self.data('service-id') + '/product/renew');
            postData = {
                token: csrfToken
            };
        } else {
            var domainId = self.data('domain-id');
            postUrl = WHMCS.utils.getRouteUrl('/cart/domain/renew/add');
            postData = {
                domainId: domainId,
                period: jQuery('#renewalPricing' + domainId).val(),
                token: csrfToken
            };
        }

        if (self.hasClass('checkout')) {
            window.location = whmcsBaseUrl + '/cart.php?a=view';
            return;
        }
        if ($(this).closest('.panel').hasClass('domain-renewal-added')) {
            e.preventDefault();
        } else {
            jQuery.post(
                postUrl,
                postData,
                'json'
            ).done(function (data) {
                self.find('span.to-add').hide();
                self.find('.loader').css("display", "flex").show();
                if (data.result === 'added') {
                    setTimeout(function () {
                        self.find('.loader').hide().end().find('span.added').css("display", "flex");
                        self.closest('.panel').addClass('border-primary domain-renewal-added');
                        self.removeClass('btn-primary-faded').addClass('btn-primary');
                    }, 500);
                }
                recalculateRenewalTotals();
            });
        }
    });
    jQuery(document).on('submit', '#removeRenewalForm', function (e) {
        e.preventDefault();

        var buttonId = '#renewDomain';
        if (jQuery('#serviceRenewals').length >= 1) {
            buttonId = '#renewService';
        }

        jQuery.post(
            whmcsBaseUrl + '/cart.php',
            jQuery(this).serialize() + '&ajax=1'
        ).done(function (data) {
            var domainId = data.i;
            var button = jQuery(buttonId + domainId);
            button.attr('disabled', 'disabled').each(function () {
                jQuery(this).find('span.added').hide().end()
                    .removeClass('checkout').find('span.to-add').show().end().removeAttr('disabled');
                jQuery(this).css('width', '');
                jQuery(this).closest('.panel').removeClass('border-primary domain-renewal-added');
                jQuery(this).removeClass('btn-primary').addClass('btn-primary-faded');
            });
        }).always(function () {
            jQuery('#modalRemoveItem').modal('hide');
            recalculateRenewalTotals();
        });
    });
    jQuery('.select-renewal-pricing').on('change', function () {
        var
            domainId = $(this).data('domain-id'),
            period = $(this).val();
        if ($(this).closest('.panel').hasClass('domain-renewal-added')) {
            jQuery.post(
                WHMCS.utils.getRouteUrl('/cart/domain/renew/add'),
                {
                    domainId: domainId,
                    period: period,
                    token: csrfToken
                },
                'json'
            ).done(function (data) {
                recalculateRenewalTotals();
            });
        }
    });
    jQuery('#domainRenewalFilter').on('keyup', function () {
        var inputText = jQuery(this).val().toLowerCase();
        jQuery('#domainRenewals, #serviceRenewals').find('div.search-renewal').filter(function () {
            jQuery(this).toggle(jQuery(this).data('search-name').toLowerCase().indexOf(inputText) > -1);
        }).promise().done(function(){
	        if (jQuery('div.search-renewal :visible').size() == 0) {
               jQuery('.no-renew').removeClass('hidden');
            } else {
               jQuery('.no-renew').addClass('hidden');
            }
	    });
    });

    /*
    *******************************************
    8. Empty Cart
    *******************************************
    */
    jQuery("#btnEmptyCart").click(function () {
        jQuery('#modalEmptyCart').modal('show');
    });
    /*
    *******************************************
    9. Use Credit on Checkout
    *******************************************
    */
    var useCreditOnCheckout = jQuery('#useCreditOnCheckout'),
        skipCreditOnCheckout = jQuery('#skipCreditOnCheckout');
    useCreditOnCheckout.on('ifChecked', function () {
        var radio = jQuery('#useCreditOnCheckout'),
            selectedPaymentMethod = jQuery('input[name="paymentmethod"]:checked'),
            selectedCC = jQuery('input[name="ccinfo"]:checked'),
            isCcSelected = selectedPaymentMethod.hasClass('is-credit-card'),
            firstNonCcGateway = jQuery('input[name="paymentmethod"]')
            .not(jQuery('input.is-credit-card[name="paymentmethod"]'))
            .first();
            container = jQuery('#paymentGatewaysContainer'),
            existingCardInfo = jQuery('#existingCardInfo'),
            ccInputFields = jQuery('#creditCardInputFields'),
            spanFullCredit = jQuery('#spanFullCredit'),
            shouldHideContainer = true;            
        if (radio.prop('checked')) {
            if (spanFullCredit.hasClass('hidden')) {
                shouldHideContainer = false;
            }
            if (isCcSelected && firstNonCcGateway.length !== 0) {
              
                firstNonCcGateway.closest('.panel-group').find('.panel.checked').removeClass('checked');
                firstNonCcGateway.iCheck('check').closest('.panel').addClass('checked');
                ccInputFields.addClass('hidden');
                
                if (shouldHideContainer) {
                    container.addClass('hidden');
                }  
            } else if (!isCcSelected && container.is(':visible')) {
                if (shouldHideContainer) {
                    container.addClass('hidden');
                }
            } else if ((!shouldHideContainer || isCcSelected) && !container.is(":visible")) {
                    ccInputFields.removeClass('hidden');
                    container.removeClass('hidden');
            }
            
            if (isCcSelected && selectedCC.val() !== 'new') {
                if (spanFullCredit.is(':visible')) {
                    hideCvcOnCheckoutForExistingCard = '1';
                    existingCardInfo.hide().find('input').attr('disabled', 'disabled');
                } else {
                    existingCardInfo.show().find('input').removeAttr('disabled');
                }
            }
        }
    });
    skipCreditOnCheckout.on('ifChecked', function () {
        var selectedPaymentMethod = jQuery('input[name="paymentmethod"]:checked'),
            isCcSelected = selectedPaymentMethod.hasClass('is-credit-card'),
            container = jQuery('#paymentGatewaysContainer');            
        if (!container.is(":visible")) {

            container.removeClass('hidden');
            if (isCcSelected) {
                
            }
        }
    });
    var applyCreditContainer = jQuery('#applyCreditContainer');

    if (
        applyCreditContainer.is(':visible')
        && applyCreditContainer.data('apply-credit') === 1
        && useCreditOnCheckout.length
    ) {
        skipCreditOnCheckout.iCheck('check');
        useCreditOnCheckout.iCheck('check');
    }
    /*
    *******************************************
    10. Payment Methods
    *******************************************
    */

   jQuery("#btnAlreadyRegistered").click(function() {
        jQuery("#containerNewUserSignup").slideUp('', function() {
            jQuery("#containerExistingUserSignin").slideDown('', function() {
                jQuery("#inputCustType").val('existing');
                jQuery("#btnAlreadyRegistered").fadeOut('', function() {
                    jQuery("#btnNewUserSignup").fadeIn();
                });
            });
        });
        jQuery("#containerNewUserSecurity").hide();
        if (jQuery("#stateselect").attr('required')) {
            jQuery("#stateselect").removeAttr('required').addClass('requiredAttributeRemoved');
        }
        jQuery('.marketing-email-optin').slideUp();
    });

    jQuery("#btnNewUserSignup").click(function() {
        jQuery("#containerExistingUserSignin").slideUp('', function() {
            jQuery("#containerNewUserSignup").slideDown('', function() {
                jQuery("#inputCustType").val('new');
                if (jQuery("#passwdFeedback").html().length == 0) {
                    jQuery("#containerNewUserSecurity").show();
                }
                jQuery("#btnNewUserSignup").fadeOut('', function() {
                    jQuery("#btnAlreadyRegistered").fadeIn();
                });
            });
            jQuery('.marketing-email-optin').slideDown();
        });
        if (jQuery("#stateselect").hasClass('requiredAttributeRemoved')) {
            jQuery("#stateselect").attr('required', 'required').removeClass('requiredAttributeRemoved');
        }
    });

    jQuery("#btnExistingLogin").click(function() {
        var inputLoginEmail = jQuery('#inputLoginEmail').val(),
            inputLoginPassword = jQuery('#inputLoginPassword').val(),
            existingLoginMessage = jQuery('#existingLoginMessage'),
            btnExistingLogin = jQuery('#btnExistingLogin');
        
            btnExistingLogin.prop('disabled', true)
            .addClass('disabled').find('span').addClass('invisible');

            WHMCS.http.jqClient.jsonPost({
            url: WHMCS.utils.getRouteUrl('/login/cart'),
            data: {
                username: inputLoginEmail,
                password: inputLoginPassword,
                token: csrfToken
            },
            success: function (data) {
                if (!data.redirectUrl) {
                    location.reload(true);
                } else {
                    window.location.href = data.redirectUrl;
                }
            },
            error: function (error) {
                if (error) {
                    existingLoginMessage.slideUp('fast')
                        .toggle()
                        .html(error)
                        .slideDown('fast');
                    btnExistingLogin.prop('disabled', false)
                        .removeClass('disabled')
                        .find('span').removeClass('invisible');
                }
            }
        });
});


    jQuery('.account-select').on('ifChecked', function(event) {
        var userSignupContainer = jQuery('#containerNewUserSignup'),
            stateSelect = jQuery("#stateselect"),
            thisValue = jQuery(this).val(),
            btnCompleteOrder = jQuery('#btnCompleteOrder'),
            existingPayMethods = jQuery('#existingCardsContainer'),
            existingUserEmail = jQuery('#inputEmail'),
            templateName = jQuery('#existingCardsContainer').data('template');

        if (existingPayMethods.length) {
            existingPayMethods.html('');
        }

        if (existingUserEmail.length) {
            existingUserEmail.attr('value', '');
        }
        // jQuery('#containerExistingAccountSelect')
        //     .find('div.account.active')
        //     .removeClass('active');
        // jQuery(this).closest('div.account').addClass('active');
        if (thisValue === 'new') {
            if (userSignupContainer.not(':visible')) {
                // userSignupContainer.hide().removeClass('hidden').slideDown('', function () {
                //     
                //     
                // });
                jQuery("#inputCustType").val('add');
                jQuery('.marketing-email-optin').slideDown();
                if (stateSelect.hasClass('requiredAttributeRemoved')) {
                    stateSelect.attr('required', 'required')
                        .removeClass('requiredAttributeRemoved');
                }
                
            }
        } else {
            btnCompleteOrder.addClass('disabled');

            if (btnCompleteOrder.hasClass('spinner-on-click')) {
                var icon = btnCompleteOrder.find('i.fas,i.far,i.fal,i.fab');

                jQuery(icon)
                    .data('original-class', icon.attr('class'))
                    .removeAttr('class')
                    .addClass('fas fa-spinner fa-spin');
            }

            jQuery("#inputCustType").val('account');
            if (userSignupContainer.is(':visible')) {
                userSignupContainer.slideUp();
                if (stateSelect.attr('required')) {
                    stateSelect.removeAttr('required')
                        .addClass('requiredAttributeRemoved');
                }
                jQuery('.marketing-email-optin').slideUp();
            }
        }
        WHMCS.http.jqClient.jsonPost({
            url: WHMCS.utils.getRouteUrl('/cart/account/select'),
            data: {
                account_id: thisValue,
                token: csrfToken
            },
            success: function(data) {                
                var creditDiv = jQuery('#applyCreditContainer');
                jQuery('#totalDueToday').text(data.total);
                creditDiv.closest('.panel').find('.credit-balance > span').text(data.creditBalance);
                if (!data.canUseCreditOnCheckout && creditDiv.is(':visible')) {
                    var skipCreditOnCheckout = jQuery('#skipCreditOnCheckout');
                    creditDiv.closest('.panel').addClass('hidden');
                    skipCreditOnCheckout.iCheck('check');
                } else if (data.canUseCreditOnCheckout) {
                    var useCreditOnCheckout = jQuery('#useCreditOnCheckout'),
                        spanFullCredit = jQuery('#spanFullCredit'),
                        spanUseCredit = jQuery('#spanUseCredit');
                    if (data.full) {
                        hideCvcOnCheckoutForExistingCard = '1';
                        spanFullCredit.removeClass('hidden').find('span').text(data.total);
                        if (!spanUseCredit.hasClass('hidden')) {
                            spanUseCredit.addClass('hidden');
                        }
                    } else {
                        hideCvcOnCheckoutForExistingCard = '0';
                        spanUseCredit.removeClass('hidden').find('span').text(data.creditBalance);
                        if (!spanFullCredit.hasClass('hidden')) {
                            spanFullCredit.addClass('hidden');
                        }
                    }
                    useCreditOnCheckout.iCheck('check');
                    if (creditDiv.not(':visible')) {
                        creditDiv.closest('.panel').removeClass('hidden');
                    }
                }
                
                if (existingPayMethods.length) {
                    existingPayMethods.html(data.existingCards);
                    if (data.existingCards == ""){
                        $('.cc-input-container .nav-tabs').hide();
                    }
                    else{
                        $('.cc-input-container .nav-tabs').show();
                    }
                   
                    let ccimg = existingPayMethods.find('.cc-item-icon img');
                    ccimg.each(function(){
                        $(this).prop('src', $(this).attr('src').replace('//', '/'+templateName+'/'));
                    });
                    existingPayMethods.find('input[type="radio"]').iCheck({
                        inheritID: true,
                        checkboxClass: 'checkbox-styled',
                        radioClass: 'radio-styled',
                        increaseArea: '40%'
                    });
                    jQuery(".payment-methods:checked").trigger('ifChecked');
                    selectPreferredCard();
                }
            },
            always: function() {
                btnCompleteOrder.removeClass('disabled');
                if (btnCompleteOrder.hasClass('spinner-on-click')) {
                    var icon = btnCompleteOrder.find('i.fas,i.far,i.fal,i.fab');

                    if (jQuery(icon).hasClass('fa-spinner')) {
                        jQuery(icon)
                            .removeAttr('class')
                            .addClass(icon.data('original-class'));
                    }
                }
            }
        });
    });

    var cvvFieldContainer = jQuery('#cvv-field-container'),
        existingCardContainer = jQuery('#existingCardsContainer'),
        newCardInfo = jQuery('#newCardInfo'),
        newCardSaveSettings = jQuery('#newCardSaveSettings'),
        inputNoStoreContainer = jQuery('#inputNoStoreContainer'),
        existingCardInfo = jQuery('#existingCardInfo'),
        newCardOption = jQuery('#new'),
        creditCardInputFields = jQuery('#creditCardInputFields');

    jQuery('[data-paymethod-id]').on('click', function(){
        if (jQuery(this).hasClass('disabled')){

        }
        else{
            jQuery('[data-paymethod-id]').removeClass('active');
            jQuery(this).addClass('active');
            jQuery(this).find('input[type=radio]').iCheck('check');
        }
       
    });

    jQuery('#creditCardInputFields [data-radio-tab]').on('click', function(e){
        e.preventDefault();
        jQuery(this).closest('#paymentGatewaysContainer').find('#newCardInfoTab').attr('style', false);
        jQuery(this).closest('#paymentGatewaysContainer').find('#existingCardsContainer').attr('style', false);
        var link = jQuery(this).attr('href');
        jQuery(this).closest('.nav-tabs').find('.active').removeClass('active');
        jQuery(this).parent().addClass('active');
        jQuery(this).closest('.cc-input-container').find('.tab-content').find('.active').removeClass('active');
        jQuery(this).closest('.cc-input-container').find('.tab-content').find(link).addClass('active');
        var radio = jQuery(this).find('input[type=radio]');
        var that = jQuery(this);
        setTimeout(function(){
            if (radio.is(':checked')){
                if (jQuery('.payment-methods:checked').val() === 'stripe') {
                    return;
                }
                that.closest('.cc-input-container').find('.tab-content').find('#newCardInfo').show();
            }
        },500);
       
    });

    jQuery(document).on('ifChecked', '.existing-card', function(event) {
        newCardSaveSettings.hide().find('input').attr('disabled', 'disabled');
        if (jQuery('.payment-methods:checked').data('remote-inputs') === 1) {
            return;
        }
        newCardInfo.find('input').attr('disabled', 'disabled');

        if (hideCvcOnCheckoutForExistingCard !== '1') {
            existingCardInfo.find('input').removeAttr('disabled');
        } else {
            existingCardInfo.find('input').attr('disabled', 'disabled');
        }


    });
    newCardOption.on('ifChecked', function(event) {
        if (jQuery('.payment-methods:checked').val() === 'stripe') {
            return;
        }
        newCardInfo.show().find('input').removeAttr('disabled');
        existingCardInfo.find('input').attr('disabled', 'disabled');
    });

    var hasValidCredidCard = false;

    jQuery(".payment-methods").on('ifChecked', function(event) {
        var existingCards = jQuery(document).find('.existing-card');
        if (!existingCards.length) {
            existingCardInfo.find('input').attr('disabled', 'disabled');
        }
        reloadConfigOptions('#paymentGatewaysDetails');
        if (jQuery(this).hasClass('is-credit-card')) {
            var gatewayPaymentType = jQuery(this).data('payment-type'),
                gatewayModule = jQuery(this).val(),
                showLocal = jQuery(this).data('show-local'),
                relevantMethods = [];

            if (gatewayPaymentType === 'RemoteCreditCard') {
                inputNoStoreContainer.hide().find('input').prop('disabled', 'disabled');
            } else {
                if (!(inputNoStoreContainer.is(':visible'))) {
                    inputNoStoreContainer.show().find('input').removeProp('disabled');
                }
            }
            existingCards.each(function(index) {
                var paymentType = jQuery(this).data('payment-type'),
                    paymentModule = jQuery(this).data('payment-gateway'),
                    payMethodId = jQuery(this).val();

                var paymentTypeMatch = (paymentType === gatewayPaymentType);

                var paymentModuleMatch = false;
                if (gatewayPaymentType === 'RemoteCreditCard') {
                    // only show remote credit cards that belong to the selected gateway
                    paymentModuleMatch = (paymentModule === gatewayModule);
                } else if (gatewayPaymentType === 'CreditCard') {
                    // any local credit card can be used with any credit card gateway
                    paymentModuleMatch = true;
                }

                if (showLocal && paymentType === 'CreditCard') {
                    paymentTypeMatch = true;
                    paymentModuleMatch = true;
                }
                
                var payMethodElements = jQuery('[data-paymethod-id="' + payMethodId + '"]');              
                if (paymentTypeMatch && paymentModuleMatch) {
                    jQuery(payMethodElements).show();
                    relevantMethods.push(this);
                } else {
                    jQuery(payMethodElements).hide();
                }
            });

            var payTabs = jQuery('#creditCardInputFields .cc-input-container > .nav-tabs');
            if (relevantMethods.length){
                payTabs.show();
            }
            else{
                payTabs.hide();
            }

            var enabledRelevantMethods = relevantMethods.filter(function (item) {
                return ! jQuery(item).attr('disabled');
            });

            if (enabledRelevantMethods.length > 0) {
                var defaultId = null;
                jQuery.each(enabledRelevantMethods, function(index, value) {
                    var jQueryElement = jQuery(value),
                        order = parseInt(jQueryElement.data('order-preference'), 10);
                    if ((defaultId === null) || (order < defaultId)) {
                        defaultId = jQueryElement.val();
                        if (order === 0) {
                            return false;
                        }
                    }
                });
                if (defaultId === null) {
                    defaultId = 'new';
                }

                jQuery.each(enabledRelevantMethods, function(index, value) {
                    var jQueryElement = jQuery(value);
                    if (jQueryElement.val() === defaultId) {
                        
                        jQueryElement.iCheck('check');
                        jQueryElement.closest('.cc-item').addClass('active');
                        return false;
                    }
                });  
                existingCardContainer.show();
                //existingCardInfo.removeClass('hidden').show().find('input').removeAttr('disabled');

                if (hideCvcOnCheckoutForExistingCard !== '1') {
                    existingCardInfo.removeClass('hidden').show().find('input').removeAttr('disabled');
                } else {
                    existingCardInfo.addClass('hidden').hide().find('input').attr('disabled', 'disabled');
                }

                jQuery(this).closest('#paymentGatewaysContainer').find('#existingCardsContainer').addClass('active');
                jQuery(this).closest('#paymentGatewaysContainer').find('#newCardInfoTab').removeClass('active');
                jQuery(this).closest('#paymentGatewaysContainer').find('.cc-input-container .nav-tabs .active').removeClass('active');
                jQuery(this).closest('#paymentGatewaysContainer').find('.cc-input-container .nav-tabs li').first().addClass('active');
            } 
            else {
                jQuery(newCardOption).iCheck('check');

                existingCardContainer.hide();
                existingCardInfo.hide().find('input').attr('disabled', 'disabled');
                jQuery(this).closest('#paymentGatewaysContainer').find('#existingCardsContainer').removeClass('active');
                jQuery(this).closest('#paymentGatewaysContainer').find('#newCardInfoTab').addClass('active');
                jQuery(this).closest('#paymentGatewaysContainer').find('.cc-input-container .nav-tabs .active').removeClass('active');
                jQuery(this).closest('#paymentGatewaysContainer').find('.cc-input-container .nav-tabs li').last().addClass('active');

                newCardInfo.show();
            }
            if (!creditCardInputFields.is(":visible")) {
                $('#creditCardInputFields .panel').show();
                creditCardInputFields.removeClass('hidden');
            }
        }
        else {
            creditCardInputFields.removeClass('has-animate-height');
            $('#creditCardInputFields .panel').show();
            creditCardInputFields.addClass('hidden');
          
        }
    });


    jQuery('.cc-input-container .paymethod-info').click(function() {
        var payMethodId = $(this).data('paymethod-id');
        var input = jQuery('input[name="ccinfo"][value=' + payMethodId + ']:not(:disabled)');

        if (input.length > 0) {
            input.iCheck('check');
        }
    });

    $('button.btn-checkout').on('click', function(){
        $('#submit-checkout').trigger('click');
        $('#paymentGatewaysContainer [data-inputs-container] > [data-virtual-input]:not(.checked)').addClass('disabled');
        $('#paymentGatewaysContainer [data-inputs-container] > [data-virtual-input]:not(.checked) input[type="radio"]').prop('disabled', true);
        
        if ($('.gateway-errors').length > 0) {
            setTimeout(function(){ 
                var gatewayError = $('.gateway-errors');
                if  ($(gatewayError).attr('style') == "undefined" || $(gatewayError).attr('style') == undefined){       
                    if ((!$(gatewayError).hasClass('w-hidden')) && ($(gatewayError)[0].innerText != "" || $(gatewayError).not(':empty'))){                   
                        $('#checkout .loader').addClass('hidden');
                        $('#checkout span').removeClass('invisible hidden');
                        $('#checkout2 .loader').addClass('hidden');
                        $('#checkout2 span').removeClass('invisible hidden');
                        $('#paymentGatewaysContainer > [data-inputs-container] > [data-virtual-input]').removeClass('disabled');
                        $('#paymentGatewaysContainer [data-inputs-container] > [data-virtual-input] input[type="radio"]').prop('disabled', false);
                        $('.btn-checkout').removeClass('disabled').prop('disabled', false);
                    }
                }
                else{
                    if ((!$(gatewayError).hasClass('w-hidden') || $(gatewayError).attr('style').includes("display: block;")) && ($(gatewayError)[0].innerText != "" || $(gatewayError).not(':empty'))){                   
                        $('#checkout .loader').addClass('hidden');
                        $('#checkout span').removeClass('invisible hidden');
                        $('#checkout2 .loader').addClass('hidden');
                        $('#checkout2 span').removeClass('invisible hidden');
                        $('#paymentGatewaysContainer > [data-inputs-container] > [data-virtual-input]').removeClass('disabled');
                        $('#paymentGatewaysContainer [data-inputs-container] > [data-virtual-input] input[type="radio"]').prop('disabled', false);
                        $('.btn-checkout').removeClass('disabled').prop('disabled', false);
                    }
                }

                
            }, 1500);

            let inputs = $('#frmCheckout').find('input');

            inputs.each(function(){
                if ($(this)[0].validity.valid === false){
                setTimeout(function(){  
                        $('#checkout .loader').addClass('hidden');
                        $('#checkout span').removeClass('invisible hidden');
                        $('#checkout2 .loader').addClass('hidden');
                        $('#checkout2 span').removeClass('invisible hidden');
                        $('#paymentGatewaysContainer > [data-inputs-container] > [data-virtual-input]').removeClass('disabled');
                        $('#paymentGatewaysContainer [data-inputs-container] > [data-virtual-input] input[type="radio"]').prop('disabled', false);
                        $('.btn-checkout').removeClass('disabled').prop('disabled', false);
                    }, 1500);
                }
            });

        }
    });

    /*
    *******************************************
    11. Domain Contacts
    *******************************************
    */
    jQuery("#inputDomainContact").on('change', function () {
        if (this.value == "addingnew") {
            jQuery("#domainRegistrantInputFields").hide().removeClass('hidden').slideDown();
        } else {
            jQuery("#domainRegistrantInputFields").slideUp();
        }
    });


    jQuery('.mc-promo .btn-add').click(function(e) {
        var self = jQuery(this);
        self.attr('disabled', 'disabled')
            .find('span.arrow i').removeClass('fa-chevron-right').addClass('fa-spinner fa-spin');
        WHMCS.http.jqClient.post(
            whmcsBaseUrl + '/cart.php',
            {
                'a': 'addUpSell',
                'product_key': self.data('product-key'),
                'token': csrfToken
            },
            function (data) {
                if (typeof data.modal !== 'undefined') {
                    openModal(
                        data.modal,
                        '',
                        data.modalTitle,
                        '',
                        '',
                        data.modalSubmit,
                        data.modelSubmitId
                    );
                    return;
                }
                window.location.reload(true);
            },
            'json'
        );
    });

    jQuery(document).on('click', '#btnAddUpSellCheckout', function(e) {
        var upsellModalForm = jQuery('#upsellModalForm');
        WHMCS.http.jqClient.post(
            whmcsBaseUrl + '/cart.php',
            upsellModalForm.serialize(),
            function (data) {
                if (data.done){
                    jQuery('#totalCartPrice').text(data.newTotal);
                }
            },
            'json'
        );
        return false;
    });

    jQuery('.mc-promo .header').on('click', function(e) {
        e.preventDefault();
        if (jQuery(e.target).is('.btn, .btn span,.btn .ls')) {
            return;
        }
        if (jQuery(this).parent().find('.rotate').hasClass('lm-plus')){
            jQuery(this).parent().find('.rotate').removeClass('lm-plus').addClass('lm-minus');
        }
        else{
            jQuery(this).parent().find('.rotate').removeClass('lm-minus').addClass('lm-plus');
        }
        jQuery(this).parent().find('.body').slideToggle('fast');
    });
    jQuery('.mc-promos.viewcart .mc-promo:first-child .header').click();

    checkoutForm = jQuery('#frmCheckout');
    if (checkoutForm.length) {
        checkoutForm.on('submit', validateCheckoutCreditCardInput);
    }

    jQuery(".payment-methods:checked").trigger('ifChecked');
    if (existingCardContainer.is(':visible')) {
        newCardInfo.hide();
    }


    jQuery('[data-tos-checkbox]').on('ifChanged', function(){
        checkTos(jQuery(this).prop('checked'))
    });
    checkTos(jQuery('[data-tos-checkbox]').prop('checked'));
});
/*
*******************************************
1. Product Domain Lookup Ended
*******************************************
*/
function hasProductDomainLookupEnded(total, button) {
    domainLookupCallCount++;
    if (domainLookupCallCount == total) {
        button.removeAttr('disabled').removeClass('disabled');
        button.find('span').removeClass('invisible');
        jQuery('input[name="domainoption"]').iCheck('enable');
    }
}
/*
*******************************************
2. Product Domain Lookup Ended
*******************************************
*/
function hasDomainLookupEnded() {
    domainLookupCallCount++;
    if (domainLookupCallCount == 3) {
        jQuery('#btnCheckAvailability').removeAttr('disabled').removeClass('disabled');
        jQuery('#btnCheckAvailability > span').removeClass('invisible');
    }
}
/*
*******************************************
2. Recalc Totals
*******************************************
*/
function recalctotals() {
    if (!jQuery("#orderSummaryLoader").is(":visible")) {
        jQuery("#orderSummaryLoader").fadeIn('fast');
    }
    if (!jQuery("#orderSummaryLoaderMob").is(":visible")) {
        jQuery("#orderSummaryLoaderMob").fadeIn('fast');
    }
    var thisRequestId = Math.floor((Math.random() * 1000000) + 1);
    window.lastSliderUpdateRequestId = thisRequestId;
    var post = WHMCS.http.jqClient.post(whmcsBaseUrl + '/cart.php', 'ajax=1&a=confproduct&calctotal=true&' + jQuery("#frmConfigureProduct").serialize());
    post.done(
        function (data) {
            if (thisRequestId == window.lastSliderUpdateRequestId) {
                let summaryStyle = jQuery("#producttotal").data('summary-style');
                jQuery("#producttotal").html(data);
                if (summaryStyle == "primary"){
                    jQuery("#producttotal").find('.btn-checkout').removeClass('.btn-primary').addClass('btn-primary-faded');
                }
                jQuery("#producttotalmob").html(data);
            }
        }
    );
    post.always(
        function () {
            jQuery("#orderSummaryLoader").delay(500).fadeOut('slow');
            jQuery("#orderSummaryLoaderMob").delay(500).fadeOut('slow');
            $('#sticky-sidebar').stickySidebar('updateSticky');
        }
    );
}
/*
*******************************************
3. Recalc Renew Totals
*******************************************
*/
function recalculateRenewalTotals() {
    var routePath = '/cart/domain/renew/calculate';
    if (jQuery('#serviceRenewals').length >= 1) {
        routePath = '/cart/service/renew/calculate';
    }

    if (!jQuery("#orderSummaryLoader").is(":visible")) {
        jQuery("#orderSummaryLoader").fadeIn('fast');
    }
    var thisRequestId = Math.floor((Math.random() * 1000000) + 1);
    window.lastSliderUpdateRequestId = thisRequestId;
    jQuery.get(
        WHMCS.utils.getRouteUrl(routePath)
    ).done(function (data) {
        if (thisRequestId === window.lastSliderUpdateRequestId) {
            let summaryStyle = jQuery("#producttotal").data('summary-style');
            jQuery("#producttotal").html(data.body);
            if (summaryStyle == "primary"){
                jQuery("#producttotal").find('.btn-checkout').removeClass('.btn-primary').addClass('btn-primary-faded');
            }
            jQuery("#producttotalmob").html(data.body);
        }
    }).always(
        function () {
            jQuery("#orderSummaryLoader").delay(500).fadeOut('slow');
            jQuery("#orderSummaryLoaderMob").delay(500).fadeOut('slow');
        }
    );
}
/*
*******************************************
4. Remove Item
*******************************************
*/
function removeItem(type, num, renewalType = null) {
    if (renewalType !== null) {
        jQuery('#inputRemoveItemRenewalType').val(renewalType);
    }
    jQuery('#inputRemoveItemType').val(type);
    jQuery('#inputRemoveItemRef').val(num);
    jQuery('#modalRemoveItem').modal('show');
}
/*
*******************************************
5. Select Domain Period
*******************************************
*/
function selectDomainPeriodInCart(domainName, price, period, yearsString) {
    var loader = jQuery("#orderSummaryLoader");
    var loaderMob = jQuery("#orderSummaryLoaderMob");
    loader.fadeIn('fast');
    loaderMob.fadeIn('fast');
    jQuery("[name='" + domainName + "Pricing']").html('<span data-domain-price-multi-price>' + price + '/' +period+yearsString+ '</span><span class="caret"></span>');
    var update = jQuery.post(
        window.location.pathname,
        {
            domain: domainName,
            period: period,
            a: 'updateDomainPeriod',
            token: csrfToken
        }
    );
    update.done(
        function (data) {
            if(typeof(stripe) !== "undefined") {
                updateStripe();
            }
            data.domains.forEach(function (domain) {
                jQuery("[name='" + domain.domain + "Pricing']").closest('.cart-item-price').find('.renewal-price').html(
                    domain.renewprice + domain.shortRenewalYearsLanguage
                );
            });
            jQuery('[data-subtotal]').find('.item-value').html(data.subtotal);
            if (data.promotype) {
                jQuery('#discount').html(data.discount);
            }
            if (data.taxrate) {
                jQuery('#taxTotal1').html(data.taxtotal);
            }
            if (data.taxrate2) {
                jQuery('#taxTotal2').html(data.taxtotal2);
            }
            var recurringSpan = jQuery('#recurring');           
            recurringSpan.find('li').not('.faded').hide();
            if (data.totalrecurringannually) {
                jQuery('#recurringAnnually').show().find('.item-value').html(data.totalrecurringannually);
            }
            if (data.totalrecurringbiennially) {
                jQuery('#recurringBiennially').show().find('.item-value').html(data.totalrecurringbiennially);
            }
            if (data.totalrecurringmonthly) {
                jQuery('#recurringMonthly').show().find('.item-value').html(data.totalrecurringmonthly);
            }
            if (data.totalrecurringquarterly) {
                jQuery('#recurringQuarterly').show().find('.item-value').html(data.totalrecurringquarterly);
            }
            if (data.totalrecurringsemiannually) {
                jQuery('#recurringSemiAnnually').show().find('.item-value').html(data.totalrecurringsemiannually);
            }
            if (data.totalrecurringtriennially) {
                jQuery('#recurringTriennially').show().find('.item-value').html(data.totalrecurringtriennially);
            }
            jQuery('#totalDueToday').html(data.total);
            jQuery('#totalDueTodayMob').html(data.total);
        }
    );
    update.always(
        function () {
            loader.delay(500).fadeOut('slow');
            loaderMob.delay(500).fadeOut('slow');
        }
    );
}
/*
*******************************************
6. Validate Captcha
*******************************************
*/
function validate_captcha(form)
{
    var reCaptcha = jQuery('#g-recaptcha-response'),
        reCaptchaContainer = jQuery('#divDynamicRecaptcha'),
        captcha = jQuery('#inputCaptcha');
    if (reCaptcha.length && !reCaptcha.val()) {
        reCaptchaContainer.tooltip('show');
        return false;
    }
    if (captcha.length && !captcha.val()) {
        captcha.tooltip('show');
        return false;
    }
    var validate = jQuery.post(
        form.attr('action'),
        form.serialize() + '&a=validateCaptcha',
        'json'
    );
    validate.done(function (data) {
        if (data.error) {
            jQuery('#inputCaptcha').attr('data-original-title', data.error).tooltip('show');
            if (captcha.length) {
                jQuery('#inputCaptchaImage').replaceWith(
                    '<img id="inputCaptchaImage" src="' + whmcsBaseUrl + '/includes/verifyimage.php?nocache=' + new Date().getTime() + '" align="middle" />'
                );
            }
        } else {
            jQuery('#captchaContainer').remove();
            form.trigger('submit');
        }
    });
}
/*
*******************************************
7. More Suggestions
*******************************************
*/

function loadMoreSuggestions()
{
    var suggestions = jQuery('#domainSuggestions'),
        suggestionCount;

    for (suggestionCount = 1; suggestionCount <= 10; suggestionCount++) {
        if (furtherSuggestions > 0) {
            suggestions.find('li.domain-suggestion.hidden.clone:first').not().hide().removeClass('hidden').slideDown();
            furtherSuggestions = suggestions.find('li.domain-suggestion.clone.hidden').length;
        } else {
            jQuery('div.more-suggestions').find('a').addClass('hidden').end().find('span.no-more').removeClass('hidden');
            return;
        }
    }
}

/*
*******************************************
8. Checkout Form
*******************************************
*/

function validateCheckoutCreditCardInput(e)
{
    var newOrExisting = jQuery('input[name="ccinfo"]:checked').val(),
        submitButton = checkoutForm.find('*[type="submit"]'),
        cardType = null,
        submit = true,
        selectedPaymentMethod = checkoutForm.find('input[name="paymentmethod"]:checked'),
        isCreditCardGateway = selectedPaymentMethod.hasClass('is-credit-card'),
        isRemoteCard = selectedPaymentMethod.data('payment-type') === 'RemoteCreditCard',
        cardNumber = jQuery('#inputCardNumber');

    checkoutForm.find('.form-group').removeClass('has-error');
    checkoutForm.find('.field-error-msg').hide();

    if (isCreditCardGateway && !isRemoteCard) {
        var cvvField = checkoutForm.find('#inputCardCVV2');

        if (newOrExisting === 'new') {
            cvvField = checkoutForm.find('#inputCardCVV');

            cardType = jQuery.payment.cardType(checkoutForm.find('#inputCardNumber').val());
            if (!jQuery.payment.validateCardNumber(checkoutForm.find('#inputCardNumber').val()) || cardNumber.hasClass('unsupported')) {
                var error = cardNumber.data('message-invalid');
                if (cardNumber.hasClass('unsupported')) {
                    error = cardNumber.data('message-unsupported');
                }
                checkoutForm.find('#inputCardNumber').setInputError(error).showInputError();
                submit = false;
            }
            if (
                !jQuery.payment.validateCardExpiry(
                    checkoutForm.find('#inputCardExpiry').payment('cardExpiryVal')
                )
            ) {
                checkoutForm.find('#inputCardExpiry').showInputError();
                submit = false;
            }
        }
        if (cvvField.is(':visible') && !jQuery.payment.validateCardCVC(cvvField.val(), cardType)) {
            cvvField.showInputError();
            submit = false;
        }
        if (!submit) {
            e.preventDefault();
            setTimeout(function(){ 
                $('#checkout .loader').addClass('hidden');
                $('#checkout span').removeClass('invisible hidden');
                $('#checkout2 .loader').addClass('hidden');
                $('#checkout2 span').removeClass('invisible hidden');
                $('.btn-checkout').removeClass('disabled').prop('disabled', false);
            }, 1500);  
        }
    }
}
function selectPreferredCard()
{
    var methods = jQuery('input[name="ccinfo"]:visible'),
        select = methods.first(),
        preferred = methods.filter('[data-order-preference=0]');
    if (preferred.length) {
        select = preferred;
    }
    select.iCheck('check');
}
jQuery(document).ready(function() {
    if ($('.gateway-errors').length > 0) {
        function mutate(mutations) {
            mutations.forEach(function (mutation) {                 
                if ((!$(mutation.target).hasClass('w-hidden') || $(mutation.target).attr('style').includes("display: block;")) && ($(mutation.target)[0].innerText != "") || $(mutation.target).not(':empty')){                   
                    $('#checkout .loader').addClass('hidden');
                    $('#checkout span').removeClass('invisible hidden');
                    $('#checkout2 .loader').addClass('hidden');
                    $('#checkout2 span').removeClass('invisible hidden');
                    $('#paymentGatewaysContainer [data-inputs-container] > [data-virtual-input]').removeClass('disabled');
                    $('#paymentGatewaysContainer [data-inputs-container] > [data-virtual-input] input[type="radio"]').prop('disabled', false);
                    $('.btn-checkout').removeClass('disabled').prop('disabled', false);
                }
            });
        }
    
        var MutationObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver;
        var target = document.querySelector('.gateway-errors');
        var observer = new MutationObserver(mutate);
        var config = {characterData: false, attributes: false, childList: true, subtree: true};
        observer.observe(target, config);
    } 
    jQuery('[data-radio-tab]').on('click', function(){
        if ($(this).attr('href') == "#existingCardsContainer"){
            selectPreferredCard();
            $('#existingCardsContainer').find('input[type="radio"]:checked').closest('.cc-item').addClass('active');
        }
    });
});

/*
*******************************************
9. Select Product Billing Cycle
*******************************************
*/

function selectProductPeriodInCart(index, cycle, fullString)
{
    jQuery("[name='" + index + "ProductPricing']").find('.cart-item-price').html(fullString);     
    let proRata = jQuery("[name='" + index + "ProductPricing']").closest('.prod-price').find('.prorata-date');
    
    var loader = jQuery("#orderSummaryLoader");
    var loaderMob = jQuery("#orderSummaryLoaderMob");
    loader.fadeIn('fast');
    loaderMob.fadeIn('fast');
    WHMCS.http.jqClient.post("cart.php?a=checkout", 'selectProductPeriod=1&pi=' + index + '&pc=' + cycle).promise().done(function(data){
        

        if (data.domains.length > 0){
           
            data.domains.forEach(function(item){
                if (item.type == "register"){
                    let cartDomainSingle = $('[data-domain-price-single="'+item.domain+'"]'),
                        cartDomainMulti = $('[data-domain-price-multi="'+item.domain+'"]'),
                        pricingCount = Object.keys(item.pricing).length;
                    if (pricingCount > 1){
                        if (cartDomainMulti.hasClass('hidden')){
                            let multiPrice = cartDomainMulti.find('[data-domain-price-multi-price]'),
                                dropItems = cartDomainMulti.find('.dropdown-menu li'),
                                renewalPrice = cartDomainMulti.find('.renewal-price');
                            if (dropItems.length == 1){
                                multiPrice.html(item.price + item.shortYearsLanguage);
                                renewalPrice.html(item.renewprice + item.shortRenewalYearsLanguage);
                                let dropdown = cartDomainMulti.find('.dropdown-menu'),
                                    langYear = dropdown.data('domain-lang-year'),
                                    langYears = dropdown.data('domain-lang-years'),
                                    currentYearLang = "";
                                dropdown.empty();
                                Object.entries(item.pricing).forEach(entry => {
                                    const [key, value] = entry;
                                    if (key == 1){
                                        currentYearLang = langYear;
                                    }
                                    else{
                                        currentYearLang = langYears;
                                    }
                                    let listItem = `<li>
                                        <a href="#" onclick="selectDomainPeriodInCart('${item.domain}', '${value.register}', ${key}, '${currentYearLang}');return false;">
                                            ${key} ${currentYearLang} @ ${value.register}
                                        </a>
                                    </li>
                                    `;
                                    dropdown.append(listItem);                           
                                });
                            
                            }

                            cartDomainSingle.addClass('hidden');
                            cartDomainMulti.removeClass('hidden')
                        }
                    }   
                    else{
                        if (cartDomainSingle.hasClass('hidden')){
                            let singlePrice = cartDomainSingle.find('[data-domain-price-single-price]'),
                                renewalPrice = cartDomainSingle.find('.renewal-price');
                            singlePrice.html(item.price + item.shortYearsLanguage)
                            renewalPrice.html(item.renewprice + item.shortRenewalYearsLanguage);

                            cartDomainSingle.removeClass('hidden');
                            cartDomainMulti.addClass('hidden');
                        }
                    } 
                }
            });
        }


        if(typeof(stripe) !== "undefined") {
            updateStripe();
        }
        jQuery('[data-subtotal] .item-value').html(data.subtotal);
        if (data.promotype) {
            jQuery('#discount').html(data.discount);
        }
        if (data.taxrate) {
            jQuery('#taxTotal1').html(data.taxtotal);
        }
        if (data.taxrate2) {
            jQuery('#taxTotal2').html(data.taxtotal2);
        }

        var recurringSpan = jQuery('#recurring');      
        recurringSpan.find('li').not('.faded').hide();
      
        if (data.totalrecurringannually) {
            jQuery('#recurringAnnually').show().find('.item-value').html(data.totalrecurringannually);            
        }
        if (data.totalrecurringbiennially) {
            jQuery('#recurringBiennially').show().find('.item-value').html(data.totalrecurringbiennially);            
        }
        if (data.totalrecurringmonthly) {
            jQuery('#recurringMonthly').show().find('.item-value').html(data.totalrecurringmonthly);         
        }
        if (data.totalrecurringquarterly) {
            jQuery('#recurringQuarterly').show().find('.item-value').html(data.totalrecurringquarterly);           
        }
        if (data.totalrecurringsemiannually) {
            jQuery('#recurringSemiAnnually').show().find('.item-value').html(data.totalrecurringsemiannually);           
        }
        if (data.totalrecurringtriennially) {
            jQuery('#recurringTriennially').show().find('.item-value').html(data.totalrecurringtriennially);            
        }
        if (proRata.length && data.products[index]['proratadate']){
            proRata.html(data.products[index]['proratadate']);
        }

        if ($("input[value='producttrialmanager']").is(':checked')){
            data.total = data.total.replace(/[0-9]+[.,]+[0-9]+/, '0.00');
        }

        jQuery('#totalDueToday').html(data.total);      
        loader.delay(500).fadeOut('slow');
        loaderMob.delay(500).fadeOut('slow');
    });
}

/*
*******************************************
10. Remove Addon
*******************************************
*/
function removeAddonItem(num, type, addonNum)
{
    let button = jQuery('#modalRemoveAddon').find('[data-remove-addon-confirm]');
    button.attr('data-pid', num);
    button.attr('data-type', type);
    button.attr('data-aid', addonNum);
    jQuery('#modalRemoveAddon').modal('show');
}

function removeAddonConfirm(button){    
    let num = button.data('pid'),
        type = button.data('type'),
        addonNum = button.data('aid');
    
    WHMCS.http.jqClient.post("cart.php?a=checkout", 'removeAddon=1&pi=' + num + '&pt=' + type + '&ai=' + addonNum).promise().done(function(data){
        location.reload(); 
    });
}

/*
*******************************************
11. Check Tos
*******************************************
*/

function checkTos(value){
    $('#accepttos').prop('checked', value);
}

/*
*******************************************
Update Stripe
*******************************************
*/

function updateStripe() {
    if(typeof(stripe) !== "undefined") {
        jQuery.post(
            window.location.pathname,
            {
                a: 'checkout',                      //It's like refreshing the page but in the background. Forces the stripe_credit_card_input() function to run.
            }
        ).done(function () {
            jQuery.post(
                window.location.pathname,
                {
                    rsAction: 'getStripeAmount',    //Gets the amount calculated in the stripe_credit_card_input() function.
                }
            ).done(function (data) {
                if(data.amount) {
                    amount = data.amount;
                    initStripe();                   //Reinitialize Stripe with the new amount
                }
            });
        });
    }
}