class Patient < ApplicationRecord
    #historyとの関連付け
    has_many :history
    #validate
    validates :name, presence: true
    validates :firstday, presence: true
end
