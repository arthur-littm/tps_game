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
  end

  def vote
    @user = User.find(session[:user_id])
    @answer = Answer.find(params[:id])
    @round = @answer.round
    vote = Vote.new(user: @user, answer: @answer, round: @answer.round)
    if vote.save
      if @round.answers.size == @round.votes.size
        next_round_id = @round.game.rounds[@round.game.rounds.index(@round) + 1]&.id
        Pusher.trigger('answer-channel', 'round-finish', {
          nextRound: next_round_id,
          game: @round.game.id
        })
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
