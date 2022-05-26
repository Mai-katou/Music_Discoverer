class Public::EvaluationsController < ApplicationController
  def index
    @evaluations= Evaluation.all
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.user_id = current_user.id
    if @evaluation.save
      redirect_to public_evaluations_path
    else
      redirect_to about_path_url
    end
  end

  def show
    @evaluation = Evaluation.find(params[:id])
  end

  def edit
    @evaluation= Evaluation.find(params[:id])
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.user_id=current_user.id
       @evaluation.update(evaluation_params)
       redirect_to public_user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.user_id=current_user.id
      @evaluation.destroy
      redirect_to public_user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  private
  def evaluation_params
    params.require(:evaluation).permit(:user_id, :music_title, :point, :evaluation)
  end
end
