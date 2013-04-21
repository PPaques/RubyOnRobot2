class Operation < ActiveRecord::Base
  attr_accessible :robot, :name, :description, :operation_error_id, :state_asked_id, :state_to_send_id, :time_max

  belongs_to :operation_error,  :class_name => 'Operation', :foreign_key => 'operation_error_id'
  belongs_to :robot
  belongs_to :state_to_send,    :class_name => 'Status'
  belongs_to :state_asked,      :class_name => 'Status'
  has_many :task_lists,         :inverse_of => :operation

  validates :robot, :name, :description, :state_asked_id, :state_to_send_id, :time_max, :presence => true


end
