class Register < ActiveRecord::Base
  attr_accessible :robot, :name, :address, :description, :value, :default_value, :last_value

  belongs_to :robot

  validates :robot, :name, :address, :description, :default_value, :presence => true
end
