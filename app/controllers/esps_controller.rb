class EspsController < ApplicationController
  before_action :set_esp, only: [:show, :edit, :update, :destroy]

  # GET /esps
  # GET /esps.json
  def index
    @esps = Esp.all
  end

  # GET /esps/1
  # GET /esps/1.json
  def show
  end

  # GET /esps/new
  def new
    @esp = Esp.new
  end

  # GET /esps/1/edit
  def edit
  end

  # POST /esps
  # POST /esps.json
  def create
    @esp = Esp.new(esp_params)

    respond_to do |format|
      if @esp.save
        format.html { redirect_to @esp, notice: 'Esp was successfully created.' }
        format.json { render :show, status: :created, location: @esp }
      else
        format.html { render :new }
        format.json { render json: @esp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /esps/1
  # PATCH/PUT /esps/1.json
  def update
    respond_to do |format|
      if @esp.update(esp_params)
        format.html { redirect_to @esp, notice: 'Esp was successfully updated.' }
        format.json { render :show, status: :ok, location: @esp }
      else
        format.html { render :edit }
        format.json { render json: @esp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esps/1
  # DELETE /esps/1.json
  def destroy
    @esp.destroy
    respond_to do |format|
      format.html { redirect_to esps_url, notice: 'Esp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def version 
  
  end

  def sendData
    @data = Esp.where(mac:params[:mac]).first.getLastVersion(params[:page].to_i,params[:size].to_i)
  end
  def updated
  
  end

  def error
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esp
      @esp = Esp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def esp_params
      params.require(:esp).permit(:mac, :version)
    end
end
