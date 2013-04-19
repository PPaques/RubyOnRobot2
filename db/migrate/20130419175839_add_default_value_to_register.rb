class AddDefaultValueToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :default_value, :string
  end
end
