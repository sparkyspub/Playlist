class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :artist
      t.string :title
      t.integer :counter
      t.references :follower, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
