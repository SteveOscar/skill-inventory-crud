require_relative '../test_helper'
require 'pry'

class TaskManagerTest < Minitest::Test
  def test_task_can_be_created
    TaskManager.create({ title: "traffic spy is scary",
                         description: "jk"})
    task = TaskManager.find(1)

    assert_equal "traffic spy is scary", task.title
    assert_equal "jk", task.description
    assert_equal 1, task.id
  end

  def test_it_finds_all_tasks
    tasks = [{ title: "traffic spy is scary", description: "one"},
             { title: "traffic spy is hard", description: "two"},
             { title: "traffic spy is huuuge", description: "three"}]
    tasks.each { |task| TaskManager.create(task)}

    assert_equal 3, TaskManager.all.count
    TaskManager.all.each_with_index do |task, i|
      assert_equal Task, task.class
      assert_equal task.title, tasks[i][:title]
      assert_equal task.description, tasks[i][:description]
    end
  end

  def test_it_can_find_data
    tasks = [{ title: "traffic spy is scary", description: "one"},
             { title: "traffic spy is hard", description: "two"},
             { title: "traffic spy is huuuge", description: "three"}]
    tasks.each { |task| TaskManager.create(task)}
    1.upto(3) do |i|
      task = TaskManager.find(i)
      assert_equal i, task.id
      assert_equal tasks[i-1][:title], task.title
      assert_equal tasks[i-1][:description], task.description
    end
  end

  def test_it_can_update
    tasks = [{ title: "traffic spy is scary", description: "one"},
             { title: "traffic spy is hard", description: "two"},
             { title: "traffic spy is huuuge", description: "three"}]
    tasks.each { |task| TaskManager.create(task)}
    TaskManager.update(2, { title: "what's for lunch", description: "food"})
    task = TaskManager.find(2)
    assert_equal "what's for lunch", task.title
    assert_equal "food", task.description
  end

  def test_it_can_delete_a_task
    tasks = [{ title: "traffic spy is scary", description: "one"},
             { title: "traffic spy is hard", description: "two"},
             { title: "traffic spy is huuuge", description: "three"}]
    tasks.each { |task| TaskManager.create(task)}
    TaskManager.delete(2)
    assert_equal 2, TaskManager.all.count
    TaskManager.delete(1)
    assert_equal 1, TaskManager.all.count
  end
end
