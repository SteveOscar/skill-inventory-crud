require_relative '../test_helper'

class UserDeletesTask < FeatureTest

  def test_task_is_created_with_valid_attributes
    TaskManager.create({ title: "traffic spy is scary",
                         description: "jk"})
    # As a guest
    # When I visit the task list
    visit('/tasks')
    # And I click the delete button
    click_button('Delete')
    # Then I should be redirected to my empty task list
    assert_equal '/tasks', current_path
    # And I should see my new task
    refute page.has_content?("traffic spy")
  end
end
