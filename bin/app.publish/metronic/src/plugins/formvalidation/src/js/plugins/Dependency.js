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
var Dependency = /** @class */ (function (_super) {
    __extends(Dependency, _super);
    function Dependency(opts) {
        var _this = _super.call(this, opts) || this;
        _this.opts = opts || {};
        _this.triggerExecutedHandler = _this.onTriggerExecuted.bind(_this);
        return _this;
    }
    Dependency.prototype.install = function () {
        this.core.on('plugins.trigger.executed', this.triggerExecutedHandler);
    };
    Dependency.prototype.uninstall = function () {
        this.core.off('plugins.trigger.executed', this.triggerExecutedHandler);
    };
    Dependency.prototype.onTriggerExecuted = function (e) {
        if (this.opts[e.field]) {
            var dependencies = this.opts[e.field].split(' ');
            for (var _i = 0, dependencies_1 = dependencies; _i < dependencies_1.length; _i++) {
                var d = dependencies_1[_i];
                var dependentField = d.trim();
                if (this.opts[dependentField]) {
                    // Revalidate the dependent field
                    this.core.revalidateField(dependentField);
                }
            }
        }
    };
    return Dependency;
}(Plugin_1.default));
exports.default = Dependency;
//# sourceMappingURL=Dependency.js.map