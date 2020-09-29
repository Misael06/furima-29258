class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]

  def index
  end

  def new
  end

  def move_to_new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
