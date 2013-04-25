class RenameAddressToAdressInRegisters < ActiveRecord::Migration
  def change
    rename_column :registers, :address, :adress
  end
end
