class UsersController < ApplicationController
  respond_to :json

  has_scope :where, type: :hash

  expose(:users) { apply_scopes(User.all) }

  def index
    respond_with users
  end
end
