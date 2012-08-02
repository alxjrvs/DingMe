class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.references :user
      t.timestamps
    end
  add_index :quests, :user_id
  end
end
