class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.references  :quest
      
      t.timestamps
    end
  add_index :objectives, :quest_id
  end
end
