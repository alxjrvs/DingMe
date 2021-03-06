class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.references  :user
      t.string      :title
      t.text        :description
      t.boolean     :published, :default => false
      t.timestamps
    end
  add_index :quests, :user_id
  end
end
