class RenameTasksToOperations < ActiveRecord::Migration
  def change
    rename_table :tasks, :operations  
  end 
end
