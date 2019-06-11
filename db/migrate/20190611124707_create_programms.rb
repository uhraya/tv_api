class CreateProgramms < ActiveRecord::Migration[5.2]
  def change
    create_table :programms do |t|
      t.references :channel, foreign_key: true
      t.references :episode, foreign_key: true
      t.time :timeslot
      t.date :date

      t.timestamps
    end
  end
end
