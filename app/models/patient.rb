class Patient < ApplicationRecord
    # 論理削除プラグインの設定
    acts_as_paranoid
    #historyとの関連付け
    has_many :history
    #validate
    validates :name, presence: true
end
