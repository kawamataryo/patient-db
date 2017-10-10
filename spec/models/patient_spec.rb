require 'rails_helper'


RSpec.describe Patient, type: :model do
    it 'is valid with a name, patient_id, firstday' do
        patient = FactoryGirl.build(:patient)
        expect(patient.valid?).to eq true
    end
    it 'is invalid without a name' do
        patient = FactoryGirl.build(:patient, name:'')
        patient.valid?
        expect(patient.errors[:name]).to include('必須項目を入力してください')
    end
    it 'is invalid without a patient_id' do
        patient = FactoryGirl.build(:patient, patient_id:'')
        patient.valid?
        expect(patient.errors[:patient_id]).to include('必須項目を入力してください')
    end
    it 'is invalid without a firstday' do
        patient = FactoryGirl.build(:patient, firstday:'')
        patient.valid?
        expect(patient.errors[:firstday]).to include('必須項目を入力してください')
    end
    it 'is invalid ununique a patient_id' do
        FactoryGirl.create(:patient)
        patient = FactoryGirl.build(:patient)
        patient.valid?
        expect(patient.errors[:patient_id]).to include('はすでに存在します')
    end
end
