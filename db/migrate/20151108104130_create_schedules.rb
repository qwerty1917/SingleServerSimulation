class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :IAT
      t.string :ST

      t.timestamps null: false
    end
  end
end
