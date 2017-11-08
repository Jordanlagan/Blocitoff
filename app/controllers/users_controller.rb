class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to index_path
    end
  end
end
