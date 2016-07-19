class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :most_recent_tool, :tool_exists?, :current_tool_summary

  def most_recent_tool
    Tool.find(session[:most_recent_tool_id])
  end

  def tool_exists?
    Tool.exists?(session[:most_recent_tool_id])
  end

  def current_tool_summary
    "<strong>Tools created this session: </strong>#{session[:current_tool_count]}
    <br><br>
     <strong>Total cost: </strong>#{session[:current_potential_revenue]}".html_safe
  end

end
