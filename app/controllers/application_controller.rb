require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :index
    end

    post '/teams' do
      @team = Team.new(params[:team])
      params[:team][:superheroes].each do |hero|
        Superhero.new(hero)
      end

      @superheroes = Superhero.all
      erb :team
    end


end
