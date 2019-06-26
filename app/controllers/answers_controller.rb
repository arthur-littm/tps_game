class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.round = Round.find(params[:round_id])
    @answer.user = User.find(session[:user_id])
    @answer.save
    Pusher.trigger('answer-channel','new-answer', {
      answer: @answer.content
    })
    # redirect_to game_round_path(@answer.round.game, @answer.round)
  end

  def vote
    @user = User.find(session[:user_id])
    @answer = Answer.find(params[:id])
    vote = Vote.new(user: @user, answer: @answer, round: @answer.round)
    if vote.save
      render json: { message: 'success' }, status: 200
    else
      render json: { message: @votes.errors.full_messages }, status: 422
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
