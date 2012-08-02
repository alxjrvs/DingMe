class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :quest
      t.timestamps
    end
  end
end
