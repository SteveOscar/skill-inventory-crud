require_relative '../test_helper'

class UserEditsTask < FeatureTest

  def test_task_is_created_with_valid_attributes
    TaskManager.create({ title: "traffic spy is scary",
                         description: "jk"})
    # As a guest
    # When I visit the edit task form
    visit('/tasks/1/edit')
    # And I fill in a title
    fill_in('task[title]', :with => 'Exercise')
    # And I fill in a task
    fill_in('task[description]', :with => 'Pump the iron')
    # And I click the submit button
    click_button('submit')
    # Then I should be redirected to my edited task
    assert_equal '/tasks/1', current_path
    # And I should see my new task
    within(".show-note") do
      assert page.has_content?("Exercise")
      assert page.has_content?("Pump the iron")
    end
  end
end
