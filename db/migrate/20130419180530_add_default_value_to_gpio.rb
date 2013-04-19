class AddDefaultValueToGpio < ActiveRecord::Migration
  def change
    add_column :gpios, :default_value, :boolean
    add_column :gpios, :value, :boolean
  end
end
