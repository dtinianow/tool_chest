class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :most_recent_tool, :current_tool_summary, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def most_recent_tool
    User.find(current_user.id).tools.last
  end

  def current_tool_summary
    "<strong>Tools created this session: </strong>#{session[:current_tool_count]}
    <br><br>
     <strong>Total cost: </strong>#{session[:current_potential_revenue]}".html_safe
  end
end
