require 'singleton'
require 'sqlite3'
require './likes.rb'
require './question_follows.rb'
require './questions.rb'
require './replies.rb'
require './users.rb'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end