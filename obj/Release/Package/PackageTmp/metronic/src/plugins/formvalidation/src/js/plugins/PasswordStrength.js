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
var PasswordStrength = /** @class */ (function (_super) {
    __extends(PasswordStrength, _super);
    function PasswordStrength(opts) {
        var _this = _super.call(this, opts) || this;
        _this.opts = Object.assign({}, {
            minimalScore: 3,
            onValidated: function () { },
        }, opts);
        _this.validatePassword = _this.checkPasswordStrength.bind(_this);
        _this.validatorValidatedHandler = _this.onValidatorValidated.bind(_this);
        return _this;
    }
    PasswordStrength.prototype.install = function () {
        var _a;
        this.core.registerValidator(PasswordStrength.PASSWORD_STRENGTH_VALIDATOR, this.validatePassword);
        this.core.on('core.validator.validated', this.validatorValidatedHandler);
        this.core.addField(this.opts.field, {
            validators: (_a = {},
                _a[PasswordStrength.PASSWORD_STRENGTH_VALIDATOR] = {
                    message: this.opts.message,
                    minimalScore: this.opts.minimalScore,
                },
                _a),
        });
    };
    PasswordStrength.prototype.uninstall = function () {
        this.core.off('core.validator.validated', this.validatorValidatedHandler);
        // It's better if we can remove validator
        this.core.disableValidator(this.opts.field, PasswordStrength.PASSWORD_STRENGTH_VALIDATOR);
    };
    PasswordStrength.prototype.checkPasswordStrength = function () {
        var _this = this;
        return {
            validate: function (input) {
                var value = input.value;
                if (value === '') {
                    return {
                        valid: true,
                    };
                }
                var result = zxcvbn(value);
                var score = result.score;
                var message = result.feedback.warning || 'The password is weak';
                if (score < _this.opts.minimalScore) {
                    return {
                        message: message,
                        meta: {
                            message: message,
                            score: score,
                        },
                        valid: false,
                    };
                }
                else {
                    return {
                        meta: {
                            message: message,
                            score: score,
                        },
                        valid: true,
                    };
                }
            },
        };
    };
    PasswordStrength.prototype.onValidatorValidated = function (e) {
        if (e.field === this.opts.field && e.validator === PasswordStrength.PASSWORD_STRENGTH_VALIDATOR
            && e.result.meta) {
            // tslint:disable-next-line:no-string-literal
            var message = e.result.meta['message'];
            // tslint:disable-next-line:no-string-literal
            var score = e.result.meta['score'];
            this.opts.onValidated(e.result.valid, message, score);
        }
    };
    PasswordStrength.PASSWORD_STRENGTH_VALIDATOR = '___PasswordStrengthValidator';
    return PasswordStrength;
}(Plugin_1.default));
exports.default = PasswordStrength;
//# sourceMappingURL=PasswordStrength.js.map