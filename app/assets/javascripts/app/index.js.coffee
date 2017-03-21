#= require json2
#= require jquery
#= require spine/src/spine
#= require spine/src/relation
#= require spine/src/manager
#= require spine/src/ajax
#= require spine/src/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  constructor: ->
    super
    
    # Initialize controllers:
    @user_chat = new UserChat if gon.chat_id
    
    Spine.Route.setup()    

window.App = App