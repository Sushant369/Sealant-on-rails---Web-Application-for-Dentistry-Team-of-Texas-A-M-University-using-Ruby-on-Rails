class StatisticsController < ApplicationController
  def index
      @statistics_data = PatientDetail.select(
        :PatientId, :SchoolName, :Date, :Age, :Grade, :PID, :Gender, :Race, :Ethnicity,
        'child_level_details.ScreenDate AS DateOfSealentReceived',
        'child_level_details.SealnatsNeeded AS NoOfSealentNeeded',
        'child_level_details.SealantsRecd AS NoOfSealentReceived',
        # 'child_level_details.SealantsReplaced AS NoOfSealentReplaced', Code for Sealent Received
        # code for "Did they have any Sealent?"
        "CASE WHEN child_level_details.Experienced = 1 THEN 'Yes' ELSE 'No' END AS CarriesExperience",
        "CASE WHEN child_level_details.UntreatedDecayFollow = 1 THEN 'Yes' ELSE 'No' END AS UntreatedDecay",
        "CASE WHEN child_level_details.ReferredDT = 1 THEN 'Yes' ELSE 'No' END AS ReferredForDT",
        "CASE WHEN child_level_details.ReferredUDT = 1 THEN 'Yes' ELSE 'No' END AS ReferredForUDT",
        "CASE WHEN child_level_details.FluorideVarnish = 1 THEN 'Yes' ELSE 'No' END AS FluorideVarnish",
        # :Sealants, :Experienced, :Services
      ).left_outer_joins(:child_level_details)
      
      # You can add more complex logic to calculate statistics here.

      # For example, you can calculate the number of patients with sealants.
      # @patients_with_sealants = @statistics_data.select { |data| data.Sealants == 'yes' }

      # You can add more statistics calculations as needed.

      # Render the view.
  end
  def schoolStats
    @school_data = PatientDetail.select(
      :SchoolName,
      :Date,
      'COUNT(DISTINCT patient_details.PatientId) AS children_screened',
      'COUNT(DISTINCT CASE WHEN COALESCE(child_level_details.FirstSealedNum, 0) > 0 OR COALESCE(child_level_details.SecondSealedNum, 0) > 0 OR COALESCE(child_level_details.OtherPermNum, 0) > 0 OR COALESCE(child_level_details.PrimarySealed, 0) > 0 THEN patient_details.PatientId ELSE NULL END) AS children_rec_sealants',
      'SUM(COALESCE(child_level_details.FirstSealedNum, 0) + COALESCE(child_level_details.SecondSealedNum, 0) + COALESCE(child_level_details.OtherPermNum, 0) + COALESCE(child_level_details.PrimarySealed, 0)) AS teeth_sealed',
      'SUM(CASE WHEN child_level_details.FluorideVarnish = true THEN 1 ELSE 0 END) AS children_with_fluoride'
    )
    .joins(:child_level_details)
    .group(:SchoolName, :Date)
  end


  def school
    @school_data = PatientDetail.select(
      :SchoolName,
      :Date,
      'COUNT(DISTINCT patient_details.PatientId) AS children_screened',
      'COUNT(DISTINCT CASE WHEN COALESCE(child_level_details.FirstSealedNum, 0) > 0 OR COALESCE(child_level_details.SecondSealedNum, 0) > 0 OR COALESCE(child_level_details.OtherPermNum, 0) > 0 OR COALESCE(child_level_details.PrimarySealed, 0) > 0 THEN patient_details.PatientId ELSE NULL END) AS children_rec_sealants',
      'SUM(COALESCE(child_level_details.FirstSealedNum, 0) + COALESCE(child_level_details.SecondSealedNum, 0) + COALESCE(child_level_details.OtherPermNum, 0) + COALESCE(child_level_details.PrimarySealed, 0)) AS teeth_sealed',
      'SUM(CASE WHEN child_level_details.FluorideVarnish = true THEN 1 ELSE 0 END) AS children_with_fluoride'
    )
    .joins(:child_level_details)
    .group(:SchoolName, :Date)

    @school_data_grouped = @school_data.group_by(&:SchoolName)

    # Prepare data for the grouped bar chart
    @chart_data1 = {
      labels: @school_data_grouped.keys,
      datasets: [
        {
          label: 'Children Screened',
          data: @school_data_grouped.values.map { |school_data| school_data.map(&:children_screened).sum },
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        },
        {
          label: 'Children Receiving Sealants',
          data: @school_data_grouped.values.map { |school_data| school_data.map(&:children_rec_sealants).sum },
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgba(255, 99, 132, 1)',
          borderWidth: 1
        },
        {
          label: 'Teeth Sealed',
          data: @school_data_grouped.values.map { |school_data| school_data.map(&:teeth_sealed).sum },
          backgroundColor: 'rgba(255, 206, 86, 0.2)',
          borderColor: 'rgba(255, 206, 86, 1)',
          borderWidth: 1
        },
        {
          label: 'Children With Flouride',
          data: @school_data_grouped.values.map { |school| school.map(&:children_with_fluoride).sum },
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(54, 162, 235, 1)',
          borderWidth: 1
        }
      ]
    } 
  end

  def event
    @event_data = EventDetail.select(
      :EventDate, :School, :ConsentFD, :DenHrs, :DenTravelHrs, :DenTravelMil,
      :HygHours, :HygTravelHrs, :HygTravelMil, :AssistantHrs, :AssistantTravelHrs, 
      :AssistantTravelMil, :OtherHrs, :OtherTravelHrs, :OtherTravelMiles,
      :NumberOfSSPDriven, :TotalMilesDriven
    )


    # Calculate the total hours
    #total_hours = @event_data.pluck(:DenHrs).sum + @event_data.pluck(:HygHours).sum + @event_data.pluck(:AssistantHrs).sum + @event_data.pluck(:OtherHrs).sum

    # Format data for the pie chart - Total hours at School
    @school_hrs_chart_data = {
      labels: ['Dentist Hours', 'Hygenist Hours', 'Assistant Hours', 'Other Hours'],
      datasets: [{
        data: [@event_data.pluck(:DenHrs).sum, @event_data.pluck(:HygHours).sum, @event_data.pluck(:AssistantHrs).sum, @event_data.pluck(:OtherHrs).sum],
        backgroundColor: ['rgba(75, 192, 192, 0.2)',
        'rgba(255, 99, 132, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(54, 162, 235, 0.2)'],
        borderColor: ['rgba(75, 192, 192, 1)',
        'rgba(255, 99, 132, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(54, 162, 235, 1)'],
        borderWidth: 1
      }]
    }

    # Format data for the pie chart - Total hours travelling
    @travel_hrs_chart_data = {
      labels: ['Dentist Travel Hours', 'Hygenist Travel Hours', 'Assistant Travel Hours', 'Other Travel Hours'],
      datasets: [{
        data: [@event_data.pluck(:DenTravelHrs).sum, @event_data.pluck(:HygTravelHrs).sum, @event_data.pluck(:AssistantHrs).sum, @event_data.pluck(:OtherTravelHrs).sum],
        backgroundColor: ['rgba(75, 192, 192, 0.2)',
        'rgba(255, 99, 132, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(54, 162, 235, 0.2)'],
        borderColor: ['rgba(75, 192, 192, 1)',
        'rgba(255, 99, 132, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(54, 162, 235, 1)'],
        borderWidth: 1
      }]
    }

    # Format data for the pie chart - Total miles travelling
    @travel_mil_chart_data = {
      labels: ['Dentist Travel Miles', 'Hygenist Travel Miles', 'Assistant Travel Miles', 'Other Travel Miles'],
      datasets: [{
        data: [@event_data.pluck(:DenTravelMil).sum, @event_data.pluck(:HygTravelMil).sum, @event_data.pluck(:AssistantTravelMil).sum, @event_data.pluck(:OtherTravelMiles).sum],
        backgroundColor: ['rgba(75, 192, 192, 0.2)',
        'rgba(255, 99, 132, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(54, 162, 235, 0.2)'],
        borderColor: ['rgba(75, 192, 192, 1)',
        'rgba(255, 99, 132, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(54, 162, 235, 1)'],
        borderWidth: 1
      }]
    }

    # Group the data by school
    school_data = @event_data.group_by(&:School)

    # Prepare data for the chart for each variable
    @chart_data_con_forms = {
      labels: school_data.keys,
      datasets: [{
        label: 'Consent Forms Distributed',
        data: school_data.values.map { |school| school.map(&:ConsentFD).sum },
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1
      }]
    }

    # Prepare data for the grouped bar chart
  @chart_data1 = {
    labels: school_data.keys,
    datasets: [
      {
        label: 'Dentist Hours',
        data: school_data.values.map { |school| school.map(&:DenHrs).sum },
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1
      },
      {
        label: 'Hygienist Hours',
        data: school_data.values.map { |school| school.map(&:HygHours).sum },
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
      },
      {
        label: 'Assistant Hours',
        data: school_data.values.map { |school| school.map(&:AssistantHrs).sum },
        backgroundColor: 'rgba(255, 206, 86, 0.2)',
        borderColor: 'rgba(255, 206, 86, 1)',
        borderWidth: 1
      },
      {
        label: 'Other Hours',
        data: school_data.values.map { |school| school.map(&:OtherHrs).sum },
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
      }
    ]
  }

  @chart_data2 = {
    labels: school_data.keys,
    datasets: [
      {
        label: 'Number of Vehicles Driven',
        data: school_data.values.map { |school| school.map(&:NumberOfSSPDriven).sum },
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1
      },
      {
        label: 'Total Miles Driven',
        data: school_data.values.map { |school| school.map(&:TotalMilesDriven).sum },
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
      }
    ]
  }
  end
end
