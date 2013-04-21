class Robot < ActiveRecord::Base
  attr_accessible :name, :fpga_adress

  has_many :registers,          :inverse_of => :robot
  has_many :gpios,              :inverse_of => :robot
  has_many :statuses,           :inverse_of => :robot
  has_many :tasks,              :inverse_of => :robot
  has_many :operations,         :inverse_of => :robot
  has_many :working_operations, :inverse_of => :robot

  validates :name,:fpga_adress, :presence => true

end
