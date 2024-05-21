"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
Object.defineProperty(exports, "__esModule", { value: true });
var format_1 = require("../utils/format");
function greaterThan() {
    return {
        validate: function (input) {
            if (input.value === '') {
                return { valid: true };
            }
            var opts = Object.assign({}, { inclusive: true, message: '' }, input.options);
            var minValue = parseFloat(("" + opts.min).replace(',', '.'));
            return opts.inclusive
                ? {
                    message: format_1.default(input.l10n ? opts.message || input.l10n.greaterThan.default : opts.message, "" + minValue),
                    valid: parseFloat(input.value) >= minValue,
                }
                : {
                    message: format_1.default(input.l10n ? opts.message || input.l10n.greaterThan.notInclusive : opts.message, "" + minValue),
                    valid: parseFloat(input.value) > minValue,
                };
        },
    };
}
exports.default = greaterThan;
//# sourceMappingURL=greaterThan.js.map