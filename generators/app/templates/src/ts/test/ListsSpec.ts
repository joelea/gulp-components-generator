/// <reference path="../typings/intern/intern/intern.d.ts" />

import chai = require('intern/chai!');
import bdd = require('intern!bdd');
import Lists = require('../main/lists');

var expect = chai.expect;
var describe = bdd.describe;
var it = bdd.it;

describe('Lists', () => {
    describe('#fold', () => {
        it('produce the initial value when folding an empty list', () => {
            var result: number = Lists((a,b) => a + b, 0, []);
            expect(result).to.equal(0);
        });

        it('apply the fold function to the initial value and the only list element in a 1 element list', () => {
            var f = (newString:string, strings:string[]) => strings.concat(newString);
            var result: string[] = Lists(f, [], ['a']);
            expect(result).to.deep.equal(['a']);
        });
    });
});