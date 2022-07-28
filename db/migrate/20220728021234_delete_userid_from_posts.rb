class DeleteUseridFromPosts < ActiveRecord::Migration[7.0]
  change_table :posts do |t|
    t.remove :userid
  end
end
