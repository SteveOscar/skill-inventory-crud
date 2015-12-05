require_relative '../test_helper'

class UserEditsSkill < FeatureTest

  def test_skill_is_created_with_valid_attributes
    SkillInventory.create({ name: "Guitar",
                         status: "Pretty damn good at it"})
    id = SkillInventory.all.last.id
    # As a guest
    # When I visit the edit skill form
    visit("/skills/#{id}/edit")
    # And I fill in a name
    fill_in('skill[name]', :with => 'Singing')
    # And I fill in a skill
    fill_in('skill[status]', :with => 'Not very good')
    # And I click the submit button
    click_button('submit')
    # Then I should be redirected to my edited skill
    assert_equal "/skills/#{id}", current_path
    # And I should see my new skill
    within(".card-content") do
      assert page.has_content?("Singing")
      assert page.has_content?("Not very good")
    end
  end
end
