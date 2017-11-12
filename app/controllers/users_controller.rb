class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to index_path
    else
      if params.has_key?(:id)
        if params[:id] != current_user.id.to_s
          flash[:alert] = "You may not access that page."
          redirect_to root_path
        else
          @items = Item.where(user_id: params[:id])
          @user = User.find(params[:id])
        end
      else
        @items = Item.where(user_id: current_user)
        @user = User.find(current_user.id)
      end
    end
  end
end
