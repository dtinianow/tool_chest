class Admin::ToolsController < Admin::BaseController
  def index
    @tools = Tool.all
    # require "pry"; binding.pry
  end
end
