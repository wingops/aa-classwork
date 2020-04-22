# CREATE TABLE
#     replies(
#         id INTEGER PRIMARY KEY,
#         question_id integer NOT NULL,
#         parent_reply_id integer,
#         author_id integer NOT NULL,
#         body TEXT NOT NULL,
        
#         FOREIGN KEY (question_id) REFERENCES questions(id),
#         FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
#         FOREIGN KEY (author_id) REFERENCES users(id)
#     );

require './likes.rb'
require './question_follows.rb'
require './questions.rb'
require './users.rb'
require './questions_database.rb'

class Reply

	attr_accessor :question_id, :parent_reply_id, :author_id, :body
	attr_reader :id

	def initialize(options)
		@id = options['id']
		@question_id = options['question_id']
		@parent_reply_id = options['parent_reply_id']
		@author_id = options['author_id']
		@body = options['body']
	end

	def self.all
		data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
		data.map {|datum| Reply.new(datum)}
	end

	def self.find_by_id(id)
		data = QuestionsDatabase.instance.execute(<<-SQL, id)
		SELECT
			*
		FROM
			replies
		WHERE id = ?
		SQL
		data.map {|datum| Reply.new(datum)}
	end

	def self.find_by_author_id(user_id)
		data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
			SELECT
				*
			FROM
				replies
			WHERE author_id = ?
		SQL
		data.map { |datum| Reply.new(datum) }
	end

	def self.find_by_question_id(question_id)
		data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
			SELECT
				*
			FROM
				replies
			WHERE
				question_id = ?
		SQL
		data.map { |datum| Reply.new(datum) }
	end


	def author
		User.find_by_id(self.author_id)
	end


	def question
		Question.find_by_id(question_id)
	end


	def parent_reply
		Reply.find_by_id(self.parent_reply_id)
	end

	def child_replies
		data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
		SELECT
			*
		FROM
			replies
		WHERE
			parent_reply_id = ?
		SQL
		data.map { |datum| Reply.new(datum) }
	end

	def save
		if self.id
			QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.author_id, self.body, self.id)
				UPDATE
					replies
				SET
					question_id = ?,
					parent_reply_id = ?,
					author_id = ?,
					body = ?
				WHERE
					id = ?
			SQL
		else
			QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.author_id, self.body)
			INSERT INTO 
				replies (question_id, parent_reply_id, author_id, body)
			VALUES
				(?,?,?,?)
				SQL
		end
	end
end