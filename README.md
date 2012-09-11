# require-ls-backone #

A example project lets [require-ls](https://github.com/tcc/require-ls) 
(A [RequireJS](http://requirejs.org) loader plugin for 
[LiveScript](http://gkz.github.com/LiveScript/)) and 
[Backbone.js](http://backbonejs.org) work together.

Try to modularize Backbone's code with LiveScript.

The original code from Backbone's [example](https://github.com/documentcloud/backbone/tree/master/examples).

First, I re-organize to keep html, css, pic, .js of app (`todos.js`) in `todos/` folder and put .js of libraries in `todos/lib/` folder … `index_bk.html` is original `index.html`. 

Second, write bootstrap files (`app/main.js`, `app/lsmain.ls`) for require-ls, and divide `todos.js` into model/view folders (`app/model/*.js`, `app/view/*.js`). 

Finally, convert `app/model/*.js`, `app/view/*.js` to `app/model/*.ls`, `app/view/*.ls`. 


## Usage <a name="usage"></a> ##

1. git clone this repo

		git clone https://github.com/tcc/require-ls-backbone.git 

2. Firfox open `todos/index.html` as local file, otherwise it needs local web server (for require-ls).


### Javascript version <a name="js_ver"></a> ###

Modify `todos\app\lsmain.js` as:

	define ['app/view/app'], (AppView) ->
	  $ -> new AppView

(Change `'ls:app/view/app'` to `app/view/app`)

### LiveScript version <a name="ls_ver"></a> ###

Keep `todos\app\lsmain.js` as:

	define ['ls:app/view/app'], (AppView) ->
	  $ -> new AppView

## Todo <a name="todo"></a> ##

* class version like [requirejs-coffeescript-backbone-jquery-bootstrap](https://github.com/shanejonas/requirejs-coffeescript-backbone-jquery-bootstrap).
