class AddReleaseToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :release, :string
  end
end
