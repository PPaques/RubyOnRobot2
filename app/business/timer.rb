class Timer
  ##
  # This class handle all the command that are +time+ linked.
  #
  # This is the entry point of the timer. All action are launch from here
  # For understanding what's hapenned, I've put a speacial +logger+.
  # Look in log/timer.log

  # This is the 
  def entry_point
    TIMER.log "Enter in timer regulation".red

    # -----> read all register from the robot
    # do i need a simulator ? => easy to make, stop looking at run_until
    #    look at a db schema that are update when you change the register state

    # robot.actif?

    # We verify if there is a operation or we lauch the operation
    # working_operation.current.perform unless working_operation.current.started?


    # We verify if the operation is finished    
    #if Working_operation.state_reached?
      #working_operation.performed
      #working_operation.current.perform
    #else
      #if working_operation.time_reached?
        # if time is overflowed, just fail system
        #working_operation.failed # safe operation is normally pushed on the top of the queue
        #working_operation.current.perform
      #end
    #end
  end
end