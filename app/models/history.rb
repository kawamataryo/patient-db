class History < ApplicationRecord
  # patientとの関連付け
  belongs_to :patient
  # validate
  # 日付を必須
  validates :history_date, presence: true
  # patientDBにあるかどう確認
  validates :patient_id, :inclusion => {:in => proc{Patient.pluck(:id)}}
end
