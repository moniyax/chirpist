module PostsHelper
  def action_icon_color(action, post, user, color)
    case action
      when :like
        post.liked_by_user?(user) ? "color: #{color}" : ""
      else
        post.reposted_by_user?(user) ? "color: #{color}" : ""
    end
  end

  def linkify_mentions(text)
    mentions = text.scan(Post::AT_REGEX)
    mentions.each do |m|
      handle, moniker = m[0], m[1]
      timeline_path = user_timeline_path(username: moniker)
      text.sub!(handle, link_to(handle, timeline_path, style: "color: #009688;"))
    end
    text
  end

end
