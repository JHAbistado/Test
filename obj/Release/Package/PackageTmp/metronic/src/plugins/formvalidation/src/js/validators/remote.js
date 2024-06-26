"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
Object.defineProperty(exports, "__esModule", { value: true });
var fetch_1 = require("../utils/fetch");
function remote() {
    var DEFAULT_OPTIONS = {
        crossDomain: false,
        data: {},
        headers: {},
        method: 'GET',
        validKey: 'valid',
    };
    return {
        validate: function (input) {
            if (input.value === '') {
                return Promise.resolve({
                    valid: true,
                });
            }
            var opts = Object.assign({}, DEFAULT_OPTIONS, input.options);
            var data = opts.data;
            // Support dynamic data
            if ('function' === typeof opts.data) {
                data = opts.data.call(this, input);
            }
            // Parse string data from HTML5 attribute
            if ('string' === typeof data) {
                data = JSON.parse(data);
            }
            data[opts.name || input.field] = input.value;
            // Support dynamic url
            var url = ('function' === typeof opts.url)
                ? opts.url.call(this, input)
                : opts.url;
            return fetch_1.default(url, {
                crossDomain: opts.crossDomain,
                headers: opts.headers,
                method: opts.method,
                params: data,
            }).then(function (response) {
                return Promise.resolve({
                    message: response.message,
                    meta: response,
                    valid: "" + response[opts.validKey] === 'true',
                });
            }).catch(function (reason) {
                return Promise.reject({
                    valid: false,
                });
            });
        },
    };
}
exports.default = remote;
//# sourceMappingURL=remote.js.map