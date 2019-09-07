class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string    :tag, null: false
      t.integer   :movie_id, null: false
      t.datetime  :deleted_at, null: false
      t.timestamps
    end
  end
end
