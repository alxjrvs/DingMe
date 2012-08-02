class CreateObjectiveInstances < ActiveRecord::Migration
  def change
    create_table :objective_instances do |t|
      t.references  :quest_instance
      t.timestamps
    end
  add_index :objective_instances, :quest_instance_id
  end
end
