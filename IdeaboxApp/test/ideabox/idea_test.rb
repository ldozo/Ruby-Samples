require './test/test_helper'

class IdeaTest < MiniTest::Unit::TestCase
    include WithRollback
    
    def test_it_exists
        temporarily do
            idea = Idea.create(:description => 'A wonderful idea!.')
            assert_equal 1, Idea.count
            raise ActiveRecord::Rollback
        end
        assert_equal 0, Idea.count
    end
end
