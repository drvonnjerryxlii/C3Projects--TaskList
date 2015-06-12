require "sinatra"
require "sinatra/reloader"
# require_relative "lib/database"
require_relative "lib/task_list"


class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    task_db = TaskList::TaskList.new("tasks.db")
    @tasks = task_db.all_tasks
    
    erb :index
  end

  get "/create" do
    erb :create_task
  end

  post "/" do
    task_db = TaskList::TaskList.new("tasks.db")
    task_db.create_task(params[:name], params[:description])

    @tasks = task_db.all_tasks

    erb :index
  end

  get "/update" do
    erb :update_task
  end

  post "/update" do
    erb :update_task
  end
end
