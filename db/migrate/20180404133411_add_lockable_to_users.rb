class AddLockableToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lockable, :string
  end
end
