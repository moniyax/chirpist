module PostsHelper
  def action_icon_color(post, user, color)
    post.liked_by_user?(user) ? "color: #{color}" : ""
  end
end
