// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

jQuery(document).on('turbolinks:load', function() {
  window.Channels || (window.Channels = {});
  
  if (gon.current_user_id) {
    Channels.cable = ActionCable.createConsumer();
  }

});
