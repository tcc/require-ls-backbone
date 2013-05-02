define ['backbone'], ->

  TodoView = Backbone.View.extend {
    tagName:  "li"

    template: _.template($('#item-template').html())

    events: {
      'click .toggle'   : 'toggleDone'
      'dblclick .view'  : 'edit'
      'click a.destroy' : 'clear'
      'keypress .edit'  : 'updateOnEnter'
      'blur .edit'      : 'close'
    }

    initialize: ->
      this.model.on('change', this.render, this)
      this.model.on('destroy', this.remove, this)

    render: ->
      this.$el.html(this.template(this.model.toJSON()))
      this.$el.toggleClass('done', this.model.get('done'))
      this.input = this.$('.edit')
      return this

    toggleDone: -> this.model.toggle()

    edit: ->
      this.$el.addClass("editing");
      this.input.focus();

    close: ->
      value = this.input.val()
      this.clear() if !value
      this.model.save({title: value})
      this.$el.removeClass("editing")

    updateOnEnter: (e) -> this.close() if e.keyCode == 13

    clear: -> this.model.clear()
  }
