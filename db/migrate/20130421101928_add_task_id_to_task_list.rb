class AddTaskIdToTaskList < ActiveRecord::Migration
  def change
    add_column :task_lists, :task_id, :integer
  end
end
