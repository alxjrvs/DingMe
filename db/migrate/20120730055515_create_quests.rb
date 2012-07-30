class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|

      t.timestamps
    end
  end
end
