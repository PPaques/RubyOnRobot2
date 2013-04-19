class Status < ActiveRecord::Base
  attr_accessible :robot, :name, :description, :gpios_attributes, :registers_attributes

  belongs_to  :robot
  has_many    :gpios,      :foreign_key => 'status_id', :class_name => "StatusGpio"
  has_many    :registers,  :foreign_key => 'status_id', :class_name => "StatusRegister"

  accepts_nested_attributes_for :gpios,     :allow_destroy => true
  accepts_nested_attributes_for :registers, :allow_destroy => true

  validates :robot, :name, :description, :presence => true
  validates :name, :uniqueness => true


end
