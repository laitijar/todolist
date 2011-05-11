class TodoTasksController < ApplicationController
  before_filter :require_user
  # GET /todo_tasks
  # GET /todo_tasks.xml
  def index
    @todo_tasks = TodoTask.order("position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todo_tasks }
    end
  end

  # GET /todo_tasks/1
  # GET /todo_tasks/1.xml
  def show
    @todo_task = TodoTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo_task }
    end
  end

  # GET /todo_tasks/new
  # GET /todo_tasks/new.xml
  def new
    @todo_task = TodoTask.new(:user_id => params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todo_task }
    end
  end

  # GET /todo_tasks/1/edit
  def edit
    @todo_task = TodoTask.find(params[:id])
  end

  # POST /todo_tasks
  # POST /todo_tasks.xml
  def create
    @todo_task = TodoTask.new(params[:todo_task])

    respond_to do |format|
      if @todo_task.save
        format.html { redirect_to(@todo_task, :notice => 'Todo task was successfully created.') }
        format.xml  { render :xml => @todo_task, :status => :created, :location => @todo_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todo_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todo_tasks/1
  # PUT /todo_tasks/1.xml
  def update
    @todo_task = TodoTask.find(params[:id])

    respond_to do |format|
      if @todo_task.update_attributes(params[:todo_task])
        format.html { redirect_to(@todo_task, :notice => 'Todo task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_tasks/1
  # DELETE /todo_tasks/1.xml
  def destroy
    @todo_task = TodoTask.find(params[:id])
    @todo_task.destroy

    respond_to do |format|
      format.html { redirect_to(todo_tasks_url) }
      format.xml  { head :ok }
    end
  end

  def sort
    params[:tasks].each_with_index do |id, index|
      TodoTask.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

end
