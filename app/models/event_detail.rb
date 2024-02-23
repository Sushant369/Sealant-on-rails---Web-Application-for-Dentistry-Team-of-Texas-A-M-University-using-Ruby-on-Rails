# frozen_string_literal: true

class EventDetail < ApplicationRecord
  validates :EventDate, presence: true
  validates :School, presence: true
  validates :ConsentFD, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :DenHrs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :DenTravelHrs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :DenTravelMil, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :HygHours, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :HygTravelMil, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :HygTravelHrs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :AssistantTravelMil, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :AssistantHrs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :AssistantTravelHrs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :OtherHrs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :OtherTravelHrs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :OtherTravelMiles, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :NumberOfSSPDriven, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :TotalMilesDriven, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # Not needed in event details page
  validates :ChildScreened, presence: false, allow_blank: true
  validates :ChildReceivingSealant, presence: false, allow_blank: true
  validates :NumberOfSealed, presence: false, allow_blank: true
  validates :NumberFlourideVarnish, presence: false, allow_blank: true
  validates :NumberProphy, presence: false, allow_blank: true
end
