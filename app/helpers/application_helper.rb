module ApplicationHelper
  def header(text)
    content_for(:header) { text.to_s }
  end

  def user_admin?
    current_user.admin?
  end
end
