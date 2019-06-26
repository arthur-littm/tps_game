class UsersController < ApplicationController

  def new
  end

  def create
    @game = Game.find_by_code(params[:game_code])
    if @game.present?
      @user = User.new(name: params[:name], game: @game)
      if @user.save
        redirect_to game_path(@game.code)
      else
        flash[:error] = 'User has no name'
        render :new
      end
    else
      flash[:error] = 'Game not found'
      render :new
    end
  end
end
