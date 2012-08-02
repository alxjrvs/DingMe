class CreateObjectiveInstances < ActiveRecord::Migration
  def change
    create_table :objective_instances do |t|
      t.references  :quest_instance
      t.references  :objective
      t.timestamps
    end
  add_index :objective_instances, :objective_id
  add_index :objective_instances, :quest_instance_id
  end
end
