class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|

      t.timestamps
    end
  end
end
