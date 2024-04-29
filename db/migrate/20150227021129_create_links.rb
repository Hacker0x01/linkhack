class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :shortlink
      t.string :url
      t.string :argsstr

      t.timestamps null: false
    end
  end
end
