FactoryGirl.define do
  factory :history do
    history_date Date.today
    patient_id 1
    patient_name Gimei.name
    sales 4000
  end
end
