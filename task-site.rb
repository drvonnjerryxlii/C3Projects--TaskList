require "sinatra"
require "sinatra/reloader"
# require_relative "lib/database"
require_relative "lib/update_database"


class TaskSite < Sinatra::Base
  register Sinatra::Reloader


  get "/" do
    erb :index
  end

  get "/create" do
    erb :create_task
  end

  post "/create" do
    # @name = params[:name]
    # @description = params[:description]
    # {"name"=>"asdf", "description"=>"asdf"}
    TaskList::UpdateDatabase.create_task(params[:name], params[:description])
    erb :create_task
  end

  get "/update" do
    erb :update_task
  end

  post "/update" do
    erb :update_task
  end
end
