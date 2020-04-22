# CREATE TABLE
#     likes(
#         id INTEGER PRIMARY KEY,
#         user_id integer NOT NULL,
#         question_id integer NOT NULL,
        
#         FOREIGN KEY (user_id) REFERENCES users(id),
#         FOREIGN KEY (question_id) REFERENCES questions(id)
#     );

require './question_follows.rb'
require './questions.rb'
require './replies.rb'
require './users.rb'
require './questions_database.rb'

