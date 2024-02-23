class CreateChildLevelDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :child_level_details do |t|
      t.string :PID
      t.string :TeethScreening
      t.string :TeethPreventative
      t.string :TeethFollowup
      t.string :PrescriberName
      t.date :ScreenDate
      t.string :ScreenComment
      t.integer :UntreatedCavities
      t.integer :CarriesExperience
      t.integer :Sealants
      t.integer :ReferralS
      t.string :ProviderName
      t.date :ProviderDate
      t.string :PreventComment
      t.integer :FirstSealedNum
      t.integer :SecondSealedNum
      t.integer :OtherPermNum
      t.integer :PrimarySealed
      t.boolean :FluorideVarnish
      t.string :EvaluatorsName
      t.date :EvaluatorDate
      t.string :EvaluatorComment
      t.integer :RetainedSealant
      t.boolean :ReferredDT
      t.boolean :ReferredUDT
      t.integer :SealantsRecd
      t.integer :SealnatsNeeded
      t.boolean :Experienced
      t.boolean :UntreatedDecayFollow
      t.string :Services
      t.string :ORHealthStatus

      t.timestamps
    end
  end
end
