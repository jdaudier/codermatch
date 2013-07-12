class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :level
      t.string :language
      t.integer :zipcode

      t.timestamps
    end
  end
end
