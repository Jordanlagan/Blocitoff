class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to index_path
    else
      @items = Item.where(user_id: current_user.id)
    end
  end
end
