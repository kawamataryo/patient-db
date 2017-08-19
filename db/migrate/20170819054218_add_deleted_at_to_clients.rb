class AddDeletedAtToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :deleted_at, :datetime
    add_index :patients, :deleted_at
  end
end
