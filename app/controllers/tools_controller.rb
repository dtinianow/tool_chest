class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = 'Tool created!'
      session[:most_recent_tool_id] = @tool.id
      session[:current_tool_count] = 0 if session[:current_tool_count].nil?
      session[:current_tool_count] += 1
      session[:current_potential_revenue] = 0.0 if session[:current_potential_revenue].nil?
      session[:current_potential_revenue] += @tool.price
      redirect_to tool_path(@tool)
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
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy
    redirect_to tools_path
  end

private
  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end
end
