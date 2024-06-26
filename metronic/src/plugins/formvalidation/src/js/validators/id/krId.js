"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
Object.defineProperty(exports, "__esModule", { value: true });
var isValidDate_1 = require("../../utils/isValidDate");
/**
 * Validate Korean registration number (RRN)
 *
 * @see https://en.wikipedia.org/wiki/Resident_registration_number
 * @returns {ValidateResult}
 */
function krId(value) {
    var v = value.replace('-', '');
    if (!/^\d{13}$/.test(v)) {
        return {
            meta: {},
            valid: false,
        };
    }
    // Check the date of birth
    var sDigit = v.charAt(6);
    var year = parseInt(v.substr(0, 2), 10);
    var month = parseInt(v.substr(2, 2), 10);
    var day = parseInt(v.substr(4, 2), 10);
    switch (sDigit) {
        case '1':
        case '2':
        case '5':
        case '6':
            year += 1900;
            break;
        case '3':
        case '4':
        case '7':
        case '8':
            year += 2000;
            break;
        default:
            year += 1800;
            break;
    }
    if (!isValidDate_1.default(year, month, day)) {
        return {
            meta: {},
            valid: false,
        };
    }
    // Calculate the check digit
    var weight = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
    var length = v.length;
    var sum = 0;
    for (var i = 0; i < length - 1; i++) {
        sum += weight[i] * parseInt(v.charAt(i), 10);
    }
    var checkDigit = (11 - sum % 11) % 10;
    return {
        meta: {},
        valid: "" + checkDigit === v.charAt(length - 1),
    };
}
exports.default = krId;
//# sourceMappingURL=krId.js.map