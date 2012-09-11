define ['ls!app/model/todos' 'ls!app/view/todo'], (Todos, TodoView) ->
  
  AppView = Backbone.View.extend {
    el: $(\#todoapp)

    statsTemplate: _.template($(\#stats-template).html())

    events: {
      'keypress #new-todo':  'createOnEnter'
      'click #clear-completed': 'clearCompleted'
      'click #toggle-all': 'toggleAllComplete'
    }

    initialize: ->
      this.input = this.$(\#new-todo)
      this.allCheckbox = this.$(\#toggle-all)[0]

      Todos.on('add', this.addOne, this)
      Todos.on('reset', this.addAll, this)
      Todos.on('all', this.render, this)

      this.footer = this.$('footer')
      this.main = $(\#main)

      Todos.fetch()

    render: ->
      done = Todos.done().length
      remaining = Todos.remaining().length

      if Todos.length
        this.main.show()
        this.footer.show()
        this.footer.html(this.statsTemplate({done: done, remaining: remaining}))
      else
        this.main.hide()
        this.footer.hide()

      this.allCheckbox.checked = !remaining

    addOne: (todo) ->
      view = new TodoView({model: todo})
      this.$(\#todo-list).append(view.render().el)

    addAll: -> Todos.each(this.addOne)

    createOnEnter: (e) ->
      return if e.keyCode != 13
      return if !this.input.val()
      Todos.create({title: this.input.val()})
      this.input.val('')

    clearCompleted: ->
      _.each Todos.done(), (todo) -> todo.clear();
      return false

    toggleAllComplete: ->
      done = this.allCheckbox.checked
      Todos.each (todo) -> todo.save({'done': done})
  }
