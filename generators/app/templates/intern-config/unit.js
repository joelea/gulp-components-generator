define({
  suites: [
    'build/js/test/ListsSpec.js'
  ],

  loaders: {
    'host-node': 'requirejs',
    'host-browser': 'node_modules/requirejs/require.js'
  },

  reporters: [ 'Pretty' ],

  excludeInstrumentation: /./
});