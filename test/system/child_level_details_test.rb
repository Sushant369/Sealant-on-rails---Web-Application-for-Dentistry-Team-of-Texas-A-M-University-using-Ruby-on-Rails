require "application_system_test_case"

class ChildLevelDetailsTest < ApplicationSystemTestCase
  setup do
    @child_level_detail = child_level_details(:one)
  end

  test "visiting the index" do
    visit child_level_details_url
    assert_selector "h1", text: "Child level details"
  end

  test "should create child level detail" do
    visit child_level_details_url
    click_on "New child level detail"

    fill_in "Carriesexperience", with: @child_level_detail.CarriesExperience
    fill_in "Evaluatorcomment", with: @child_level_detail.EvaluatorComment
    fill_in "Evaluatordate", with: @child_level_detail.EvaluatorDate
    fill_in "Evaluatorsname", with: @child_level_detail.EvaluatorsName
    check "Experienced" if @child_level_detail.Experienced
    fill_in "Firstsealednum", with: @child_level_detail.FirstSealedNum
    check "Fluoridevarnish" if @child_level_detail.FluorideVarnish
    fill_in "Orhealthstatus", with: @child_level_detail.ORHealthStatus
    fill_in "Otherpermnum", with: @child_level_detail.OtherPermNum
    fill_in "Pid", with: @child_level_detail.PID
    fill_in "Prescribername", with: @child_level_detail.PrescriberName
    fill_in "Preventcomment", with: @child_level_detail.PreventComment
    fill_in "Primarysealed", with: @child_level_detail.PrimarySealed
    fill_in "Providerdate", with: @child_level_detail.ProviderDate
    fill_in "Providername", with: @child_level_detail.ProviderName
    fill_in "Referrals", with: @child_level_detail.ReferralS
    check "Referreddt" if @child_level_detail.ReferredDT
    check "Referredudt" if @child_level_detail.ReferredUDT
    fill_in "Retainedsealant", with: @child_level_detail.RetainedSealant
    fill_in "Screencomment", with: @child_level_detail.ScreenComment
    fill_in "Screendate", with: @child_level_detail.ScreenDate
    fill_in "Sealants", with: @child_level_detail.Sealants
    fill_in "Sealantsrecd", with: @child_level_detail.SealantsRecd
    fill_in "Sealnatsneeded", with: @child_level_detail.SealnatsNeeded
    fill_in "Secondsealednum", with: @child_level_detail.SecondSealedNum
    fill_in "Services", with: @child_level_detail.Services
    fill_in "Teethfollowup", with: @child_level_detail.TeethFollowup
    fill_in "Teethpreventative", with: @child_level_detail.TeethPreventative
    fill_in "Teethscreening", with: @child_level_detail.TeethScreening
    fill_in "Untreatedcavities", with: @child_level_detail.UntreatedCavities
    check "Untreateddecayfollow" if @child_level_detail.UntreatedDecayFollow
    click_on "Create Child level detail"

    assert_text "Child level detail was successfully created"
    click_on "Back"
  end

  test "should update Child level detail" do
    visit child_level_detail_url(@child_level_detail)
    click_on "Edit this child level detail", match: :first

    fill_in "Carriesexperience", with: @child_level_detail.CarriesExperience
    fill_in "Evaluatorcomment", with: @child_level_detail.EvaluatorComment
    fill_in "Evaluatordate", with: @child_level_detail.EvaluatorDate
    fill_in "Evaluatorsname", with: @child_level_detail.EvaluatorsName
    check "Experienced" if @child_level_detail.Experienced
    fill_in "Firstsealednum", with: @child_level_detail.FirstSealedNum
    check "Fluoridevarnish" if @child_level_detail.FluorideVarnish
    fill_in "Orhealthstatus", with: @child_level_detail.ORHealthStatus
    fill_in "Otherpermnum", with: @child_level_detail.OtherPermNum
    fill_in "Pid", with: @child_level_detail.PID
    fill_in "Prescribername", with: @child_level_detail.PrescriberName
    fill_in "Preventcomment", with: @child_level_detail.PreventComment
    fill_in "Primarysealed", with: @child_level_detail.PrimarySealed
    fill_in "Providerdate", with: @child_level_detail.ProviderDate
    fill_in "Providername", with: @child_level_detail.ProviderName
    fill_in "Referrals", with: @child_level_detail.ReferralS
    check "Referreddt" if @child_level_detail.ReferredDT
    check "Referredudt" if @child_level_detail.ReferredUDT
    fill_in "Retainedsealant", with: @child_level_detail.RetainedSealant
    fill_in "Screencomment", with: @child_level_detail.ScreenComment
    fill_in "Screendate", with: @child_level_detail.ScreenDate
    fill_in "Sealants", with: @child_level_detail.Sealants
    fill_in "Sealantsrecd", with: @child_level_detail.SealantsRecd
    fill_in "Sealnatsneeded", with: @child_level_detail.SealnatsNeeded
    fill_in "Secondsealednum", with: @child_level_detail.SecondSealedNum
    fill_in "Services", with: @child_level_detail.Services
    fill_in "Teethfollowup", with: @child_level_detail.TeethFollowup
    fill_in "Teethpreventative", with: @child_level_detail.TeethPreventative
    fill_in "Teethscreening", with: @child_level_detail.TeethScreening
    fill_in "Untreatedcavities", with: @child_level_detail.UntreatedCavities
    check "Untreateddecayfollow" if @child_level_detail.UntreatedDecayFollow
    click_on "Update Child level detail"

    assert_text "Child level detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Child level detail" do
    visit child_level_detail_url(@child_level_detail)
    click_on "Destroy this child level detail", match: :first

    assert_text "Child level detail was successfully destroyed"
  end
end
