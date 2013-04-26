class Perturbation < ActiveRecord::Base
  attr_accessible :description, :name, :operation_id, :robot_id, :status_id

  belongs_to :robot
  belongs_to :status,    :class_name => 'Status'
  belongs_to :operation, :class_name => 'Operation'

  validates :robot, :name, :description, :operation, :status, :presence => true
  validates :name, :uniqueness => true


  def is_active
    if status.is_reached?
      true
    else
      false
    end
  end

end
