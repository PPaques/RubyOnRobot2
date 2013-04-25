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

  def perform
    begin
      operation.state_to_send.send_to_robot 
  
      started_at = Time.now
      status = "CURRENT"
      run_until = Time.now + operation.time_max.to_f/1000 if operation.time_max > 0
      run_until = Time.now + 2.years
      self.save
    rescue
      self.failed
    end
  end

  def state_reached?
    operation.state_asked.is_reached?
  end

  def timeout?
    if Time.now < run_until
      true
    else 
      false
    end 
  end

  def failed
    status = "FAIL"
    self.save
  end

  def finished
    status = "SUCCESS"
    self.save
  end
end