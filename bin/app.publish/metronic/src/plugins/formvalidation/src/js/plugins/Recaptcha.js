"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
var Plugin_1 = require("../core/Plugin");
var fetch_1 = require("../utils/fetch");
/**
 * This plugin shows and validates a Google reCAPTCHA v2
 * Usage:
 * - Register a ReCaptcha API key
 * - Prepare a container to show the captcha
 *  ```
 *  <form id="testForm">
 *      <div id="captchaContainer"></div>
 *  </form>
 *  ```
 * - Use the plugin
 *  ```
 *  formValidation(document.getElementById('testForm'), {
 *      plugins: {
 *          recaptcha: new Recaptcha({
 *              element: 'captchaContainer',
 *              theme: 'light',
 *              siteKey: '...', // The key provided by Google
 *              language: 'en',
 *              message: 'The captcha is not valid'
 *          })
 *      }
 *  })
 *  ```
 */
var Recaptcha = /** @class */ (function (_super) {
    __extends(Recaptcha, _super);
    function Recaptcha(opts) {
        var _this = _super.call(this, opts) || this;
        _this.widgetIds = new Map();
        _this.captchaStatus = 'NotValidated';
        _this.opts = Object.assign({}, Recaptcha.DEFAULT_OPTIONS, opts);
        _this.fieldResetHandler = _this.onResetField.bind(_this);
        _this.preValidateFilter = _this.preValidate.bind(_this);
        _this.iconPlacedHandler = _this.onIconPlaced.bind(_this);
        return _this;
    }
    Recaptcha.prototype.install = function () {
        var _this = this;
        this.core
            .on('core.field.reset', this.fieldResetHandler)
            .on('plugins.icon.placed', this.iconPlacedHandler)
            .registerFilter('validate-pre', this.preValidateFilter);
        var loadPrevCaptcha = (typeof window[Recaptcha.LOADED_CALLBACK] === 'undefined')
            ? function () { } // tslint:disable-line:no-empty
            : window[Recaptcha.LOADED_CALLBACK];
        window[Recaptcha.LOADED_CALLBACK] = function () {
            // Call the previous loaded function
            // to support multiple recaptchas on the same page
            loadPrevCaptcha();
            var captchaOptions = {
                'badge': _this.opts.badge,
                'callback': function () {
                    if (_this.opts.backendVerificationUrl === '') {
                        _this.captchaStatus = 'Valid';
                        // Mark the captcha as valid, so the library will remove the error message
                        _this.core.updateFieldStatus(Recaptcha.CAPTCHA_FIELD, 'Valid');
                    }
                },
                'error-callback': function () {
                    _this.captchaStatus = 'Invalid';
                    _this.core.updateFieldStatus(Recaptcha.CAPTCHA_FIELD, 'Invalid');
                },
                'expired-callback': function () {
                    // Update the captcha status when session expires
                    _this.captchaStatus = 'NotValidated';
                    _this.core.updateFieldStatus(Recaptcha.CAPTCHA_FIELD, 'NotValidated');
                },
                'sitekey': _this.opts.siteKey,
                'size': _this.opts.size,
            };
            // tslint:disable-next-line:no-string-literal
            var widgetId = window['grecaptcha'].render(_this.opts.element, captchaOptions);
            _this.widgetIds.set(_this.opts.element, widgetId);
            _this.core.addField(Recaptcha.CAPTCHA_FIELD, {
                validators: {
                    promise: {
                        message: _this.opts.message,
                        promise: function (input) {
                            var _a;
                            var value = _this.widgetIds.has(_this.opts.element)
                                // tslint:disable-next-line:no-string-literal
                                ? window['grecaptcha'].getResponse(_this.widgetIds.get(_this.opts.element))
                                : input.value;
                            if (value === '') {
                                _this.captchaStatus = 'Invalid';
                                return Promise.resolve({
                                    valid: false,
                                });
                            }
                            else if (_this.opts.backendVerificationUrl === '') {
                                _this.captchaStatus = 'Valid';
                                return Promise.resolve({
                                    valid: true,
                                });
                            }
                            else if (_this.captchaStatus === 'Valid') {
                                // Do not need to send the back-end verification request if the captcha is already valid
                                return Promise.resolve({
                                    valid: true,
                                });
                            }
                            else {
                                return fetch_1.default(_this.opts.backendVerificationUrl, {
                                    method: 'POST',
                                    params: (_a = {},
                                        _a[Recaptcha.CAPTCHA_FIELD] = value,
                                        _a),
                                }).then(function (response) {
                                    // tslint:disable-next-line:no-string-literal
                                    var isValid = "" + response['success'] === 'true';
                                    _this.captchaStatus = isValid ? 'Valid' : 'Invalid';
                                    return Promise.resolve({
                                        meta: response,
                                        valid: isValid,
                                    });
                                }).catch(function (reason) {
                                    _this.captchaStatus = 'NotValidated';
                                    return Promise.reject({
                                        valid: false,
                                    });
                                });
                            }
                        },
                    },
                },
            });
        };
        var src = this.getScript();
        if (!document.body.querySelector("script[src=\"" + src + "\"]")) {
            var script = document.createElement('script');
            script.type = 'text/javascript';
            script.async = true;
            script.defer = true;
            script.src = src;
            document.body.appendChild(script);
        }
    };
    Recaptcha.prototype.uninstall = function () {
        if (this.timer) {
            clearTimeout(this.timer);
        }
        this.core
            .off('core.field.reset', this.fieldResetHandler)
            .off('plugins.icon.placed', this.iconPlacedHandler)
            .deregisterFilter('validate-pre', this.preValidateFilter);
        this.widgetIds.clear();
        // Remove script
        var src = this.getScript();
        var scripts = [].slice.call(document.body.querySelectorAll("script[src=\"" + src + "\"]"));
        scripts.forEach(function (s) { return s.parentNode.removeChild(s); });
        this.core.removeField(Recaptcha.CAPTCHA_FIELD);
    };
    Recaptcha.prototype.getScript = function () {
        var lang = this.opts.language ? "&hl=" + this.opts.language : '';
        return "https://www.google.com/recaptcha/api.js?onload=" + Recaptcha.LOADED_CALLBACK + "&render=explicit" + lang;
    };
    Recaptcha.prototype.preValidate = function () {
        var _this = this;
        // grecaptcha.execute() is only available for invisible reCAPTCHA
        if (this.opts.size === 'invisible' && this.widgetIds.has(this.opts.element)) {
            var widgetId_1 = this.widgetIds.get(this.opts.element);
            return this.captchaStatus === 'Valid'
                ? Promise.resolve()
                : new Promise(function (resolve, reject) {
                    // tslint:disable-next-line:no-string-literal
                    window['grecaptcha'].execute(widgetId_1).then(function () {
                        if (_this.timer) {
                            clearTimeout(_this.timer);
                        }
                        _this.timer = window.setTimeout(resolve, 1 * 1000);
                    });
                });
        }
        else {
            return Promise.resolve();
        }
    };
    Recaptcha.prototype.onResetField = function (e) {
        if (e.field === Recaptcha.CAPTCHA_FIELD && this.widgetIds.has(this.opts.element)) {
            var widgetId = this.widgetIds.get(this.opts.element);
            window['grecaptcha'].reset(widgetId); // tslint:disable-line:no-string-literal
        }
    };
    Recaptcha.prototype.onIconPlaced = function (e) {
        if (e.field === Recaptcha.CAPTCHA_FIELD) {
            // Hide the icon for captcha element, since it will look weird when the captcha is valid
            if (this.opts.size === 'invisible') {
                e.iconElement.style.display = 'none';
            }
            else {
                var captchaContainer = document.getElementById(this.opts.element);
                // We need to move the icon element to after the captcha container
                // Otherwise, the icon will be removed when the captcha is re-rendered (after it's expired)
                if (captchaContainer) {
                    captchaContainer.parentNode.insertBefore(e.iconElement, captchaContainer.nextSibling);
                }
            }
        }
    };
    // The captcha field name, generated by Google reCAPTCHA
    Recaptcha.CAPTCHA_FIELD = 'g-recaptcha-response';
    Recaptcha.DEFAULT_OPTIONS = {
        backendVerificationUrl: '',
        badge: 'bottomright',
        size: 'normal',
        theme: 'light',
    };
    // The name of callback that will be executed after reCaptcha script is loaded
    Recaptcha.LOADED_CALLBACK = '___reCaptchaLoaded___';
    return Recaptcha;
}(Plugin_1.default));
exports.default = Recaptcha;
//# sourceMappingURL=Recaptcha.js.map