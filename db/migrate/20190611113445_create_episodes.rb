class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :season
      t.integer :number
      t.references :show
      t.time :length
      t.string :description

      t.timestamps
    end
  end
end
