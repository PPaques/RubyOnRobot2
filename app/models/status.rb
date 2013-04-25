class Status < ActiveRecord::Base
  attr_accessible :robot, :name, :description, :gpios_attributes, :registers_attributes

  belongs_to  :robot
  has_many    :gpios,      :foreign_key => 'status_id', :class_name => "StatusGpio"
  has_many    :registers,  :foreign_key => 'status_id', :class_name => "StatusRegister"
  has_many    :tasks

  accepts_nested_attributes_for :gpios,     :allow_destroy => true
  accepts_nested_attributes_for :registers, :allow_destroy => true

  validates :robot, :name, :description, :presence => true
  validates :name, :uniqueness => true

  def send_to_robot
    registers.each { |register| register.set_value }
    gpios.each { |gpio| gpio.set_value}
  end 

  def is_reached?
    reached = true

    registers.each do |register|
      reached = false if register.is_reached?
    end

    gpios.each do |gpio|
      reached = false if gpio.is_reached?
    end

    reached
  end
end
