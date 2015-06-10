require "sinatra"
require "sinatra/reloader"


class TaskSite < Sinatra::Base
  register Sinatra::Reloader

end