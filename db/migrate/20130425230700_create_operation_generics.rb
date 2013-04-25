class CreateOperationGenerics < ActiveRecord::Migration
  def change
    create_table :operation_generics do |t|
      t.string :name
      t.text :description
      t.string :class_name
      t.string :function_name
      t.text :parameters
      t.integer :robot_id

      t.timestamps
    end
  end
end
