class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to index_path
    else
      if params.has_key?(:id)
        @items = Item.where(user_id: params[:id])
        @user = User.find(params[:id])
      else
        @items = Item.where(user_id: current_user)
        @user = User.find(current_user.id)
      end
    end
  end
end
