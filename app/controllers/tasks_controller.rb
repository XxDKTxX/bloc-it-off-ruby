class TasksController < ApplicationController
    
    def index
    #  # authorize task, :index?
    @tasks = task.visible_to(current_user)
    
  end
 
  def show
    #  # authorize task, :index?
    @task = task.find(params[:id])
    
  end

  def new
    # # authorize task, :new?
    @task = task.new
  end

  def create
      
    @task = task.new
    @task.title = params[:title]
    

    # # authorize task, :create?

    
     if @task.save
       flash[:notice] = "Post was saved."
       redirect_to @task
     else
       flash.now[:alert] = "There was an error saving the task. Please try again."
       render :new
     end
  end
  
  def edit
   
    @task = task.find(params[:id])
     # # authorize task, :edit?
  end

  def update
    
     @task = task.find(params[:id])

     # authorize task, :update?
  
     
      @task.title = params[:task][:title]
      @task.body = params[:task][:body]
     
     if @task.save
       flash[:notice] = "Post was saved."
       redirect_to task_path
     else
       flash.now[:alert] = "There was an error saving the task. Please try again."
       render :new
     end
  end


  def destroy
      
       @task = task.find(params[:id])
 

     if @task.destroy
       flash[:notice] = "\"#{@task.title}\" was deleted successfully."
       redirect_to tasks_url
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end
    
end
