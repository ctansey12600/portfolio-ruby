class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :alt
      t.string :thumbnail
      t.string :origional
      t.string :location
      t.integer :project_id
      t.timestamps
    end
  end
end
