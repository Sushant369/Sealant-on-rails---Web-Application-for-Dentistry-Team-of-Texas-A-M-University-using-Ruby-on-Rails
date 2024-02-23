# frozen_string_literal: true

class CreateEventDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :event_details do |t|
      t.date :EventDate
      t.string :School
      t.integer :ConsentFD
      t.float :DenHrs
      t.float :DenTravelHrs
      t.float :DenTravelMil
      t.float :HygHours
      t.float :HygTravelMil
      t.float :HygTravelHrs
      t.float :AssistantTravelMil
      t.float :AssistantHrs
      t.float :AssistantTravelHrs
      t.float :OtherHrs
      t.float :OtherTravelHrs
      t.float :OtherTravelMiles
      t.float :NumberOfSSPDriven
      t.float :TotalMilesDriven
      t.float :ChildScreened
      t.float :ChildReceivingSealant
      t.float :NumberOfSealed
      t.float :NumberFlourideVarnish
      t.float :NumberProphy
      t.string :uid

      t.timestamps
    end
  end
end
