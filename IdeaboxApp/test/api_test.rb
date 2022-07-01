require './test/test_helper'
require 'rack/test'
require 'sinatra/base'
require 'api'

class APITest < MiniTest::Unit::TestCase
    include Rack::Test::Methods
    include WithRollback

    def app
        IdeaboxAPI
    end

    def test_hello_world
        temporarily do
          Idea.create(:description => 'A wonderful idea!')
          get '/'
          expected = "[{\"id\":1,\"description\":\"A wonderful idea!\"}]"
          assert_equal expected, last_response.body
        end
      end
   
end