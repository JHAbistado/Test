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
// Support Turretcss framework (https://turretcss.com/)
var Turret = /** @class */ (function (_super) {
    __extends(Turret, _super);
    function Turret(opts) {
        // See https://turretcss.com/docs/form/
        return _super.call(this, Object.assign({}, {
            formClass: 'fv-plugins-turret',
            messageClass: 'form-message',
            rowInvalidClass: 'fv-invalid-row',
            rowPattern: /^field$/,
            rowSelector: '.field',
            rowValidClass: 'fv-valid-row',
        }, opts)) || this;
    }
    Turret.prototype.onIconPlaced = function (e) {
        var type = e.element.getAttribute('type');
        var parent = e.element.parentElement;
        if ('checkbox' === type || 'radio' === type) {
            // Place it after the container of checkbox/radio
            parent.parentElement.insertBefore(e.iconElement, parent.nextSibling);
            classSet_1.default(e.iconElement, {
                'fv-plugins-icon-check': true,
            });
        }
    };
    return Turret;
}(Framework_1.default));
exports.default = Turret;
//# sourceMappingURL=Turret.js.map