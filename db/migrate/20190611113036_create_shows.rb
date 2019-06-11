class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :title
      t.references :show_type, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
