require 'pg'
# require_relative 'database_connection'

class Property
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'makersbnb_test')
        else
            connection = PG.connect(dbname: 'makersbnb')
        end
        properties = connection.exec('SELECT * from properties;')
        properties.map { |property| property ['name'] }

    end
end 
