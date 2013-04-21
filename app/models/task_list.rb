class TaskList < ActiveRecord::Base
  acts_as_list

  attr_accessible :position, :operation_id

  belongs_to :operation

  validates :operation, :presence => true
end
