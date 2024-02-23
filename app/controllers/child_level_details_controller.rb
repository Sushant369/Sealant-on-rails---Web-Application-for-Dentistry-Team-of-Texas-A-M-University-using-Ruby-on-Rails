class ChildLevelDetailsController < ApplicationController
  before_action :set_child_level_detail, only: %i[ show edit update destroy ]

  # GET /child_level_details or /child_level_details.json
  def index
    @child_level_details = ChildLevelDetail.all
  end

  # GET /child_level_details/1 or /child_level_details/1.json
  def show
  end

  # GET /child_level_details/new
  def new
    @child_level_detail = ChildLevelDetail.new
  end

  # GET /child_level_details/1/edit
  def edit
  end

  # POST /child_level_details or /child_level_details.json
  def create

    params[:child_level_detail].delete(:id)  # This line removes the id key from the parameters
    @child_level_detail = ChildLevelDetail.new(child_level_detail_params)

    respond_to do |format|
      if @child_level_detail.save
        format.html { redirect_to child_level_detail_url(@child_level_detail),
                                  notice: "Child level detail was successfully created." }
        # format.json { render :show, status: :created, location: @child_level_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @child_level_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /child_level_details/1 or /child_level_details/1.json
  def update
    respond_to do |format|
      if @child_level_detail.update(child_level_detail_params)
        format.html { redirect_to child_level_detail_url(@child_level_detail), notice: "Child level detail was successfully updated." }
        format.json { render :show, status: :ok, location: @child_level_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @child_level_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /child_level_details/1 or /child_level_details/1.json
  def destroy
    @child_level_detail.destroy!

    respond_to do |format|
      format.html { redirect_to child_level_details_url, notice: "Child level detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def child_data
    @patient_detail = PatientDetail.find(params[:patient_detail_id])
    @pid = @patient_detail.PID
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_child_level_detail
    @child_level_detail = ChildLevelDetail.find_by(PID: params[:PID])
  end

  # Only allow a list of trusted parameters through.
  def child_level_detail_params
    params.require(:child_level_detail).permit(:PID, :TeethScreening, :TeethPreventative, :TeethFollowup,
                                               :PrescriberName, :ScreenDate, :ScreenComment, :UntreatedCavities,
                                               :CarriesExperience, :Sealants, :ReferralS, :ProviderName, :ProviderDate,
                                               :PreventComment, :FirstSealedNum, :SecondSealedNum, :OtherPermNum,
                                               :PrimarySealed, :FluorideVarnish, :EvaluatorsName, :EvaluatorDate,
                                               :EvaluatorComment, :RetainedSealant, :ReferredDT, :ReferredUDT,
                                               :SealantsRecd, :SealnatsNeeded, :Experienced, :UntreatedDecayFollow,
                                               :Services, :ORHealthStatus)
  end
end