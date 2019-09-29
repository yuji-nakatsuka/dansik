class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies,:options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.string   :title, null: false
      t.text     :url, null: false
      t.integer  :end_user_id,null: false
      t.datetime :deleted_at
      t.timestamps
      end

      add_index :movies, :deleted_at
    end
  end
