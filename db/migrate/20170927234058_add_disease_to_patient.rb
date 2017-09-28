class AddDiseaseToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :shoulder, :boolean, default: false, null: false
    add_column :patients, :lowback, :boolean, default: false, null: false
    add_column :patients, :neak, :boolean, default: false, null: false
    add_column :patients, :knee, :boolean, default: false, null: false
    add_column :patients, :sports, :boolean, default: false, null: false
    add_column :patients, :headache, :boolean, default: false, null: false
    add_column :patients, :womans, :boolean, default: false, null: false
    add_column :patients, :pregnant, :boolean, default: false, null: false
    add_column :patients, :spirit, :boolean, default: false, null: false
    add_column :patients, :back, :boolean, default: false, null: false
    add_column :patients, :eye, :boolean, default: false, null: false
    add_column :patients, :ear, :boolean, default: false, null: false
    add_column :patients, :nose, :boolean, default: false, null: false
    add_column :patients, :face, :boolean, default: false, null: false
    add_column :patients, :internal, :boolean, default: false, null: false
    add_column :patients, :nerves, :boolean, default: false, null: false
  end
end
