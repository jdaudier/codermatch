class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :level
      t.references :language #creates a join table
      t.references :user #creates a join table

      t.timestamps
    end
  end
end
