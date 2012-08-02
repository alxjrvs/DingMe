class CreateQuestInstances < ActiveRecord::Migration
  def change
    create_table :quest_instances do |t|
      t.references  :quest
      t.references  :user

      t.timestamps
    end
  add_index :quest_instances, :quest_id
  add_index :quest_instances, :user_id
  end
end
