class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.boolean :released, default: false
      t.datetime :released_at
      t.text :cover_art_url
      t.time :length
      t.string :kind
      t.timestamps
    end
  end
end
