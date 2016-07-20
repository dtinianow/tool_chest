class ToolsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update]


  def index
    @tools = @user.tools.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = @user.tools.new(tool_params)
    if @tool.save
      flash[:notice] = 'Tool created!'
      session[:current_tool_count] = 0 if session[:current_tool_count].nil?
      session[:current_tool_count] += @tool.quantity
      session[:current_potential_revenue] = 0.0 if session[:current_potential_revenue].nil?
      session[:current_potential_revenue] = session[:current_potential_revenue].to_f + @tool.price
      redirect_to user_tool_path(id: @tool)
    else
      flash.now[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to user_tool_path(id: @tool)
    else
      render :edit
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy
    redirect_to user_tools_path
  end

private

  def set_user
    @user = User.find(current_user)
  end

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end
end
