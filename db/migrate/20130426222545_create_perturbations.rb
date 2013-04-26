class CreatePerturbations < ActiveRecord::Migration
  def change
    create_table :perturbations do |t|
      t.string :name
      t.text :description
      t.integer :status_id
      t.integer :operation_id
      t.integer :robot_id

      t.timestamps
    end
  end
end
