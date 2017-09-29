class AddSymptomToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :symptom, :string
  end
end
