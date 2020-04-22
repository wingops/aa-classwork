# CREATE TABLE
#     question_follows(
#         id INTEGER PRIMARY KEY,
#         question_id integer NOT NULL,
#         follower_id integer NOT NULL,
        
#         FOREIGN KEY (question_id) REFERENCES questions(id),
#         FOREIGN KEY (follower_id) REFERENCES users(id)
#     );

# require './likes.rb'
# require './question_follows.rb'
# require './questions.rb'
# require './replies.rb'
require './users.rb'
require './questions_database.rb'

class QuestionFollows

    attr_accessor :question_id, :follower_id
    attr_reader :id
    
#QuestionFollow::followers_for_question_id(question_id)
#   This will return an array of User objects!
    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            question_follows
        JOIN
            users ON users.id = follower_id
        WHERE
            question_id = ?
        SQL
        data.map { |datum| User.new(datum) }
    end
    
#QuestionFollow::followed_questions_for_user_id(user_id)
#   Returns an array of Question objects.
    def self.followed_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            question_follows
        JOIN questions ON question_id = questions.id
        WHERE follower_id = ?
        SQL
        data.map { |datum| Question.new(datum) }
    end

    # QuestionFollow::most_followed_questions(n)
    #     Fetches the n most followed questions.
    def self.most_followed_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT 
            *, COUNT (follower_id) 
        FROM 
            question_follows 
        GROUP BY
            question_id;
        SQL
    end 
end