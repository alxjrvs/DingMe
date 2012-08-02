class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.references  :user
      t.string      :title
      t.text        :description
      t.timestamps
    end
  add_index :quests, :user_id
  end
end
