class WorkingOperationsController < ApplicationController
  # GET /working_operations
  # GET /working_operations.json
  def index
    @working_operations = WorkingOperation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @working_operations }
    end
  end

  # GET /working_operations/1
  # GET /working_operations/1.json
  def show
    @working_operation = WorkingOperation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @working_operation }
    end
  end

  # GET /working_operations/new
  # GET /working_operations/new.json
  def new
    @working_operation = WorkingOperation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @working_operation }
    end
  end

  # GET /working_operations/1/edit
  def edit
    @working_operation = WorkingOperation.find(params[:id])
  end

  # POST /working_operations
  # POST /working_operations.json
  def create
    @working_operation = WorkingOperation.new(params[:working_operation])
    @working_operation.robot = Robot.first

    respond_to do |format|
      if @working_operation.save
        format.html { redirect_to @working_operation, notice: 'Working operation was successfully created.' }
        format.json { render json: @working_operation, status: :created, location: @working_operation }
      else
        format.html { render action: "new" }
        format.json { render json: @working_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /working_operations/1
  # PUT /working_operations/1.json
  def update
    @working_operation = WorkingOperation.find(params[:id])

    respond_to do |format|
      if @working_operation.update_attributes(params[:working_operation])
        format.html { redirect_to @working_operation, notice: 'Working operation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @working_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_operations/1
  # DELETE /working_operations/1.json
  def destroy
    @working_operation = WorkingOperation.find(params[:id])
    @working_operation.destroy

    respond_to do |format|
      format.html { redirect_to working_operations_url }
      format.json { head :no_content }
    end
  end

  # GET /clear_working_operations
  def clear
    WorkingOperation.delete_all
    redirect_to working_operations_url
  end
end
