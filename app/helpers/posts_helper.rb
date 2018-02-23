module PostsHelper
  def action_icon_color(action, post, user, color)
    case action
      when :like
        post.liked_by_user?(user) ? "color: #{color}" : ""
      else
        post.reposted_by_user?(user) ? "color: #{color}" : ""
    end
  end
end
