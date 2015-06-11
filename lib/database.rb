require 'sqlite3'

module TaskList
  class Database
    attr_reader :database_name, :last_result

    def initialize(database_name)
      @database_name = "db/#{ database_name }"

    end

    # def try_create_db
    #   db = SQLite3::Database.new database_name
    #   db.execute "CREATE TABLE tasks
    #     (id INTEGER PRIMARY KEY, name TEXT NOT NULL,
    #       description TEXT, date_completed TEXT);"
    #   db.close if db
    # end

    private

    def query!(statement, *params)
      db = SQLite3::Database.new database_name # we changed this to an instance variable & to use open, because otherwise it doesn't make sense.
      @last_result = db.execute statement, params
    rescue SQLite3::Exception => error
      # use this block to recover from an error
      # consider giving the user a special message back
      # inspect the `error` object for information about the error
    ensure
      db.close if db
      return last_result
    end

  end
end











