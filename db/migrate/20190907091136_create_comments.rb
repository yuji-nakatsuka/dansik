class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text      :comment, null: false
      t.integer   :end_user_id, null: false
      t.integer   :movie_id, null: false
      t.datetime  :deleted_at
      t.timestamps

      end
        add_index :comments, :deleted_at
    end
  end
