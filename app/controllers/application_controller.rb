require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action ->() { gon.current_user_id = current_user.id }, if: :user_signed_in?
end
