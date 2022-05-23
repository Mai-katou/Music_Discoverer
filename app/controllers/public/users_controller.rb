class Public::UsersController < ApplicationController
  def show
    @user= User.find(params[:id])
    @evaluations = Evaluation.where(user_id: current_user.id)
  end

  def edit
    @user= User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if user_id = current_user.id
      @user.update(user_params)
      redirect_to public_user_path(current_user.id)
    else
      redirect_to about_oath_url
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
