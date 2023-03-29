class RemoveBioFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :bio, :string
  end
end
