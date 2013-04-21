class RenameTaskIdToOperationIdInTaskList < ActiveRecord::Migration
  def change
    rename_column :task_lists, :task_id, :operation_id 
  end
end
