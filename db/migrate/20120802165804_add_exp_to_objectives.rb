class AddExpToObjectives < ActiveRecord::Migration
  def change
    change_table(:objectives) do |t|
      t.integer   :exp
      t.string    :title
      t.text      :description
    end
    change_table(:objective_instances) do |t|
      t.boolean :complete?, :default => false
    end
  end
end
