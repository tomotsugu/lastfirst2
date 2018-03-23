class RemoveReleaseToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :release, :boolean
  end
end
