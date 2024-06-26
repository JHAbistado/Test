"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
Object.defineProperty(exports, "__esModule", { value: true });
var format_1 = require("../utils/format");
function stringLength() {
    // Credit to http://stackoverflow.com/a/23329386 (@lovasoa) for UTF-8 byte length code
    var utf8Length = function (str) {
        var s = str.length;
        for (var i = str.length - 1; i >= 0; i--) {
            var code = str.charCodeAt(i);
            if (code > 0x7f && code <= 0x7ff) {
                s++;
            }
            else if (code > 0x7ff && code <= 0xffff) {
                s += 2;
            }
            if (code >= 0xDC00 && code <= 0xDFFF) {
                i--;
            }
        }
        return "" + s;
    };
    return {
        /**
         * Check if the length of element value is less or more than given number
         */
        validate: function (input) {
            var opts = Object.assign({}, {
                message: '',
                trim: false,
                utf8Bytes: false,
            }, input.options);
            var v = (opts.trim === true || "" + opts.trim === 'true') ? input.value.trim() : input.value;
            if (v === '') {
                return { valid: true };
            }
            // TODO: `min`, `max` can be dynamic options
            var min = opts.min ? "" + opts.min : '';
            var max = opts.max ? "" + opts.max : '';
            var length = opts.utf8Bytes ? utf8Length(v) : v.length;
            var isValid = true;
            var msg = input.l10n ? (opts.message || input.l10n.stringLength.default) : opts.message;
            if ((min && length < parseInt(min, 10)) || (max && length > parseInt(max, 10))) {
                isValid = false;
            }
            switch (true) {
                case (!!min && !!max):
                    msg = format_1.default(input.l10n ? opts.message || input.l10n.stringLength.between : opts.message, [min, max]);
                    break;
                case (!!min):
                    msg = format_1.default(input.l10n ? opts.message || input.l10n.stringLength.more : opts.message, "" + (parseInt(min, 10) - 1));
                    break;
                case (!!max):
                    msg = format_1.default(input.l10n ? opts.message || input.l10n.stringLength.less : opts.message, "" + (parseInt(max, 10) + 1));
                    break;
                default:
                    break;
            }
            return {
                message: msg,
                valid: isValid,
            };
        },
    };
}
exports.default = stringLength;
//# sourceMappingURL=stringLength.js.map