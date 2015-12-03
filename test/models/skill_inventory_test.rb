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

  # def test_it_finds_all_skills
  #   create_skills(3)
  #
  #   assert_equal 3, SkillInventory.all.count
  #   SkillInventory.all.each_with_index do |skill, i|
  #     assert_equal Skill, skill.class
  #     assert_equal "#{i+1} name", skill.name
  #     assert_equal "#{i+1} status", skill.status
  #   end
  # end

  # def test_it_can_find_data
  #   skills = [{ name: "traffic spy is scary", status: "one"},
  #            { name: "traffic spy is hard", status: "two"},
  #            { name: "traffic spy is huuuge", status: "three"}]
  #   skills.each { |skill| SkillInventory.create(skill)}
  #   1.upto(3) do |i|
  #     skill = SkillInventory.find(i)
  #     assert_equal i, skill.id
  #     assert_equal skills[i-1][:name], skill.name
  #     assert_equal skills[i-1][:status], skill.status
  #   end
  # end
  #
  # def test_it_can_update
  #   skills = [{ name: "traffic spy is scary", status: "one"},
  #            { name: "traffic spy is hard", status: "two"},
  #            { name: "traffic spy is huuuge", status: "three"}]
  #   skills.each { |skill| SkillInventory.create(skill)}
  #   SkillInventory.update(2, { name: "what's for lunch", status: "food"})
  #   skill = SkillInventory.find(2)
  #   assert_equal "what's for lunch", skill.name
  #   assert_equal "food", skill.status
  # end
  #
  # def test_it_can_delete_a_skill
  #   skills = [{ name: "traffic spy is scary", status: "one"},
  #            { name: "traffic spy is hard", status: "two"},
  #            { name: "traffic spy is huuuge", status: "three"}]
  #   skills.each { |skill| SkillInventory.create(skill)}
  #   SkillInventory.delete(2)
  #   assert_equal 2, SkillInventory.all.count
  #   SkillInventory.delete(1)
  #   assert_equal 1, SkillInventory.all.count
  # end
end
