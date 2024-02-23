# frozen_string_literal: true

#  EventDetailsController handles the event_details page. It has methods for the CRUD Operations on the Event Details Schema.
class EventDetailsController < ApplicationController
  before_action :set_event_detail, only: %i[show edit update destroy]

  # GET /event_details or /event_details.json
  def index
    @event_details = EventDetail.all
  end

  # GET /event_details/1 or /event_details/1.json
  def show; end

  # GET /event_details/new
  def new
    @event_detail = EventDetail.new
  end

  # GET /event_details/1/edit
  def edit; end

  # POST /event_details or /event_details.json
  def create
    @event_detail = EventDetail.new(event_detail_params)

    respond_to do |format|
      if @event_detail.save
        format.html { redirect_to event_detail_url(@event_detail), notice: 'Event detail was successfully created.' }
        format.json { render :show, status: :created, location: @event_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_details/1 or /event_details/1.json
  def update
    respond_to do |format|
      if @event_detail.update(event_detail_params)
        format.html { redirect_to event_detail_url(@event_detail), notice: 'Event detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_details/1 or /event_details/1.json
  def destroy
    @event_detail.destroy!

    respond_to do |format|
      format.html { redirect_to event_details_url, notice: 'Event detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_detail
    @event_detail = EventDetail.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_detail_params
    params.require(:event_detail).permit(:EventDate, :School, :ConsentFD, :DenHrs, :DenTravelHrs, :DenTravelMil,
                                         :HygHours, :HygTravelHrs, :HygTravelMil, :AssistantHrs, :AssistantTravelHrs, :AssistantTravelMil, :OtherHrs, :OtherTravelHrs, :OtherTravelMiles, :NumberOfSSPDriven, :TotalMilesDriven, :ChildScreened, :ChildReceivingSealant, :NumberOfSealed, :NumberFlourideVarnish, :NumberProphy, :uid)
  end
end
