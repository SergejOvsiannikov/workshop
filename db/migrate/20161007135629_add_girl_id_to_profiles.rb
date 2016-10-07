class AddGirlIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :girl_id, :integer
  end
end
