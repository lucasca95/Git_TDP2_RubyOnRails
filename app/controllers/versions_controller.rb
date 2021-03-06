class VersionsController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_version, only: [:show, :edit, :update, :destroy]
  layout false , only: [:create]
  # GET /versions
  # GET /versions.json
  def index
    @versions = Version.all
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
  end

  # GET /versions/new
  def new
    @version = Version.new
  end

  # GET /versions/1/edit
  def edit
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = Version.new(params.require(:version).permit(:changelog))
    @program = Program.where(name:params[:version][:program_name]).first
    if !@program.nil? 
      @version.program_id = @program.id
      if @version.number == nil
        @version.number = Version.nextVersion(@version.program_id)
      end 
      @result = @version.save
    else
      @result = false
    end
    
  end

  # PATCH/PUT /versions/1
  # PATCH/PUT /versions/1.json
  def update
    respond_to do |format|
      if @version.update(version_params)
        format.html { redirect_to @version, notice: 'Version was successfully updated.' }
        format.json { render :show, status: :ok, location: @version }
      else
        format.html { render :edit }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @version.destroy
    respond_to do |format|
      format.html { redirect_to versions_url, notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version
      @version = Version.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_params
      params.require(:version).permit(:number, :changelog, :program_id)
    end

end
