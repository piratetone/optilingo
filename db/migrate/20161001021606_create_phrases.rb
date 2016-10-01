class CreatePhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :phrases do |t|
      t.string :words
      t.string :phrases
      t.string :recordings

      t.timestamps
    end
  end
end
