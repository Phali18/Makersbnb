require_relative 'database_connection'
require 'pg'

class Property

  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.create(name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO properties (name, description, price) VALUES(‘#{name}', ‘#{description}', ‘#{price}’) RETURNING id, name, description, price;")
      Property.new(
        id: result[0]['id'],
        name: result[0]['name'],
        description: result[0]['description'],
        price: result[0]['price']
      )
  end
end
