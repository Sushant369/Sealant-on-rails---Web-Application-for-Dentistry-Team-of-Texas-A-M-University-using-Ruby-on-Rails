# frozen_string_literal: true

class PatientDetailsController < ApplicationController
  before_action :set_patient_detail, only: %i[show edit update destroy]

  # GET /patient_details or /patient_details.json
  def index
    @patient_details = PatientDetail.all
  end

  # GET /patient_details/1 or /patient_details/1.json
  def show
    @patient = PatientDetail.find_by(PID: params[:PID])
  end

  # GET /patient_details/new
  def new
    @patient_detail = PatientDetail.new
  end

  # GET /patient_details/1/edit
  def edit; end

  # POST /patient_details or /patient_details.json
  def create
    @patient_detail = PatientDetail.new(patient_detail_params)
    @patient_detail.PID = "#{patient_detail_params[:PatientId]}-#{patient_detail_params[:SchoolName]}"

    respond_to do |format|
      if @patient_detail.save
        format.html do
          redirect_to patient_detail_url(@patient_detail), notice: 'Patient detail was successfully created.'
        end
        format.json { render :show, status: :created, location: @patient_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_details/1 or /patient_details/1.json
  def update
    respond_to do |format|
      if @patient_detail.update(patient_detail_params)
        format.html do
          redirect_to patient_detail_url(@patient_detail), notice: 'Patient detail was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @patient_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_details/1 or /patient_details/1.json
  def destroy
    @patient_detail.destroy!

    respond_to do |format|
      format.html { redirect_to patient_details_url, notice: 'Patient detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient_detail
    @patient_detail = PatientDetail.find_by(PID: params[:PID])
  end

  # Only allow a list of trusted parameters through.
  def patient_detail_params
    params.require(:patient_detail).permit(:PatientId, :ProgramName, :SchoolName, :Age, :Date, :Insurance, :Grade, :PID, :Gender, :Race, :Ethnicity)
  end
end
