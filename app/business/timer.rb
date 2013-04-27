class Timer
  ##
  # This class handle all the command that are +time+ linked.
  #
  # This is the entry point of the timer. All action are launch from here
  # For understanding what's hapenned, I've put a speacial +logger+.
  # Look in log/timer.log

  # This is the entry point of all regulation
  def self.execute
    @robot = Robot.first
    @robot.read_registers


    if @robot.is_actif?

      if @robot.has_perturbation?
        @robot.active_perturbation.operation.perform
      else
        if @robot.has_current_operation? or @robot.has_next_operation?

          @robot.next_operation.perform if (!@robot.has_current_operation? and @robot.has_next_operation?)

          if @robot.current_operation.state_reached?
            @robot.current_operation.finished
            @robot.next_operation.perform if @robot.next_operation
          else
            if @robot.current_operation.timeout?
                if @robot.current_operation.has_operation_error?
                  WorkingOperation.new(:robot => @robot, :operation => @robot.current_operation.operation_error, :status => 'IDLE').insert_at(@robot.current_operation.position+1)
                end
              @robot.current_operation.failed

              @robot.next_operation.perform if @robot.next_operation
            end
          end
        end
      end
    end
  end
end