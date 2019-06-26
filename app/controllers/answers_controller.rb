class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.round = Round.find(params[:round_id])
    @answer.user = User.find(session[:user_id])
    @answer.save
    Pusher.trigger('answer-channel','new-answer', {
      answer: @answer.content,
      id: @answer.id,
      missing: @answer.round.answers.size,
      user: @answer.user.id
    })
    # redirect_to game_round_path(@answer.round.game, @answer.round)
  end

  def vote
    @user = User.find(session[:user_id])
    @answer = Answer.find(params[:id])
    vote = Vote.new(user: @user, answer: @answer, round: @answer.round)
    if vote.save
      Pusher.trigger('answer-channel', 'vote', {
        id: @answer.id,
        content: @answer.content,
        voteCount: @answer.votes.size
      })
    else
      Pusher.trigger('answer-channel', 'error', {
        error: vote.errors.full_messages
      })
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
