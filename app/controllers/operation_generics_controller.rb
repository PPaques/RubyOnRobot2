class OperationGenericsController < ApplicationController
  # GET /operation_generics
  # GET /operation_generics.json
  def index
    @operation_generics = OperationGeneric.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operation_generics }
    end
  end

  # GET /operation_generics/1
  # GET /operation_generics/1.json
  def show
    @operation_generic = OperationGeneric.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operation_generic }
    end
  end

  # GET /operation_generics/new
  # GET /operation_generics/new.json
  def new
    @operation_generic = OperationGeneric.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operation_generic }
    end
  end

  # GET /operation_generics/1/edit
  def edit
    @operation_generic = OperationGeneric.find(params[:id])
  end

  # POST /operation_generics
  # POST /operation_generics.json
  def create
    @operation_generic = OperationGeneric.new(params[:operation_generic])
    @operation_generic.robot = Robot.first

    respond_to do |format|
      if @operation_generic.save
        format.html { redirect_to @operation_generic, notice: 'Operation generic was successfully created.' }
        format.json { render json: @operation_generic, status: :created, location: @operation_generic }
      else
        format.html { render action: "new" }
        format.json { render json: @operation_generic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /operation_generics/1
  # PUT /operation_generics/1.json
  def update
    @operation_generic = OperationGeneric.find(params[:id])

    respond_to do |format|
      if @operation_generic.update_attributes(params[:operation_generic])
        format.html { redirect_to @operation_generic, notice: 'Operation generic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @operation_generic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operation_generics/1
  # DELETE /operation_generics/1.json
  def destroy
    @operation_generic = OperationGeneric.find(params[:id])
    @operation_generic.destroy

    respond_to do |format|
      format.html { redirect_to operation_generics_url }
      format.json { head :no_content }
    end
  end
end
