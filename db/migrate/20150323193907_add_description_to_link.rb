class AddDescriptionToLink < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :description, :text
  end
end
