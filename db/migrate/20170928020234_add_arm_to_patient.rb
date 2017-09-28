class AddArmToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :arm, :boolean, default: false, null: false
    remove_column :patients, :sports, :boolean
  end
end
