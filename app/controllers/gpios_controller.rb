class GpiosController < ApplicationController
  # GET /gpios
  # GET /gpios.json
  def index
    @gpios = Gpio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gpios }
    end
  end

  # GET /gpios/1
  # GET /gpios/1.json
  def show
    @gpio = Gpio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gpio }
    end
  end

  # GET /gpios/new
  # GET /gpios/new.json
  def new
    @gpio = Gpio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gpio }
    end
  end

  # GET /gpios/1/edit
  def edit
    @gpio = Gpio.find(params[:id])
  end

  # POST /gpios
  # POST /gpios.json
  def create
    @gpio = Gpio.new(params[:gpio])
    @gpio.robot = Robot.first

    respond_to do |format|
      if @gpio.save
        format.html { redirect_to @gpio, notice: 'Gpio was successfully created.' }
        format.json { render json: @gpio, status: :created, location: @gpio }
      else
        format.html { render action: "new" }
        format.json { render json: @gpio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gpios/1
  # PUT /gpios/1.json
  def update
    @gpio = Gpio.find(params[:id])

    respond_to do |format|
      if @gpio.update_attributes(params[:gpio])
        format.html { redirect_to @gpio, notice: 'Gpio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gpio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpios/1
  # DELETE /gpios/1.json
  def destroy
    @gpio = Gpio.find(params[:id])
    @gpio.destroy

    respond_to do |format|
      format.html { redirect_to gpios_url }
      format.json { head :no_content }
    end
  end
end
