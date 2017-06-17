class History < ApplicationRecord
    # patientとの関連付け
    belongs_to :patient

end
