class AddLocIdToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :locId, :integer
  end
end
