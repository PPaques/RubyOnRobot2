class WorkingOperation < ActiveRecord::Base
  acts_as_list

  attr_accessible :robot, :operation, :position, :run_until, :started_at, :status

  belongs_to :robot
  belongs_to :operation

  validates :robot, :operation, :status, :presence => true
end
