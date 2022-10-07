class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :languages
      t.string :date_made
      t.string :purpose
      t.timestamps
    end
  end
end
