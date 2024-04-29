class AddTypeToLink < ActiveRecord::Migration[6.0]
  def up
    add_column :links, :type, :text
  end
end
