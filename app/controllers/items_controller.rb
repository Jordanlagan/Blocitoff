class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @item = @user.items.build(item_params)

    if @item.save
  		flash[:notice] = "Task was saved."
  		redirect_to root_path
  	else
  		flash.now[:alert] = "There was an error. please try again"
  		render :new
  	end
  end

  def destroy
    @item = Item.find(params[:id])
    if !@item.destroy
      flash.now[:alert] = "There was a problem deleting the task."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
