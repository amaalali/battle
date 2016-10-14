require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/player_attack'

class Battle < Sinatra::Base

enable :sessions


  before do
    @game = Game.instance
  end

  get '/' do
     erb :index
  end

  post '/names' do
   player_1 = Player.new(params[:player_1_name])
   if params[:Computer]
     player_2 = Player.new('Computer')
   else
     player_2 = Player.new(params[:player_2_name])
   end
   @game = Game.create(player_1, player_2)
   redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  post '/attack' do
    Attack.run(@game.current_opponent)
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack_summary'
    end
  end

  get '/attack' do
    Attack.run(@game.current_opponent)
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack_summary'
    end
  end

  get '/attack_summary' do
    erb :attack_summary
  end

  post '/switch_turns' do
    @game.switch_turns
    if @game.computer?
      redirect '/attack'
    else
      redirect('/play')
    end
  end


  get '/game_over' do
    erb :game_over
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
