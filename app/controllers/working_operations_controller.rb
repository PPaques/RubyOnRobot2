class WorkingOperationsController < ApplicationController
  # GET /working_operations
  # GET /working_operations.json
  def index
    @working_operations = WorkingOperation.includes(:operation).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @working_operations }
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

  def sort
    params[:working_operation].each_with_index do |id,index|
      WorkingOperation.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
