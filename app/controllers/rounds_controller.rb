class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @answer = Answer.new
    @user = User.find(session[:user_id])
  end
end
