# Exercise 6
class Participants

  def initialize(participants_email_string)
    @participants_email_string = participants_email_string
    @participants = []
  end

  def generate_participant_users_from_email_string
    return if @participants_email_string.empty?
    @participants_email_string.split.uniq.map do |email_address|
      User.create(email: email_address.downcase, password: Devise.friendly_token)
    end
  end
end

class LaunchDiscussionWorkflow

  def initialize(discussion, host, participants)
    @discussion = discussion
    @host = host
    @participants = participants
  end

  # Expects @participants array to be filled with User objects
  def run
    return unless valid?
    run_callbacks(:create) do
      ActiveRecord::Base.transaction do
        discussion.save!
        create_discussion_roles!
        @successful = true
      end
    end
  end
  # ...
end
