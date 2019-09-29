class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.integer    :end_user_id, null: false
      t.integer    :movie_id, null: false
      t.datetime :deleted_at
      t.timestamps

      end
        add_index :favorites, :deleted_at
    end
  end
