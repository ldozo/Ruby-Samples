$:.unshift File.expand_path("./../../lib", __FILE__)

require './config/environment'
require 'minitest/autorun'

ENV['RACK_ENV'] = 'test'

module WithRollback
    def temporarily(&block)
        ActiveRecord::Base.connection.transaction do
            block.call
            raise ActiveRecord::Rollback
        end
    end
end