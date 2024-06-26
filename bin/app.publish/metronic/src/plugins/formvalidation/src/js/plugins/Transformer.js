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
var Transformer = /** @class */ (function (_super) {
    __extends(Transformer, _super);
    function Transformer(opts) {
        var _this = _super.call(this, opts) || this;
        _this.valueFilter = _this.getElementValue.bind(_this);
        return _this;
    }
    Transformer.prototype.install = function () {
        this.core.registerFilter('field-value', this.valueFilter);
    };
    Transformer.prototype.uninstall = function () {
        this.core.deregisterFilter('field-value', this.valueFilter);
    };
    Transformer.prototype.getElementValue = function (defaultValue, field, element, validator) {
        if (this.opts[field] && this.opts[field][validator] && 'function' === typeof this.opts[field][validator]) {
            return this.opts[field][validator].apply(this, [field, element, validator]);
        }
        return defaultValue;
    };
    return Transformer;
}(Plugin_1.default));
exports.default = Transformer;
//# sourceMappingURL=Transformer.js.map