"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
Object.defineProperty(exports, "__esModule", { value: true });
/**
 * Validate Poland citizen number (PESEL)
 *
 * @see http://en.wikipedia.org/wiki/National_identification_number#Poland
 * @see http://en.wikipedia.org/wiki/PESEL
 * @returns {ValidateResult}
 */
function plId(value) {
    if (!/^[0-9]{11}$/.test(value)) {
        return {
            meta: {},
            valid: false,
        };
    }
    var sum = 0;
    var length = value.length;
    var weight = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3, 7];
    for (var i = 0; i < length - 1; i++) {
        sum += weight[i] * parseInt(value.charAt(i), 10);
    }
    sum = sum % 10;
    if (sum === 0) {
        sum = 10;
    }
    sum = 10 - sum;
    return {
        meta: {},
        valid: "" + sum === value.charAt(length - 1),
    };
}
exports.default = plId;
//# sourceMappingURL=plId.js.map