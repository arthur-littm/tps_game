class UsersController < ApplicationController



  def create
    @game = Game.find_by(code: params[:user][:game_code])
    if @game.present?
      @user = User.new(name: params[:user][:name], game: @game)
      if @user.save
        session[:user_id] = @user.id
        Pusher.trigger('game-channel','new-join', {
          user: @user.name
        })
        redirect_to game_path(@game.code)
      else
        flash[:error] = 'User has no name'
        render "games/invite"
      end
    else
      @user = User.new
      flash[:alert] = 'Game not found'
      render "games/invite"
    end
  end
end
