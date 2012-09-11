require({
  paths: {
  	app: '../app',
  	Json2: '../lib/json2',
  	jQuery: '../lib/jquery',
  	Underscore: '../lib/underscore',
  	Backbone: '../lib/backbone',
  	Backbonels: '../lib/backbone-localstorage',
    ls: '../lib/ls',
    livescript: '../lib/livescript',
  },
  shim: {
    'jQuery': {
      exports: '$'
    },
    'Underscore': {
      exports: '_'
    },
    'Backbone': {
      deps: ['Underscore', 'jQuery'],
      exports: 'Backbone'
    },
    'Backbonels': {
      deps: ['Backbone','Json2'],
    }
  }
}, ['ls!app/lsmain']);