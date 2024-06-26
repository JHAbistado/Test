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
var Recaptcha3Token = /** @class */ (function (_super) {
    __extends(Recaptcha3Token, _super);
    function Recaptcha3Token(opts) {
        var _this = _super.call(this, opts) || this;
        _this.opts = Object.assign({}, {
            action: 'submit',
            hiddenTokenName: '___hidden-token___',
        }, opts);
        _this.onValidHandler = _this.onFormValid.bind(_this);
        return _this;
    }
    Recaptcha3Token.prototype.install = function () {
        this.core.on('core.form.valid', this.onValidHandler);
        // Add a hidden field to the form
        this.hiddenTokenEle = document.createElement('input');
        this.hiddenTokenEle.setAttribute('type', 'hidden');
        this.core.getFormElement().appendChild(this.hiddenTokenEle);
        var loadPrevCaptcha = (typeof window[Recaptcha3Token.LOADED_CALLBACK] === 'undefined')
            ? function () { } // tslint:disable-line:no-empty
            : window[Recaptcha3Token.LOADED_CALLBACK];
        window[Recaptcha3Token.LOADED_CALLBACK] = function () {
            // Call the previous loaded function
            // to support multiple recaptchas on the same page
            loadPrevCaptcha();
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
    Recaptcha3Token.prototype.uninstall = function () {
        this.core.off('core.form.valid', this.onValidHandler);
        // Remove script
        var src = this.getScript();
        var scripts = [].slice.call(document.body.querySelectorAll("script[src=\"" + src + "\"]"));
        scripts.forEach(function (s) { return s.parentNode.removeChild(s); });
        // Remove hidden field from the form element
        this.core.getFormElement().removeChild(this.hiddenTokenEle);
    };
    Recaptcha3Token.prototype.onFormValid = function () {
        var _this = this;
        // Send recaptcha request
        // tslint:disable-next-line:no-string-literal
        window['grecaptcha']
            .execute(this.opts.siteKey, { action: this.opts.action })
            .then(function (token) {
            _this.hiddenTokenEle.setAttribute('name', _this.opts.hiddenTokenName);
            _this.hiddenTokenEle.value = token;
            // Submit the form
            var form = _this.core.getFormElement();
            if (form instanceof HTMLFormElement) {
                form.submit();
            }
        });
    };
    Recaptcha3Token.prototype.getScript = function () {
        var lang = this.opts.language ? "&hl=" + this.opts.language : '';
        return 'https://www.google.com/recaptcha/api.js?' +
            ("onload=" + Recaptcha3Token.LOADED_CALLBACK + "&render=" + this.opts.siteKey + lang);
    };
    // The name of callback that will be executed after reCaptcha script is loaded
    Recaptcha3Token.LOADED_CALLBACK = '___reCaptcha3Loaded___';
    return Recaptcha3Token;
}(Plugin_1.default));
exports.default = Recaptcha3Token;
//# sourceMappingURL=Recaptcha3Token.js.map