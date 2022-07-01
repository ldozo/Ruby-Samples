require 'sinatra'
require 'yaml/store'

Choices = {
    'HAM' => 'Hamburger',
    'PIZ' => 'Pizza',
    'CUR' => 'Curry',
    'NOO' => 'Noodles',
  }

get '/' do
    @title = 'Welcome to ruby world, the one missing'
    erb :index
end

post '/cast' do
    @title = 'Thanks for being here'
    @vote = params['vote']
    @store = YAML::Store.new 'votes.yml'
    @store.transaction do
        @store['votes'] ||= {}
        @store['votes'][@vote] ||=0
        @store['votes'][@vote] += 1
    end
    erb :cast
end

get '/results' do
    @title = 'Results so for:'
    @store = YAML::Store.new 'votes.yml'
    @votes = @store.transaction { @store['votes']}
    erb :results
end