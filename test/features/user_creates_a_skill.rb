require_relative '../test_helper'

class UserCreatesSkill < FeatureTest

  def test_Skill_is_created_with_valid_attributes
    #As a guest
    # When I visit the new Skill form
    visit('/skills/new')
    # And I fill in a title
    fill_in('Skill[title]', :with => 'Exercise')
    # And I fill in a Skill
    fill_in('Skill[description]', :with => 'Pump the iron')
    # And I click the submit button
    click_button('submit')
    # Then I should be redirected to my Skill list
    assert_equal '/skills', current_path
  end
end

#
