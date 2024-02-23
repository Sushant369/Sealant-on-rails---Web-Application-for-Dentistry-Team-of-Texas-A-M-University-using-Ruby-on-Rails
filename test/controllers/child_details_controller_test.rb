# frozen_string_literal: true

require 'test_helper'

class ChildDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @child_detail = child_details(:one)
  end

  test 'should get index' do
    get child_details_url
    assert_response :success
  end

  test 'should get new' do
    get new_child_detail_url
    assert_response :success
  end

  test 'should create child_detail' do
    assert_difference('ChildDetail.count') do
      post child_details_url,
           params: { child_detail: { DecayedNum: @child_detail.DecayedNum, EvaluatorComment: @child_detail.EvaluatorComment,
                                     EvaluatorDate: @child_detail.EvaluatorDate, EvaluatorsName: @child_detail.EvaluatorsName, Experienced: @child_detail.Experienced, FirstSealedNum: @child_detail.FirstSealedNum, FluorideVarnish: @child_detail.FluorideVarnish, ORHealthStatus: @child_detail.ORHealthStatus, OtherPermNum: @child_detail.OtherPermNum, PrescriberName: @child_detail.PrescriberName, PreventativeComment: @child_detail.PreventativeComment, PrimarySealed: @child_detail.PrimarySealed, Prophylaxes: @child_detail.Prophylaxes, ProviderDate: @child_detail.ProviderDate, ProviderName: @child_detail.ProviderName, Referral: @child_detail.Referral, ReferredDT: @child_detail.ReferredDT, ReferredUDT: @child_detail.ReferredUDT, RetainedSealant: @child_detail.RetainedSealant, ScreenComment: @child_detail.ScreenComment, ScreenDate: @child_detail.ScreenDate, Sealants: @child_detail.Sealants, SealantsRecd: @child_detail.SealantsRecd, SealnatsNeeded: @child_detail.SealnatsNeeded, SecondSealedNum: @child_detail.SecondSealedNum, Services: @child_detail.Services, TreatedDecay: @child_detail.TreatedDecay, UntreatedDecay: @child_detail.UntreatedDecay } }
    end

    assert_redirected_to child_detail_url(ChildDetail.last)
  end

  test 'should show child_detail' do
    get child_detail_url(@child_detail)
    assert_response :success
  end

  test 'should get edit' do
    get edit_child_detail_url(@child_detail)
    assert_response :success
  end

  test 'should update child_detail' do
    patch child_detail_url(@child_detail),
          params: { child_detail: { DecayedNum: @child_detail.DecayedNum, EvaluatorComment: @child_detail.EvaluatorComment,
                                    EvaluatorDate: @child_detail.EvaluatorDate, EvaluatorsName: @child_detail.EvaluatorsName, Experienced: @child_detail.Experienced, FirstSealedNum: @child_detail.FirstSealedNum, FluorideVarnish: @child_detail.FluorideVarnish, ORHealthStatus: @child_detail.ORHealthStatus, OtherPermNum: @child_detail.OtherPermNum, PrescriberName: @child_detail.PrescriberName, PreventativeComment: @child_detail.PreventativeComment, PrimarySealed: @child_detail.PrimarySealed, Prophylaxes: @child_detail.Prophylaxes, ProviderDate: @child_detail.ProviderDate, ProviderName: @child_detail.ProviderName, Referral: @child_detail.Referral, ReferredDT: @child_detail.ReferredDT, ReferredUDT: @child_detail.ReferredUDT, RetainedSealant: @child_detail.RetainedSealant, ScreenComment: @child_detail.ScreenComment, ScreenDate: @child_detail.ScreenDate, Sealants: @child_detail.Sealants, SealantsRecd: @child_detail.SealantsRecd, SealnatsNeeded: @child_detail.SealnatsNeeded, SecondSealedNum: @child_detail.SecondSealedNum, Services: @child_detail.Services, TreatedDecay: @child_detail.TreatedDecay, UntreatedDecay: @child_detail.UntreatedDecay } }
    assert_redirected_to child_detail_url(@child_detail)
  end

  test 'should destroy child_detail' do
    assert_difference('ChildDetail.count', -1) do
      delete child_detail_url(@child_detail)
    end

    assert_redirected_to child_details_url
  end
end
