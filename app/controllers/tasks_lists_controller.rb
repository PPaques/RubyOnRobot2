class TasksListsController < ApplicationController
  # POST /task_lists
  # POST /task_lists.json
  def create
    @task_list = TasksList.new(params[:tasks_list])

    respond_to do |format|
      if @task_list.save
        format.html { redirect_to request.referer, notice: 'Operation was sucessfully added.' }
        format.json { render json: @task_list, status: :created, location: @task_list }
      else
        format.html { redirect_to request.referer }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_lists/1
  # DELETE /task_lists/1.json
  def destroy
    @task_list = TasksList.find(params[:id])
    @task_list.destroy

    respond_to do |format|
      format.html { request.referer tasks_url }
      format.json { head :no_content }
    end
  end

  def sort
    params[:tasks_list].each_with_index do |id,index|
      TasksList.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
