class IdeaboxAPI < Sinatra::Base
    get '/' do
        Idea.all.to_json
    end

    after do
        ActiveRecord::Base.clear_active_connections!
      end
end
