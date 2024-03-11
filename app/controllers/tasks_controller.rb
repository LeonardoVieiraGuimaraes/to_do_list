class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # GET /tasks/1
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.json { render json: @task, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.json { render json: @task }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description)
    end
end


# class TasksController < ApplicationController
#   before_action :set_task, only: [:show, :edit, :update, :destroy]

#   # GET /tasks
#   def index
#     @tasks = Task.all
#   end

#   # GET /tasks/1
#   def show
#   end

#   # GET /tasks/new
#   def new
#     @task = Task.new
#   end

#   # GET /tasks/1/edit
#   def edit
#   end

#   # POST /tasks
#   def create
#     @task = Task.new(task_params)

#     if @task.save
#       redirect_to @task, notice: 'Task was successfully created.'
#     else
#       render :new
#     end
#   end

#   # PATCH/PUT /tasks/1
#   def update
#     if @task.update(task_params)
#       redirect_to @task, notice: 'Task was successfully updated.'
#     else
#       render :edit
#     end
#   end

#   # DELETE /tasks/1
#   def destroy
#     @task.destroy
#     redirect_to tasks_url, notice: 'Task was successfully destroyed.'
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_task
#       @task = Task.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def task_params
#       params.require(:task).permit(:title, :description)
#     end
# end
