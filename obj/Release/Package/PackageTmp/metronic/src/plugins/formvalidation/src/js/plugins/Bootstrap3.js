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
var hasClass_1 = require("../utils/hasClass");
var Framework_1 = require("./Framework");
var Bootstrap3 = /** @class */ (function (_super) {
    __extends(Bootstrap3, _super);
    function Bootstrap3(opts) {
        return _super.call(this, Object.assign({}, {
            formClass: 'fv-plugins-bootstrap3',
            messageClass: 'help-block',
            rowClasses: 'has-feedback',
            rowInvalidClass: 'has-error',
            rowPattern: /^(.*)(col|offset)-(xs|sm|md|lg)-[0-9]+(.*)$/,
            rowSelector: '.form-group',
            rowValidClass: 'has-success',
        }, opts)) || this;
    }
    Bootstrap3.prototype.onIconPlaced = function (e) {
        classSet_1.default(e.iconElement, {
            'form-control-feedback': true,
        });
        // Adjust icon place if the field belongs to a `input-group`
        var parent = e.element.parentElement;
        if (hasClass_1.default(parent, 'input-group')) {
            parent.parentElement.insertBefore(e.iconElement, parent.nextSibling);
        }
        var type = e.element.getAttribute('type');
        if ('checkbox' === type || 'radio' === type) {
            var grandParent = parent.parentElement;
            // Place it after the container of checkbox/radio
            if (hasClass_1.default(parent, type)) {
                parent.parentElement.insertBefore(e.iconElement, parent.nextSibling);
            }
            else if (hasClass_1.default(parent.parentElement, type)) {
                grandParent.parentElement.insertBefore(e.iconElement, grandParent.nextSibling);
            }
        }
    };
    return Bootstrap3;
}(Framework_1.default));
exports.default = Bootstrap3;
//# sourceMappingURL=Bootstrap3.js.map