class Register < ActiveRecord::Base
  attr_accessible :robot, :name, :address, :description, :value, :default_value, :last_value

  belongs_to :robot
  belongs_to :status_register

  validates :robot, :name, :address, :description, :default_value, :presence => true
end
