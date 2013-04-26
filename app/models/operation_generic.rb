class OperationGeneric < ActiveRecord::Base
  attr_accessible :class_name, :description, :function_name, :name, :parameters, :robot

  belongs_to :robot
  has_many :operations, :dependent => :delete_all

  validates :robot, :name, :description, :function_name, :class_name, :presence => true
  validates :name, :uniqueness => true

  def perform
    if !class_name.blank? and !function_name.blank?
      # incoming params converting to hash

      parameters_to_sent = {}

      paramaters_to_sent = eval "{#{parameters}}" unless parameters.blank?

      action_class = Kernel.const_get(class_name).new
      action_class.send(function_name, paramaters_to_sent)
    end
  end
end
