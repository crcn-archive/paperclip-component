componentBlockBinding = require "./componentBlockBinding"
SectionBlockBinding   = require "./sectionBlockBinding"

###
###

registerComponents = (components, pc) ->

  register = (key, value) ->
    pc.blockBinding key, componentBlockBinding value
  
  for name of (o = components.toObject())
    register name, o[name]

  components.on "change", register

###
###

module.exports = (components) ->

  (pc) -> 
    registerComponents components, pc
    pc.blockBinding "section", SectionBlockBinding
