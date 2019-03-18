class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :exercise
      t.date :date
      t.integer :duration

      t.timestamps
    end
  end
end
