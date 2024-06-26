"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
Object.defineProperty(exports, "__esModule", { value: true });
/**
 * Validate Greek VAT number
 *
 * @returns {ValidateResult}
 */
function grVat(value) {
    var v = value;
    if (/^(GR|EL)[0-9]{9}$/.test(v)) {
        v = v.substr(2);
    }
    if (!/^[0-9]{9}$/.test(v)) {
        return {
            meta: {},
            valid: false,
        };
    }
    if (v.length === 8) {
        v = "0" + v;
    }
    var weight = [256, 128, 64, 32, 16, 8, 4, 2];
    var sum = 0;
    for (var i = 0; i < 8; i++) {
        sum += parseInt(v.charAt(i), 10) * weight[i];
    }
    sum = (sum % 11) % 10;
    return {
        meta: {},
        valid: "" + sum === v.substr(8, 1),
    };
}
exports.default = grVat;
//# sourceMappingURL=grVat.js.map