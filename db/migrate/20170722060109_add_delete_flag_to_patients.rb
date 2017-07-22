class AddDeleteFlagToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :delete_flag, :boolean, default: false, null: false
  end
end
