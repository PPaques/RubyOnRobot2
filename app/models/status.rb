class Status < ActiveRecord::Base
  attr_accessible :robot, :name, :description

  belongs_to :robot
  has_many :gpios,      :foreign_key => 'status_id', :class_name => "StatusGpio"
  has_many :registers,  :foreign_key => 'status_id', :class_name => "StatusRegister"

  validates :robot, :name, :description, :presence => true
end
