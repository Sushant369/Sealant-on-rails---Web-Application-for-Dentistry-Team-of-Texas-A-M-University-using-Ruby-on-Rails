require "test_helper"

class ChildLevelDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @child_level_detail = child_level_details(:one)
  end

  test "should get index" do
    get child_level_details_url
    assert_response :success
  end

  test "should get new" do
    get new_child_level_detail_url
    assert_response :success
  end

  test "should create child_level_detail" do
    assert_difference("ChildLevelDetail.count") do
      post child_level_details_url, params: { child_level_detail: { CarriesExperience: @child_level_detail.CarriesExperience, EvaluatorComment: @child_level_detail.EvaluatorComment, EvaluatorDate: @child_level_detail.EvaluatorDate, EvaluatorsName: @child_level_detail.EvaluatorsName, Experienced: @child_level_detail.Experienced, FirstSealedNum: @child_level_detail.FirstSealedNum, FluorideVarnish: @child_level_detail.FluorideVarnish, ORHealthStatus: @child_level_detail.ORHealthStatus, OtherPermNum: @child_level_detail.OtherPermNum, PID: @child_level_detail.PID, PrescriberName: @child_level_detail.PrescriberName, PreventComment: @child_level_detail.PreventComment, PrimarySealed: @child_level_detail.PrimarySealed, ProviderDate: @child_level_detail.ProviderDate, ProviderName: @child_level_detail.ProviderName, ReferralS: @child_level_detail.ReferralS, ReferredDT: @child_level_detail.ReferredDT, ReferredUDT: @child_level_detail.ReferredUDT, RetainedSealant: @child_level_detail.RetainedSealant, ScreenComment: @child_level_detail.ScreenComment, ScreenDate: @child_level_detail.ScreenDate, Sealants: @child_level_detail.Sealants, SealantsRecd: @child_level_detail.SealantsRecd, SealnatsNeeded: @child_level_detail.SealnatsNeeded, SecondSealedNum: @child_level_detail.SecondSealedNum, Services: @child_level_detail.Services, TeethFollowup: @child_level_detail.TeethFollowup, TeethPreventative: @child_level_detail.TeethPreventative, TeethScreening: @child_level_detail.TeethScreening, UntreatedCavities: @child_level_detail.UntreatedCavities, UntreatedDecayFollow: @child_level_detail.UntreatedDecayFollow } }
    end

    assert_redirected_to child_level_detail_url(ChildLevelDetail.last)
  end

  test "should show child_level_detail" do
    get child_level_detail_url(@child_level_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_child_level_detail_url(@child_level_detail)
    assert_response :success
  end

  test "should update child_level_detail" do
    patch child_level_detail_url(@child_level_detail), params: { child_level_detail: { CarriesExperience: @child_level_detail.CarriesExperience, EvaluatorComment: @child_level_detail.EvaluatorComment, EvaluatorDate: @child_level_detail.EvaluatorDate, EvaluatorsName: @child_level_detail.EvaluatorsName, Experienced: @child_level_detail.Experienced, FirstSealedNum: @child_level_detail.FirstSealedNum, FluorideVarnish: @child_level_detail.FluorideVarnish, ORHealthStatus: @child_level_detail.ORHealthStatus, OtherPermNum: @child_level_detail.OtherPermNum, PID: @child_level_detail.PID, PrescriberName: @child_level_detail.PrescriberName, PreventComment: @child_level_detail.PreventComment, PrimarySealed: @child_level_detail.PrimarySealed, ProviderDate: @child_level_detail.ProviderDate, ProviderName: @child_level_detail.ProviderName, ReferralS: @child_level_detail.ReferralS, ReferredDT: @child_level_detail.ReferredDT, ReferredUDT: @child_level_detail.ReferredUDT, RetainedSealant: @child_level_detail.RetainedSealant, ScreenComment: @child_level_detail.ScreenComment, ScreenDate: @child_level_detail.ScreenDate, Sealants: @child_level_detail.Sealants, SealantsRecd: @child_level_detail.SealantsRecd, SealnatsNeeded: @child_level_detail.SealnatsNeeded, SecondSealedNum: @child_level_detail.SecondSealedNum, Services: @child_level_detail.Services, TeethFollowup: @child_level_detail.TeethFollowup, TeethPreventative: @child_level_detail.TeethPreventative, TeethScreening: @child_level_detail.TeethScreening, UntreatedCavities: @child_level_detail.UntreatedCavities, UntreatedDecayFollow: @child_level_detail.UntreatedDecayFollow } }
    assert_redirected_to child_level_detail_url(@child_level_detail)
  end

  test "should destroy child_level_detail" do
    assert_difference("ChildLevelDetail.count", -1) do
      delete child_level_detail_url(@child_level_detail)
    end

    assert_redirected_to child_level_details_url
  end
end
