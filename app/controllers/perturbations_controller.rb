class PerturbationsController < ApplicationController
  # GET /perturbations
  # GET /perturbations.json
  def index
    @perturbations = Perturbation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @perturbations }
    end
  end

  # GET /perturbations/1
  # GET /perturbations/1.json
  def show
    @perturbation = Perturbation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @perturbation }
    end
  end

  # GET /perturbations/new
  # GET /perturbations/new.json
  def new
    @perturbation = Perturbation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @perturbation }
    end
  end

  # GET /perturbations/1/edit
  def edit
    @perturbation = Perturbation.find(params[:id])
  end

  # POST /perturbations
  # POST /perturbations.json
  def create
    @perturbation = Perturbation.new(params[:perturbation])
    @perturbation.robot = Robot.first

    respond_to do |format|
      if @perturbation.save
        format.html { redirect_to @perturbation, notice: 'Perturbation was successfully created.' }
        format.json { render json: @perturbation, status: :created, location: @perturbation }
      else
        format.html { render action: "new" }
        format.json { render json: @perturbation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /perturbations/1
  # PUT /perturbations/1.json
  def update
    @perturbation = Perturbation.find(params[:id])

    respond_to do |format|
      if @perturbation.update_attributes(params[:perturbation])
        format.html { redirect_to @perturbation, notice: 'Perturbation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perturbation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perturbations/1
  # DELETE /perturbations/1.json
  def destroy
    @perturbation = Perturbation.find(params[:id])
    @perturbation.destroy

    respond_to do |format|
      format.html { redirect_to perturbations_url }
      format.json { head :no_content }
    end
  end
end
