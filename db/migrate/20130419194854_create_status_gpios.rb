class CreateStatusGpios < ActiveRecord::Migration
  def change
    create_table :status_gpios do |t|
      t.integer :gpio_id
      t.boolean :value

      t.timestamps
    end
  end
end
