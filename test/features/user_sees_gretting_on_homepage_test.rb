require_relative '../test_helper'

class UserSeesGreetingOnHomepage < FeatureTest

  def test_greeting_is_displayed
    #As a guest
    # When I visit the homepage
    visit('/')
    # Then I see "Welcome to Task Manager"
    within('.white-text') do
      assert page.has_content?("SkillSet")
    end
  end
end
