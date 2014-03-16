class CreateAchievementObservers < ActiveRecord::Migration
  def change
    create_table :achievement_observers do |t|

      t.timestamps
    end
  end
end
