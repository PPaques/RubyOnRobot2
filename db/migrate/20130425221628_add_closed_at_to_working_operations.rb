class AddClosedAtToWorkingOperations < ActiveRecord::Migration
  def change
    add_column :working_operations, :closed_at, :datetime
  end
end
