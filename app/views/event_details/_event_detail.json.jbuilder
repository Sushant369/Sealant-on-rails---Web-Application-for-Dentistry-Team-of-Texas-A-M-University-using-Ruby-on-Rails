# frozen_string_literal: true

json.extract! event_detail, :id, :EventDate, :date, :School, :string, :ConsentFD, :integer, :DenHrs, :flaot,
              :DenTravelHrs, :float, :DenTravelMil, :float, :HygHours, :float, :HygMiles, :float, :AssistantHrs, :float, :AssistantTravel, :float, :OtherHrs, :float, :OtherTravelHrs, :float, :OtherTravelMiles, :float, :NumberOfSSPDriven, :float, :TotalMilesDriven, :float, :ChildScreened, :float, :ChildReceivingSealant, :float, :NumberOfSealed, :float, :NumberFlourideVarnish, :float, :NumberProphy, :float, :uid, :string, :created_at, :updated_at
json.url event_detail_url(event_detail, format: :json)
