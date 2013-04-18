class CreateGpios < ActiveRecord::Migration
  def change
    create_table :gpios do |t|
      t.string :name
      t.text :description
      t.integer :pin
      t.boolean :direction
      t.integer :robot_id

      t.timestamps
    end
  end
end
