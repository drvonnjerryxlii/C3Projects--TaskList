require "sinatra"
require "sinatra/reloader"
# require_relative "lib/database"
require_relative "lib/task_list"


class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

  get "/create" do
    erb :create_task
  end

  post "/create" do
    @task_db = TaskList::TaskList.new("tasks.db")
    # @name = params[:name]
    # @description = params[:description]
    # {"name"=>"asdf", "description"=>"asdf"}
    @task_db.create_task(params[:name], params[:description])
    @tasks = @task_db.all_tasks
    erb :create_task
  end

  get "/update" do
    erb :update_task
  end

  post "/update" do
    erb :update_task
  end
end
