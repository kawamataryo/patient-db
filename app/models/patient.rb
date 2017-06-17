class Patient < ApplicationRecord
    #historyとの関連付け
    has_many :history
end
