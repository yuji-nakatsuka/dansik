class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs,:options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string    :song, null: false
      t.string    :artist, null: false
      t.integer   :movie_id, null: false
      t.datetime  :deleted_at
      t.timestamps
      t.timestamps

      end
        add_index :songs, :deleted_at
    end
  end
