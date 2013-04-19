class Register < ActiveRecord::Base
  attr_accessible :robot, :name, :address, :description, :value, :default_value, :last_value

  has_many   :status_register

  belongs_to :robot

  validates :robot, :name, :address, :description, :default_value, :presence => true
  validates :name, :uniqueness => true
end
