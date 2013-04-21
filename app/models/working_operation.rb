class WorkingOperation < ActiveRecord::Base
  acts_as_list

  attr_accessible :robot, :operation, :position, :run_until, :started_at, :status
  STATUSES = ['IDLE', 'CURRENT', 'FAIL', 'SUCCESS']

  belongs_to :robot
  belongs_to :operation

  validates :robot, :operation, :status, :presence => true
  validates_inclusion_of :status, :in => STATUSES

  default_scope order(:position)
  
  def idle?
    if status == 'IDLE'
      true
    else
      false
    end
  end

  def current?
    if status == 'CURRENT'
      true
    else
      false
    end
  end

  def fail?
   if status == 'FAIL'
      true
    else
      false
    end
  end

  def success?
    if status == 'SUCCESS'
      true
    else
      false
    end
  end
end