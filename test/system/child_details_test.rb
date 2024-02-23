# frozen_string_literal: true

require 'application_system_test_case'

class ChildDetailsTest < ApplicationSystemTestCase
  setup do
    @child_detail = child_details(:one)
  end

  test 'visiting the index' do
    visit child_details_url
    assert_selector 'h1', text: 'Child details'
  end

  test 'should create child detail' do
    visit child_details_url
    click_on 'New child detail'

    fill_in 'Decayednum', with: @child_detail.DecayedNum
    fill_in 'Evaluatorcomment', with: @child_detail.EvaluatorComment
    fill_in 'Evaluatordate', with: @child_detail.EvaluatorDate
    fill_in 'Evaluatorsname', with: @child_detail.EvaluatorsName
    check 'Experienced' if @child_detail.Experienced
    fill_in 'Firstsealednum', with: @child_detail.FirstSealedNum
    check 'Fluoridevarnish' if @child_detail.FluorideVarnish
    fill_in 'Orhealthstatus', with: @child_detail.ORHealthStatus
    fill_in 'Otherpermnum', with: @child_detail.OtherPermNum
    fill_in 'Prescribername', with: @child_detail.PrescriberName
    fill_in 'Preventativecomment', with: @child_detail.PreventativeComment
    fill_in 'Primarysealed', with: @child_detail.PrimarySealed
    check 'Prophylaxes' if @child_detail.Prophylaxes
    fill_in 'Providerdate', with: @child_detail.ProviderDate
    fill_in 'Providername', with: @child_detail.ProviderName
    fill_in 'Referral', with: @child_detail.Referral
    check 'Referreddt' if @child_detail.ReferredDT
    check 'Referredudt' if @child_detail.ReferredUDT
    fill_in 'Retainedsealant', with: @child_detail.RetainedSealant
    fill_in 'Screencomment', with: @child_detail.ScreenComment
    fill_in 'Screendate', with: @child_detail.ScreenDate
    check 'Sealants' if @child_detail.Sealants
    fill_in 'Sealantsrecd', with: @child_detail.SealantsRecd
    fill_in 'Sealnatsneeded', with: @child_detail.SealnatsNeeded
    fill_in 'Secondsealednum', with: @child_detail.SecondSealedNum
    fill_in 'Services', with: @child_detail.Services
    check 'Treateddecay' if @child_detail.TreatedDecay
    check 'Untreateddecay' if @child_detail.UntreatedDecay
    click_on 'Create Child detail'

    assert_text 'Child detail was successfully created'
    click_on 'Back'
  end

  test 'should update Child detail' do
    visit child_detail_url(@child_detail)
    click_on 'Edit this child detail', match: :first

    fill_in 'Decayednum', with: @child_detail.DecayedNum
    fill_in 'Evaluatorcomment', with: @child_detail.EvaluatorComment
    fill_in 'Evaluatordate', with: @child_detail.EvaluatorDate
    fill_in 'Evaluatorsname', with: @child_detail.EvaluatorsName
    check 'Experienced' if @child_detail.Experienced
    fill_in 'Firstsealednum', with: @child_detail.FirstSealedNum
    check 'Fluoridevarnish' if @child_detail.FluorideVarnish
    fill_in 'Orhealthstatus', with: @child_detail.ORHealthStatus
    fill_in 'Otherpermnum', with: @child_detail.OtherPermNum
    fill_in 'Prescribername', with: @child_detail.PrescriberName
    fill_in 'Preventativecomment', with: @child_detail.PreventativeComment
    fill_in 'Primarysealed', with: @child_detail.PrimarySealed
    check 'Prophylaxes' if @child_detail.Prophylaxes
    fill_in 'Providerdate', with: @child_detail.ProviderDate
    fill_in 'Providername', with: @child_detail.ProviderName
    fill_in 'Referral', with: @child_detail.Referral
    check 'Referreddt' if @child_detail.ReferredDT
    check 'Referredudt' if @child_detail.ReferredUDT
    fill_in 'Retainedsealant', with: @child_detail.RetainedSealant
    fill_in 'Screencomment', with: @child_detail.ScreenComment
    fill_in 'Screendate', with: @child_detail.ScreenDate
    check 'Sealants' if @child_detail.Sealants
    fill_in 'Sealantsrecd', with: @child_detail.SealantsRecd
    fill_in 'Sealnatsneeded', with: @child_detail.SealnatsNeeded
    fill_in 'Secondsealednum', with: @child_detail.SecondSealedNum
    fill_in 'Services', with: @child_detail.Services
    check 'Treateddecay' if @child_detail.TreatedDecay
    check 'Untreateddecay' if @child_detail.UntreatedDecay
    click_on 'Update Child detail'

    assert_text 'Child detail was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Child detail' do
    visit child_detail_url(@child_detail)
    click_on 'Destroy this child detail', match: :first

    assert_text 'Child detail was successfully destroyed'
  end
end
