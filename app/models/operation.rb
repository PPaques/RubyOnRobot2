class Operation < ActiveRecord::Base
  attr_accessible :robot, :name, :description, :operation_error_id, :state_asked_id, :state_to_send_id, :operation_generic_id, :time_max

  belongs_to :operation_error,  :class_name => 'Operation', :foreign_key => 'operation_error_id'
  belongs_to :robot
  belongs_to :state_to_send,    :class_name => 'Status'
  belongs_to :state_asked,      :class_name => 'Status'
  belongs_to :operation_generic

  has_many :tasks_lists,        :inverse_of => :operation,    :dependent => :delete_all
  has_many :working_operations, :inverse_of => :operation,    :dependent => :delete_all
  has_many :tasks,              :through    => :tasks_lists,  :dependent => :delete_all

  validates :robot, :name, :description, :state_asked_id, :state_to_send_id, :operation_generic_id, :time_max, :presence => true
  validates :name, :uniqueness => true


  def enqueue
    WorkingOperation.create(:robot => robot, :operation => self, :status => 'IDLE')
  end

  def has_operation_error?
    if operation_error.nil?
      false
    else
      true
    end
  end

  def perform
    state_to_send.send_to_robot
    operation_generic.perform
  end

  def state_reached?
    state_asked.is_reached?
  end
end
