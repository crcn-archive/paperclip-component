
pc       = require "paperclip"
type     = require "type-component"
bindable = require "bindable"

module.exports = (Component) ->

  class ComponentBlockBinding extends pc.BaseBlockBinding

    ###
    ###

    constructor: () ->
      super arguments...
      @_settings = new bindable.Object()
      @_settings.bind "options", @_changeViewOptions

    ###
    ###

    _onChange: (value) =>
      ops = @_fixOptions value

      unless @_component
        @_createComponent()

      @_settings.set "options", ops


    ###
    ###

    unbind: () =>
      super()
      @child?.unbind()
      @_component?.dispose()

    ###
    ###

    _createComponent: (@viewName) =>
      @_component = new Component()
      @_component.set "parent", @context
      @section.append @_component.render()

      if @contentTemplate
        @child = @contentTemplate.bind @_component

    ###
    ###

    _changeViewOptions: (componentOptions) =>
      for key of componentOptions
        @_component.set key, componentOptions[key]

    ###
    ###

    _fixOptions: (options) ->
      if type(options) is "object"
        return options
      else
        return { model: options }
