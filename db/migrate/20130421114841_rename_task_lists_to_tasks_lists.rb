class RenameTaskListsToTasksLists < ActiveRecord::Migration
  def change
    rename_table :task_lists, :tasks_lists  
  end 
end
