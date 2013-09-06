pc = require "paperclip"

###
 Does a few things - defines sections, and uses them. For example:

 defining:

 {{#section:"list"}}

  {{ 
    view: {
      type: "list",
      source: students
    }
  }}

 {{/}}

 using:

 {{ section: sections.list }}
###

class SectionBlockBinding extends pc.BaseBlockBinding

  ###
   called when needed, otherwise content is never created.
  ###

  createFragment: () ->

    # create only once
    #unless @_content
    @_content = @contentTemplate.bind(@context)

    @_content.section.toFragment()

  ###
  ###

  _onChange: (value) =>
  
    if @contentTemplate
      @_changeDefinition value
    else
      @_changeContent value

  ###
  ###

  _changeDefinition: (value) ->

    # reference to this block so that when referenced, the content
    # is instantiated
    @context.set "sections.#{value}", @

  ###
  ###

  _changeContent: (value) ->

    @section.removeAll()

    if value
      @section.append value.createFragment()


module.exports = SectionBlockBinding