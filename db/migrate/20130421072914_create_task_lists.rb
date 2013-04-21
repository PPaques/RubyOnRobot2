class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.integer :task_id
      t.integer :position

      t.timestamps
    end
  end
end
