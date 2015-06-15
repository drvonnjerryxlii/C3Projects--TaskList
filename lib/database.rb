require 'sqlite3'

module TaskList
  class Database
    attr_reader :database_name, :last_result

    def initialize(database_name)
      @database_name = "db/#{ database_name }"

    end

    private

    def query!(statement, *params)
      db = SQLite3::Database.new database_name
      # we added this line so that we could return the result of performing whatever operation is passed in.
      @last_result = db.execute statement, params
    # rescue SQLite3::Exception => error
      # use this block to recover from an error
      # consider giving the user a special message back
      # inspect the `error` object for information about the error
    ensure
      db.close if db

      # actually return the result now.
      return last_result
    end

  end
end
