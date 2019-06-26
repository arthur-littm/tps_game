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

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
