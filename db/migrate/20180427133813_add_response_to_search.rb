class AddResponseToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :response, :text
  end
end
