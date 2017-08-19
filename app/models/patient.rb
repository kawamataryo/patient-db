class Patient < ApplicationRecord
    # 論理削除プラグインの設定
    acts_as_paranoid
    #historyとの関連付け
    has_many :history
    #validate
    validates :name, presence: true #名前を必須
    validates :patient_id, presence: true #IDを必須
    validates :patient_id, uniqueness: true #IDを一意に
end
