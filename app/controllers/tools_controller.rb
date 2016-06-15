class ToolsController < ApplicationController

  def index
    if current_user
      @tools = current_user.tools.all
    else
      @tools = Tool.all
    end# cookies[:current_tool_count] = @tools.count
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = current_user.tools.new(tool_params)
    if @tool.name != ""
      @tool.save
      session[:most_recent_tool_id] = @tool.id
      flash[:message] = "Tool created successfully"
      redirect_to tool_path(@tool)
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
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
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
