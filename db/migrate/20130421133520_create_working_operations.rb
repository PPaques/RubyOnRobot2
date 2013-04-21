class CreateWorkingOperations < ActiveRecord::Migration
  def change
    create_table :working_operations do |t|
      t.integer :robot_id
      t.datetime :run_until
      t.datetime :started_at
      t.integer :operation_id
      t.string :status
      t.integer :position

      t.timestamps
    end
  end
end
