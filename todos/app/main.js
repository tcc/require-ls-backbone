require({
  paths: {
  	app: '../app',
  	Json2: '../lib/json2',
  	jQuery: '../lib/jquery',
  	underscore: '../lib/underscore',
  	backbone: '../lib/backbone-min',
  	'backbone.localstorage': '../lib/backbone-localstorage-min',
    ls: '../lib/ls',
    livescript: '../lib/livescript',
  },
  shim: {
    'jQuery': {
      exports: '$'
    },
    'underscore': {
      exports: '_'
    },
    'backbone': {
      deps: ['underscore', 'jQuery'],
      exports: 'backbone'
    },
    'backbone.localstorage': {
      deps: ['backbone','Json2'],
    }
  }
}, ['ls!app/lsmain']);