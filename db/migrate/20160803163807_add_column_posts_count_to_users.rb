class AddColumnPostsCountToUsers < ActiveRecord::Migration
  def up
    add_column :users, :posts_count, :integer, default: 0
    update_posts_statistic
  end

  def down
    remove_column :users, :posts_count
  end

  def update_posts_statistic
    User.all.each do |user|
      user.update_attribute(:posts_count, user.posts.length)
    end
  end
end
