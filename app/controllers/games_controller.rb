class GamesController < ApplicationController
  def show
    @game = Game.find_by(code: params[:id])
  end

  def invite
    @user = User.new
  end
end
