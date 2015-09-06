/// <reference path="../typings/lodash.d.ts" />

import _ = require('lodash')

//if(alert) {
//    alert('HELLO');
//}

console.log("hello world");

var fold = function<Value,Accum>(
    f: (listAccums: Value, accum: Accum) => Accum,
    initial: Accum,
    list: Value[])
    : Accum {

    if(list.length == 0) {
        return initial
    }

    var next = f(list[0], initial);
    var rest = list.slice(1);
    return fold(f, next, rest);
};

export = fold;
