require 'sqlite3'
require_relative "database"

module TaskList
  class UpdateDatabase < Database

    def self.create_task(*args)

      #f self.create_task(*args we need to figure out to post the data to the database

      # we need to take the arguments, put them into a SQL query, and then run that query on the database by calling query properly
         #
      # santitize/validate your arguments
      # create_task(params[:name], params[:description])
      name, description = *args


      # prepare your statement
      if description
        statement = "INSERT INTO taskList(name, description)" VALUES(#{ name }, #{ description })"
      else
        statement = "INSERT INTO taskList(name) VALUES(#{ name })"
      end

      # determine what should be returned
      return
    end

    def self.update_task(*args)
      # santitize/validate your arguments

      # prepare your statement

      # call `query!` to interact with the database

      # determine what should be returned
    end

  end # class
end # module
