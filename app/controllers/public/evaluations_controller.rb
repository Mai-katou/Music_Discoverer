class Public::EvaluationsController < ApplicationController
  def index
    @evaluations= Evaluation.all
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.save
    redirect_to public_evaluations_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def evaluation_params
    params.require(:evaluation).permit(:user_id, :music_title, :point, :evaluation)
  end
end
