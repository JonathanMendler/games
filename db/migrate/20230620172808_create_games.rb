class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :manufacturer
      t.string :console
      t.integer :price
      t.string :storage
      t.text :description
      t.text :image_url

      t.timestamps
    end
  end
end
