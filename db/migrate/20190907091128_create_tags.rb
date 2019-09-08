class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string    :tag, null: false
      t.integer   :movie_id, null: false
      t.datetime  :deleted_at
      t.timestamps

    end  
        add_index :tags, :deleted_at
    end
  end
