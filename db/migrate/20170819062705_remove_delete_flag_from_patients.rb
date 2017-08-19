class RemoveDeleteFlagFromPatients < ActiveRecord::Migration[5.1]
  def change
    remove_column :patients, :delete_flag, :boolean
  end
end
