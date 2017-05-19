class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :user, index: true, null: false
      t.references :game, index: true, null: false
      t.integer :minutes, null: false
      t.timestamps null: false
    end
  end
end
