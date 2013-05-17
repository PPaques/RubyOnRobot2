class WorkingOperation < ActiveRecord::Base
  acts_as_list

  attr_accessible :robot, :operation, :position, :run_until, :started_at, :status, :closed_at
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
      self.started_at = Time.now
      self.status = "CURRENT"
      self.run_until = Time.now + 2.years
      self.run_until = Time.now + operation.time_max unless operation.time_max == 0
      self.save

      operation.perform


    rescue
      self.failed
    end
  end

  def state_reached?
    self.operation.state_reached?
  end

  def has_operation_error?
    self.operation.has_operation_error?
  end

  def operation_error
    self.operation.operation_error
  end

  def timeout?
    if Time.now > self.run_until
      true
    else
      false
    end
  end

  def failed
    self.status = "FAIL"
    self.closed_at = Time.now
    self.save
  end

  def finished
    self.status = "SUCCESS"
    self.closed_at = Time.now
    self.save
  end
end