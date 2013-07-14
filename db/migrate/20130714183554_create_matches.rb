class CreateMatches < ActiveRecord::Migration

  def change
    create_table :matches do |t|
      t.string :repo
      t.string :user_id
      t.string :languages
      t.timestamps
    end
  end

end
