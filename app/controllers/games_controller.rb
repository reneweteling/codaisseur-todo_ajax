# app/controllers/games_controller.rb
class GamesController < ApplicationController

  def show
    session[:score] = nil
  end

  def create
    @score = session[:score]
    @score ||= {'player' => 0, 'computer' => 0}

    @hand_winner = 'No one'

    @computer_hand = get_random_play
    @player_hand = params[:commit]

    case @computer_hand
      when 'rock'
        @hand_winner = 'Player'   if @player_hand == 'paper' 
        @hand_winner = 'Computer' if @player_hand == 'scissors' 
      when 'paper'
        @hand_winner = 'Player'   if @player_hand == 'scissors' 
        @hand_winner = 'Computer' if @player_hand == 'rock' 
      when 'scissors'
        @hand_winner = 'Player'   if @player_hand == 'rock' 
        @hand_winner = 'Computer' if @player_hand == 'paper' 
    end

    @score['computer']+=1 if @hand_winner == 'Computer'
    @score['player']+=1 if @hand_winner == 'Player'

    

    # save it back to the session again
    session[:score] = @score
  end

  private

  def get_random_play
    ['rock', 'paper', 'scissors'].sample
  end

end
