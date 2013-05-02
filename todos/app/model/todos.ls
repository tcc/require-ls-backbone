define ['backbone.localstorage'], (bkl) ->

  Todo = Backbone.Model.extend {
    defaults: -> {
        title: "empty todo..."
        order: Todos.nextOrder()
        done: false
    }

    initialize: ->
      if !this.get("title")
        this.set({"title": this.defaults().title})

    toggle: -> this.save({done: !this.get("done")})

    clear: -> this.destroy()
  }

  TodoList = Backbone.Collection.extend {
    model: Todo

    localStorage: new Backbone.LocalStorage('todos-backbone')

    done: -> return this.filter((todo) -> todo.get('done') )

    remaining: -> return this.without.apply(this, this.done())

    nextOrder: ->
      return 1 if !this.length
      return this.last().get('order') + 1

    comparator: (todo) -> todo.get('order')
  }

  Todos = new TodoList