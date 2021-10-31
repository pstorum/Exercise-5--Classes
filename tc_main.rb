# File:  tc_main.rb

require_relative "main"
require "test/unit"
 
class TestParticipants < Test::Unit::TestCase
 
  def test_participant
    assert_equal(0, Participants.new("fake1@example.com\nfake2@example.com\nfake3@example.com").generate_participant_users_from_email_string() )
    assert_equal(0, Participants.new("totallyfake1@example.com\ntotallyfake2@example.com\ntotallyfake3@example.com").generate_participant_users_from_email_string() )
  end
 
end

require_relative "main"
require "test/unit"
 
class DiscussionWorkflow < Test::Unit::TestCase
 
  def test_discussion
    assert_equal(0, LaunchDiscussionWorkflow.new(Discussion, "Host Bob", Participants).run() )
    assert_equal(0, LaunchDiscussionWorkflow.new(Discussion, "Host Bob", Participants).run() )
  end
 
end
