require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    SkillInventory.create({ name: "1 name",
                         status: "1 status"})
    skill = SkillInventory.all.last
    assert_equal "1 name", skill.name
    assert_equal "1 status", skill.status
  end
end
