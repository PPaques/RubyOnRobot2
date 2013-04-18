class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :value
      t.string :last_value

      t.timestamps
    end
  end
end
