require 'caxlsx'

class ExcelExportsController < ApplicationController
  def export_child_level_details
    workbook = Axlsx::Package.new
    workbook.workbook.add_worksheet(name: 'Child Level Details') do |sheet|
      data = ChildLevelDetail.joins(:patient_detail).select('patient_details.*, child_level_details.*')

      sheet.add_row %w[
          PID
          PatientID
          ProgramName
          SchoolName
          Age
          Grade
          TeethScreening,
          TeethPreventative,
          TeethFollowup,
          PrescriberName,
          ScreenDate,
          ScreenComment,
          UntreatedCavities,
          CarriesExperience,
          Sealants,
          ReferralS,
          ProviderName,
          ProviderDate,
          PreventComment,
          FirstSealedNum,
          SecondSealedNum,
          OtherPermNum,
          PrimarySealed,
          FluorideVarnish,
          EvaluatorsName,
          EvaluatorDate,
          EvaluatorComment,
          RetainedSealant,
          ReferredDT,
          ReferredUDT,
          SealantsRecd,
          SealnatsNeeded,
          Experienced,
          UntreatedDecayFollow,
          Services,
          ORHealthStatus
      ]

      data.each do |record|
        sheet.add_row [
                        record.PID,
                        record.PatientId,
                        record.ProgramName,
                        record.SchoolName,
                        record.Age,
                        record.Grade,
                        record.TeethScreening,
                        record.TeethPreventative,
                        record.TeethFollowup,
                        record.PrescriberName,
                        record.ScreenDate,
                        record.ScreenComment,
                        record.UntreatedCavities,
                        record.CarriesExperience,
                        record.Sealants,
                        record.ReferralS,
                        record.ProviderName,
                        record.ProviderDate,
                        record.PreventComment,
                        record.FirstSealedNum,
                        record.SecondSealedNum,
                        record.OtherPermNum,
                        record.PrimarySealed,
                        record.FluorideVarnish,
                        record.EvaluatorsName,
                        record.EvaluatorDate,
                        record.EvaluatorComment,
                        record.RetainedSealant,
                        record.ReferredDT,
                        record.ReferredUDT,
                        record.SealantsRecd,
                        record.SealnatsNeeded,
                        record.Experienced,
                        record.UntreatedDecayFollow,
                        record.Services,
                        record.ORHealthStatus
                      ]
      end
    end

    send_data workbook.to_stream.read, filename: 'ChildLevelDetails.xlsx'
  end
  def export_event_details
    workbook = Axlsx::Package.new
    workbook.workbook.add_worksheet(name: 'Event Details') do |sheet|
      data = EventDetail.all

      sheet.add_row %w[
        EventDate,
        School,
        ConsentFD,
        DenHrs,
        DenTravelHrs,
        DenTravelMil,
        HygHours,
        HygTravelMil,
        HygTravelHrs,
        AssistantTravelMil,
        AssistantHrs,
        AssistantTravelHrs,
        OtherHrs,
        OtherTravelHrs,
        OtherTravelMiles,
        NumberOfSSPDriven,
        TotalMilesDriven,
        ChildScreened,
        ChildReceivingSealant,
        NumberOfSealed,
        NumberFlourideVarnish,
        NumberProphy
      ]

      data.each do |record|
        sheet.add_row [
                        record.EventDate,
                        record.School,
                        record.ConsentFD,
                        record.DenHrs,
                        record.DenTravelHrs,
                        record.DenTravelMil,
                        record.HygHours,
                        record.HygTravelMil,
                        record.HygTravelHrs,
                        record.AssistantTravelMil,
                        record.AssistantHrs,
                        record.AssistantTravelHrs,
                        record.OtherHrs,
                        record.OtherTravelHrs,
                        record.OtherTravelMiles,
                        record.NumberOfSSPDriven,
                        record.TotalMilesDriven,
                        record.ChildScreened,
                        record.ChildReceivingSealant,
                        record.NumberOfSealed,
                        record.NumberFlourideVarnish,
                        record.NumberProphy
                      ]
      end
    end

    send_data workbook.to_stream.read, filename: 'EventDetails.xlsx'
  end

  # def export_patient_details
  #   workbook = Axlsx::Package.new
  #   workbook.workbook.add_worksheet(name: 'Patient Details') do |sheet|
  #     data = PatientDetail.all
  #
  #     sheet.add_row %w[
  #       PatientID
  #       ProgramName
  #       SchoolName
  #       Age
  #       Grade
  #     ]
  #
  #     data.each do |record|
  #       sheet.add_row [
  #                       record.PatientId,
  #                       record.ProgramName,
  #                       record.SchoolName,
  #                       record.Age,
  #                       record.Grade,
  #                     # Add other fields based on your schema.rb
  #                     # For example: record.UntreatedDecayScreen, record.TreatedDecay, etc.
  #                     ]
  #     end
  #   end
  #
  #   send_data workbook.to_stream.read, filename: 'PatientDetails.xlsx'
  # end

end
