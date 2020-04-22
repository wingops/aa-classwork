# CREATE TABLE
#     questions(
#         id INTEGER PRIMARY KEY,
#         title VARCHAR (255) NOT NULL,
#         body TEXT NOT NULL,
#         author_id integer NOT NULL,
        
#         FOREIGN KEY (author_id) REFERENCES users(id)
#     );

require './likes.rb'
require './question_follows.rb'
require './replies.rb'
require './users.rb'
require './questions_database.rb'


class Question
  
  attr_accessor :title, :body, :author_id
  attr_reader :id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map {|datum| Question.new(datum)}
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM
      questions
    WHERE
      id = ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  
  # Question#author
  def author
    User.find_by_id(self.id)
  end

  # Question#replies (use Reply::find_by_question_id
  def replies
    Reply.find_by_question_id(self.id)
  end

  # Question#followers
  #   One-liner calling QuestionFollow method.
  def followers
    QuestionFollows.followers_for_question_id(self.id)
  end

  def save
    if self.id
      QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.author_id, self.id)
      UPDATE questions
      SET 
        title = ?,
        body = ?,
        author_id = ?
      WHERE id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.author_id)
      INSERT INTO questions (title, body, author_id)
      VALUES
        (?,?,?)
      SQL
    end
  end
end