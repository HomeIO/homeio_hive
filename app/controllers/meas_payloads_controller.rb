class MeasPayloadsController < ApplicationController
  before_action :set_meas_payload, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:index, :show, :announce]

  def announce
    h = {}
    h[:site] = meas_payload_params[:site]
    h[:name] = meas_payload_params[:name]

    obj = MeasPayload.where(h).first
    obj = MeasPayload.new(h) if obj.nil?
    obj.value = meas_payload_params[:value]
    obj.save!

    @meas_payload = obj
    show
  end

  # GET /meas_payloads
  # GET /meas_payloads.json
  def index
    @meas_payloads = MeasPayload.all
  end

  # GET /meas_payloads/1
  # GET /meas_payloads/1.json
  def show
  end

  # GET /meas_payloads/new
  def new
    @meas_payload = MeasPayload.new
  end

  # GET /meas_payloads/1/edit
  #def edit
  #end

  # POST /meas_payloads
  # POST /meas_payloads.json
  def create
    @meas_payload = MeasPayload.new(meas_payload_params)

    respond_to do |format|
      if @meas_payload.save
        format.html { redirect_to @meas_payload, notice: 'Meas payload was successfully created.' }
        format.json { render :show, status: :created, location: @meas_payload }
      else
        format.html { render :new }
        format.json { render json: @meas_payload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meas_payloads/1
  # PATCH/PUT /meas_payloads/1.json
  #def update
  #  respond_to do |format|
  #    if @meas_payload.update(meas_payload_params)
  #      format.html { redirect_to @meas_payload, notice: 'Meas payload was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @meas_payload }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @meas_payload.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /meas_payloads/1
  # DELETE /meas_payloads/1.json
  #def destroy
  #  @meas_payload.destroy
  #  respond_to do |format|
  #    format.html { redirect_to meas_payloads_url, notice: 'Meas payload was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meas_payload
      @meas_payload = MeasPayload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meas_payload_params
      params.require(:meas_payload).permit(:site, :name, :value)
    end
end
