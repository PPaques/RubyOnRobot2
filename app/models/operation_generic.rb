class OperationGeneric < ActiveRecord::Base
  attr_accessible :class_name, :description, :function_name, :name, :parameters, :robot

  belongs_to :robot
  has_many :operations, :dependent => :delete_all

  validates :robot, :name, :description, :function_name, :class_name, :presence => true
  validates :name, :uniqueness => true

  def perform
    action_class = Kernel.const_get(class_name).new
    action_class.send(function_name, eval(parameters))
  end
end
