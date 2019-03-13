require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative './models/game'

get '/r/:move1/:move2' do
	game = Game.new(params)
	@result = game.result()
	erb(:result)
end

get '/r/:move1/' do
	game = Game.new(params)
	@result = game.result()
	erb(:result)
end

get '/:move1/choosesecond' do
	@move1 = params[:move1]
	erb(:choosesecond)
end

get '/' do
	erb(:home)
end