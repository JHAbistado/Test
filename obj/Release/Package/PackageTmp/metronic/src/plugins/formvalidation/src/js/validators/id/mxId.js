"use strict";
/**
 * FormValidation (https://formvalidation.io)
 * The best validation library for JavaScript
 * (c) 2013 - 2020 Nguyen Huu Phuoc <me@phuoc.ng>
 */
Object.defineProperty(exports, "__esModule", { value: true });
var isValidDate_1 = require("../../utils/isValidDate");
/**
 * Validate Mexican ID number (CURP)
 *
 * @see https://en.wikipedia.org/wiki/Unique_Population_Registry_Code
 * @returns {ValidateResult}
 */
function mxId(value) {
    var v = value.toUpperCase();
    if (!/^[A-Z]{4}\d{6}[A-Z]{6}[0-9A-Z]\d$/.test(v)) {
        return {
            meta: {},
            valid: false,
        };
    }
    // Check if the combination of initial names belongs to a back list
    // See
    // http://quemamadera.blogspot.com/2008/02/las-palabras-inconvenientes-del-curp.html
    // https://www.reddit.com/r/mexico/comments/bo8cv/hoy_aprendi_que_existe_un_catalogo_de_palabras/
    var blacklistNames = [
        'BACA', 'BAKA', 'BUEI', 'BUEY', 'CACA', 'CACO', 'CAGA', 'CAGO', 'CAKA', 'CAKO', 'COGE', 'COGI', 'COJA',
        'COJE', 'COJI', 'COJO', 'COLA', 'CULO', 'FALO', 'FETO', 'GETA', 'GUEI', 'GUEY', 'JETA', 'JOTO', 'KACA',
        'KACO', 'KAGA', 'KAGO', 'KAKA', 'KAKO', 'KOGE', 'KOGI', 'KOJA', 'KOJE', 'KOJI', 'KOJO', 'KOLA', 'KULO',
        'LILO', 'LOCA', 'LOCO', 'LOKA', 'LOKO', 'MAME', 'MAMO', 'MEAR', 'MEAS', 'MEON', 'MIAR', 'MION', 'MOCO',
        'MOKO', 'MULA', 'MULO', 'NACA', 'NACO', 'PEDA', 'PEDO', 'PENE', 'PIPI', 'PITO', 'POPO', 'PUTA', 'PUTO',
        'QULO', 'RATA', 'ROBA', 'ROBE', 'ROBO', 'RUIN', 'SENO', 'TETA', 'VACA', 'VAGA', 'VAGO', 'VAKA', 'VUEI',
        'VUEY', 'WUEI', 'WUEY',
    ];
    var name = v.substr(0, 4);
    if (blacklistNames.indexOf(name) >= 0) {
        return {
            meta: {},
            valid: false,
        };
    }
    // Check the date of birth
    var year = parseInt(v.substr(4, 2), 10);
    var month = parseInt(v.substr(6, 2), 10);
    var day = parseInt(v.substr(6, 2), 10);
    if (/^[0-9]$/.test(v.charAt(16))) {
        year += 1900;
    }
    else {
        year += 2000;
    }
    if (!isValidDate_1.default(year, month, day)) {
        return {
            meta: {},
            valid: false,
        };
    }
    // Check the gender
    var gender = v.charAt(10);
    if (gender !== 'H' && gender !== 'M') {
        // H for male, M for female
        return {
            meta: {},
            valid: false,
        };
    }
    // Check the state
    var state = v.substr(11, 2);
    var states = [
        'AS', 'BC', 'BS', 'CC', 'CH', 'CL', 'CM', 'CS', 'DF', 'DG', 'GR', 'GT', 'HG', 'JC', 'MC', 'MN', 'MS',
        'NE', 'NL', 'NT', 'OC', 'PL', 'QR', 'QT', 'SL', 'SP', 'SR', 'TC', 'TL', 'TS', 'VZ', 'YN', 'ZS',
    ];
    if (states.indexOf(state) === -1) {
        return {
            meta: {},
            valid: false,
        };
    }
    // Calculate the check digit
    var alphabet = '0123456789ABCDEFGHIJKLMN&OPQRSTUVWXYZ';
    var sum = 0;
    var length = v.length;
    for (var i = 0; i < length - 1; i++) {
        sum += (18 - i) * alphabet.indexOf(v.charAt(i));
    }
    sum = (10 - sum % 10) % 10;
    return {
        meta: {},
        valid: "" + sum === v.charAt(length - 1),
    };
}
exports.default = mxId;
//# sourceMappingURL=mxId.js.map