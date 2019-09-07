class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|

      t.string   :title, null: false
      t.text     :url, null: false
      t.integer  :end_user_id,null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
