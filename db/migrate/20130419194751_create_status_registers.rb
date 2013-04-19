class CreateStatusRegisters < ActiveRecord::Migration
  def change
    create_table :status_registers do |t|
      t.integer :register_id
      t.string :value

      t.timestamps
    end
  end
end
