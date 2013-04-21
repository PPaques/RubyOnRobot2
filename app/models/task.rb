class Task < ActiveRecord::Base
  attr_accessible :robot, :name, :description

  has_many   :tasks_lists, :inverse_of => :task
  has_many   :operations,  :through    => :tasks_lists
  belongs_to :robot

  validates :robot, :name, :description, :presence => true

  def enqueue
    tasks_lists.each do |list|
      list.operation.enqueue
    end
  end
end
