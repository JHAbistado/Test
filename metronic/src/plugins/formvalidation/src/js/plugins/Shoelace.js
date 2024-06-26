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
var classSet_1 = require("../utils/classSet");
var Framework_1 = require("./Framework");
// This plugin supports validating the form made with https://shoelace.style
var Shoelace = /** @class */ (function (_super) {
    __extends(Shoelace, _super);
    function Shoelace(opts) {
        // See https://shoelace.style/#forms
        return _super.call(this, Object.assign({}, {
            formClass: 'fv-plugins-shoelace',
            messageClass: 'fv-help-block',
            rowInvalidClass: 'input-invalid',
            rowPattern: /^(.*)(col|offset)-[0-9]+(.*)$/,
            rowSelector: '.input-field',
            rowValidClass: 'input-valid',
        }, opts)) || this;
    }
    Shoelace.prototype.onIconPlaced = function (e) {
        var parent = e.element.parentElement;
        var type = e.element.getAttribute('type');
        if ('checkbox' === type || 'radio' === type) {
            classSet_1.default(e.iconElement, {
                'fv-plugins-icon-check': true,
            });
            if ('LABEL' === parent.tagName) {
                // Place it after the container of checkbox/radio
                parent.parentElement.insertBefore(e.iconElement, parent.nextSibling);
            }
        }
    };
    return Shoelace;
}(Framework_1.default));
exports.default = Shoelace;
//# sourceMappingURL=Shoelace.js.map