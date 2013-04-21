class TasksList < ActiveRecord::Base
  acts_as_list

  attr_accessible :position, :operation_id, :task_id

  belongs_to :operation
  belongs_to :task

  validates :operation, :task_id, :presence => true

  default_scope order(:position)
end
