class AddAdminToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t| 
      t.binary    :admin
    end
  end
end
