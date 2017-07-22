class AddPatientIdToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :patient_id, :integer
  end
end
