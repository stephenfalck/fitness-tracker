class RemoveExerciseFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :exercise, :integer
  end
end
