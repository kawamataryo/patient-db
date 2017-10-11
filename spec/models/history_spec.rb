require 'rails_helper'

RSpec.describe History, type: :model do
  it '日付が有り、PatientのDBに入力したpatient_idがあるとerrorにならない' do
    # id 1 のpatientの追加
    FactoryGirl.create(:patient, patient_id: 1)
    # historyの作成
    history = FactoryGirl.build(:history)
    expect(history.valid?).to be_truthy
  end
  it '日付がないとerrorが出る' do
    # id 1 のpatientの追加
    FactoryGirl.create(:patient, patient_id: 1)
    # historyの作成
    history = FactoryGirl.build(:history, history_date: '')
    expect(history.valid?).to be_falsey
  end
  it 'PatientのDBに入力したpatient_idがないとerrorが出る' do
    # historyの作成
    history = FactoryGirl.build(:history)
    history.valid?
    expect(history.errors[:patient_id]).to include('は一覧にありません')
  end
end
