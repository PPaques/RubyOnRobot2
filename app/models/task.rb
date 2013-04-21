class Task < ActiveRecord::Base
  attr_accessible :robot, :name, :description

  has_many   :tasks_lists, :inverse_of => :task
  belongs_to :robot

  validates :robot, :name, :description, :presence => true
end
