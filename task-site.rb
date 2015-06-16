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

  get "/update/:id" do
    task_db = TaskList::TaskList.new("tasks.db")
    @task = task_db.select_task(params[:id])

    erb :create_task
  end

  put "/" do
    task_db = TaskList::TaskList.new("tasks.db")
    task_db.update_task(params[:id], params[:name], params[:description], params[:complete])

    # redirect to("/")
    erb :index
  end

  post "/" do
    task_db = TaskList::TaskList.new("tasks.db")
    @maybe_error = task_db.create_task(params[:name], params[:description])
    @tasks = task_db.all_tasks

    erb :index
  end

  get "/complete" do
    task_db = TaskList::TaskList.new("tasks.db")
    @tasks = task_db.all_tasks

    erb :complete_task
  end

  post "/complete" do
    task_db = TaskList::TaskList.new("tasks.db")
    @tasks = task_db.all_tasks

    # {"id"=>{"2"=>"on", "4"=>"on", "7"=>"on"}}
    ids = params[:id]
    ids.each do |id, value_we_dont_care_about|
      task_db.complete_task(id)
    end

    redirect to ("/")
  end

  get "/delete" do
    task_db = TaskList::TaskList.new("tasks.db")
    @tasks = task_db.all_tasks

    erb :delete_task
  end

  post "/delete" do
    task_db = TaskList::TaskList.new("tasks.db")
    @tasks = task_db.all_tasks

    # {"id"=>{"2"=>"on", "4"=>"on", "7"=>"on"}}
    ids = params[:id]
    ids.each do |id, value_we_dont_care_about|
      task_db.delete_task(id)
    end

    redirect to ("/")
  end
end
