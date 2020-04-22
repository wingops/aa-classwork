# CREATE TABLE
#     users(
#     id INTEGER PRIMARY KEY,
#     fname VARCHAR (255) NOT NULL,
#     lname VARCHAR (255) NOT NULL
#     );

# require './likes.rb'
# require './question_follows.rb'
require './questions.rb'
# require './replies.rb'
# require './questions_database.rb'

# require 'singleton'
# require 'sqlite3'
# class QuestionsDatabase < SQLite3::Database
#     include Singleton

#     def initialize
#         super('questions.db')
#         self.type_translation = true
#         self.results_as_hash = true
#     end
# end

class User 

    attr_accessor :fname, :lname, :id
    # attr_reader :id

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map {|datum| User.new(datum)}
    end

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT 
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        data.map {|datum| User.new(datum) }
    end

    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT 
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        data.map {|datum| User.new(datum)}
    end

    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE fname = ? AND lname = ?
        SQL
        data.map { |datum| User.new(datum) }
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_author_id(self.id)
    end
   
    # User#followed_questions
        # One-liner calling QuestionFollow method.
    def followed_questions
        QuestionFollows.followed_questions_for_user_id(self.id)
    end

    def save
        if self.id
            QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
                UPDATE users
                SET 
                    fname = ?,
                    lname = ?
                WHERE id = ?
            SQL
        else
            QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
            INSERT INTO
                users (fname, lname)
            VALUES
                (?,?)
            SQL
        end
    end
end