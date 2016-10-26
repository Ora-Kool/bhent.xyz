class AddAdminToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :blogs, :admin, foreign_key: true
  end
end
