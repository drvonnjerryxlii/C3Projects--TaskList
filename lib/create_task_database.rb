require "sqlite3"

# db = SQLite3::Database.open "db/task.db"
db = SQLite3::Database.new "db/tasks.db"

db.execute "CREATE TABLE tasks
        (id INTEGER PRIMARY KEY, name TEXT NOT NULL,
          description TEXT, date_completed TEXT);"

# db.execute "DROP TABLE taskList;"

# db.execute "INSERT INTO taskList (name) VALUES('finishing baseline');"

# results = db.execute "SELECT * FROM taskList"

# puts results

db.close if db
