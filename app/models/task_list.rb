class TaskList < ActiveRecord::Base
  acts_as_list

  attr_accessible :position, :task_id

  belongs_to :task

  validates :task, :presence => true
end
