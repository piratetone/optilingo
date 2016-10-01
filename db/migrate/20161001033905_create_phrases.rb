class CreatePhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :phrases do |t|
      t.text :english
      t.text :spanish
      t.string :mp3

      t.timestamps
    end
  end
end
