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
var SubmitButton = /** @class */ (function (_super) {
    __extends(SubmitButton, _super);
    function SubmitButton(opts) {
        var _this = _super.call(this, opts) || this;
        _this.isFormValid = false;
        _this.opts = Object.assign({}, {
            // Set it to `true` to support classical ASP.Net form
            aspNetButton: false,
            // By default, don't perform validation when clicking on
            // the submit button/input which have `formnovalidate` attribute
            buttons: function (form) { return [].slice.call(form.querySelectorAll('[type="submit"]:not([formnovalidate])')); },
        }, opts);
        _this.submitHandler = _this.handleSubmitEvent.bind(_this);
        _this.buttonClickHandler = _this.handleClickEvent.bind(_this);
        return _this;
    }
    SubmitButton.prototype.install = function () {
        var _this = this;
        if (!(this.core.getFormElement() instanceof HTMLFormElement)) {
            return;
        }
        var form = this.core.getFormElement();
        this.submitButtons = this.opts.buttons(form);
        // Disable client side validation in HTML 5
        form.setAttribute('novalidate', 'novalidate');
        // Disable the default submission first
        form.addEventListener('submit', this.submitHandler);
        this.hiddenClickedEle = document.createElement('input');
        this.hiddenClickedEle.setAttribute('type', 'hidden');
        form.appendChild(this.hiddenClickedEle);
        this.submitButtons.forEach(function (button) {
            button.addEventListener('click', _this.buttonClickHandler);
        });
    };
    SubmitButton.prototype.uninstall = function () {
        var _this = this;
        var form = this.core.getFormElement();
        if (form instanceof HTMLFormElement) {
            form.removeEventListener('submit', this.submitHandler);
        }
        this.submitButtons.forEach(function (button) {
            button.removeEventListener('click', _this.buttonClickHandler);
        });
        this.hiddenClickedEle.parentElement.removeChild(this.hiddenClickedEle);
    };
    SubmitButton.prototype.handleSubmitEvent = function (e) {
        this.validateForm(e);
    };
    SubmitButton.prototype.handleClickEvent = function (e) {
        var target = e.currentTarget;
        if (target instanceof HTMLElement) {
            if (this.opts.aspNetButton && this.isFormValid === true) {
                // Do nothing
            }
            else {
                var form = this.core.getFormElement();
                form.removeEventListener('submit', this.submitHandler);
                this.clickedButton = e.target;
                var name_1 = this.clickedButton.getAttribute('name');
                var value = this.clickedButton.getAttribute('value');
                if (name_1 && value) {
                    this.hiddenClickedEle.setAttribute('name', name_1);
                    this.hiddenClickedEle.setAttribute('value', value);
                }
                this.validateForm(e);
            }
        }
    };
    SubmitButton.prototype.validateForm = function (e) {
        var _this = this;
        e.preventDefault();
        this.core.validate().then(function (result) {
            if (result === 'Valid' && _this.opts.aspNetButton && !_this.isFormValid && _this.clickedButton) {
                _this.isFormValid = true;
                _this.clickedButton.removeEventListener('click', _this.buttonClickHandler);
                // It's the time for ASP.Net submit button to do its own submission
                _this.clickedButton.click();
            }
        });
    };
    return SubmitButton;
}(Plugin_1.default));
exports.default = SubmitButton;
//# sourceMappingURL=SubmitButton.js.map