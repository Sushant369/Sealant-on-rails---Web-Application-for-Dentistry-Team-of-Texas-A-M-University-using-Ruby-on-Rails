class ChildLevelDetail < ApplicationRecord

    self.primary_key = "PID"

    belongs_to :patient_detail, foreign_key: 'PID'
end
