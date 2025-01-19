module ApplicationHelper
  def like_path(likeable)
    if likeable.is_a?(Landmark)
      like_landmark_path(likeable)
    elsif likeable.is_a?(Comment)
      like_landmark_comment_path(likeable.landmark, likeable)
    else
      raise "Unsupported likeable type"
    end
  end

  def unlike_path(likeable)
    if likeable.is_a?(Landmark)
      unlike_landmark_path(likeable)
    elsif likeable.is_a?(Comment)
      unlike_landmark_comment_path(likeable.landmark, likeable)
    else
      raise "Unsupported likeable type"
    end
  end
end
