"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
Object.defineProperty(exports, "__esModule", { value: true });
var isValidDate_1 = require("../../utils/isValidDate");
/**
 * Validate Latvian VAT number
 *
 * @returns {ValidateResult}
 */
function lv(value) {
    var v = value;
    if (/^LV[0-9]{11}$/.test(v)) {
        v = v.substr(2);
    }
    if (!/^[0-9]{11}$/.test(v)) {
        return {
            meta: {},
            valid: false,
        };
    }
    var first = parseInt(v.charAt(0), 10);
    var length = v.length;
    var sum = 0;
    var weight = [];
    var i;
    if (first > 3) {
        // Legal entity
        sum = 0;
        weight = [9, 1, 4, 8, 3, 10, 2, 5, 7, 6, 1];
        for (i = 0; i < length; i++) {
            sum += parseInt(v.charAt(i), 10) * weight[i];
        }
        sum = sum % 11;
        return {
            meta: {},
            valid: sum === 3,
        };
    }
    else {
        // Check birth date
        var day = parseInt(v.substr(0, 2), 10);
        var month = parseInt(v.substr(2, 2), 10);
        var year = parseInt(v.substr(4, 2), 10);
        year = year + 1800 + parseInt(v.charAt(6), 10) * 100;
        if (!isValidDate_1.default(year, month, day)) {
            return {
                meta: {},
                valid: false,
            };
        }
        // Check personal code
        sum = 0;
        weight = [10, 5, 8, 4, 2, 1, 6, 3, 7, 9];
        for (i = 0; i < length - 1; i++) {
            sum += parseInt(v.charAt(i), 10) * weight[i];
        }
        sum = (sum + 1) % 11 % 10;
        return {
            meta: {},
            valid: "" + sum === v.charAt(length - 1),
        };
    }
}
exports.default = lv;
//# sourceMappingURL=lvVat.js.map