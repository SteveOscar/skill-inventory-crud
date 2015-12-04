require_relative '../test_helper'
require 'pry'

class SkillInventoryTest < Minitest::Test
  def create_skills(num)
    num.times do |i|
      SkillInventory.create({ name: "#{i+1} name",
                           status: "#{i+1} status"})
    end
  end

  def test_skill_can_be_created
    create_skills(1)

    skill = SkillInventory.all.last

    assert_equal "1 name", skill.name
    assert_equal "1 status", skill.status
    assert_equal SkillInventory.all.first.id, skill.id
  end

  def test_it_finds_all_skills
    create_skills(3)

    assert_equal 3, SkillInventory.all.count
    SkillInventory.all.each_with_index do |skill, i|
      assert_equal Skill, skill.class
      assert_equal "#{i+1} name", skill.name
      assert_equal "#{i+1} status", skill.status
    end
  end

  def test_it_can_find_data_by_id
    create_skills(3)
    skill = SkillInventory.all.last
    found = SkillInventory.find(skill.id)
    assert_equal found.id, skill.id
  end

  def test_it_can_update
    create_skills(3)
    skill = SkillInventory.all.last
    SkillInventory.update(skill.id, { name: "what's for lunch", status: "food"})
    skill = SkillInventory.find(skill.id)
    assert_equal "what's for lunch", skill.name
    assert_equal "food", skill.status
  end

  def test_it_can_delete_a_skill
    create_skills(3)
    skill = SkillInventory.all.last
    SkillInventory.delete(skill.id)
    assert_equal 2, SkillInventory.all.count
    skill = SkillInventory.all.last
    SkillInventory.delete(skill.id)
    assert_equal 1, SkillInventory.all.count
  end
end
