require 'rails_helper'

RSpec.describe Patient, type: :model do
  it '患者IDと名前と日付が入力されていればerrorにならない' do
    patient = FactoryGirl.build(:patient)
    expect(patient.valid?).to be_truthy
  end
  it '名前が入力されていないとerrorが出る' do
    patient = FactoryGirl.build(:patient, name: '')
    patient.valid?
    expect(patient.errors[:name]).to include('必須項目を入力してください')
  end
  it '患者IDが入力されていないとerrorが出る' do
    patient = FactoryGirl.build(:patient, patient_id: '')
    patient.valid?
    expect(patient.errors[:patient_id]).to include('必須項目を入力してください')
  end
  it '日付が入力されていないとerrorが出る' do
    patient = FactoryGirl.build(:patient, firstday: '')
    patient.valid?
    expect(patient.errors[:firstday]).to include('必須項目を入力してください')
  end
  it '患者IDが重複しているとerrorが出る' do
    FactoryGirl.create(:patient)
    patient = FactoryGirl.build(:patient)
    patient.valid?
    expect(patient.errors[:patient_id]).to include('はすでに存在します')
  end

end
