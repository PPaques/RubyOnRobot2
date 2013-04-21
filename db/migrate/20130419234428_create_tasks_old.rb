class CreateTasksOld < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :robot_id
      t.string :name
      t.text :description
      t.integer :time_max
      t.integer :state_to_send_id
      t.integer :state_asked_id
      t.integer :operation_error_id

      t.timestamps
    end
  end
end
