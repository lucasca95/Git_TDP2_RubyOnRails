class DeviceVersionsController < ApplicationController
  before_action :set_device, only: [:destroy]
  def create
    @dv = DeviceVersion.new(device_params)

    respond_to do |format|
      if @dv.save
        format.html { redirect_to @dv.device, notice: 'Force was successfully created.' }
        format.json { render :show, status: :created, location: @dv.device }
      else
        format.html { redirect_to @dv.device, notice: 'Error.' }
        format.json { render json: @dv.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @dv.destroy
    respond_to do |format|
      format.html { redirect_to @dv.device, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
      # Use callbacks to share common setup or constraints between actions.
      def set_device
        @dv = DeviceVersion.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def device_params
        params.require(:device_version).permit(:device_id, :version_id, :state)
      end
end
