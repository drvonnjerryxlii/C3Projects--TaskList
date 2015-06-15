require 'sqlite3'
require "pry"

require_relative "database"

module TaskList
  class TaskList < Database

    def all_tasks
      # prepare SQLite3 statement to insert new tasks into our tasks database.
      statment = "SELECT * FROM tasks"

      # call query! on the statement. query! will return the result of performing the given statement on our tasks database.
      query!(statment)
    end

    def create_task(*args)
      # santitize/validate your arguments
      name, description = *args

      # prepare SQLite3 statement to insert new tasks into our tasks database.
      if description && name != ""
        statement = "INSERT INTO tasks(name, description) VALUES(\"#{ name }\", \"#{ description }\");"
      elsif name != ""
        statement = "INSERT INTO tasks(name) VALUES('#{ name }')"
      else
        begin
          raise
        rescue
          return "Task not created: Don't leave the name of the task blank!"
        end
      end

      # binding.pry

      # call query! on the statement. query! will return the result of performing the given statement on our tasks database.
      query!(statement)
    end

    def update_task(*args)
      # santitize/validate your arguments
      # prepare your statement
      # call `query!` to interact with the database
      # determine what should be returned
    end
  end # class
end # module
