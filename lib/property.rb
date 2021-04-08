
require_relative 'database_connection'
require 'pg'


class Property
  
  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = price
  end
  
  def self.all
    properties = DatabaseConnection.query('SELECT * from properties;')
    
    properties.map do |property| 
    Property.new(
       id: property['id'], 
        name: property['name'], 
        description: property['description'],
        price: property['price'].to_i 
      )
    end
  end

  def self.create(name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO properties (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING id, name, description, price;")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end

  def self.find(property_id)
    result = DatabaseConnection.query("SELECT * FROM properties WHERE id = #{property_id};")

    result.map do |property| 
      Property.new(
        id: property['id'], 
        name: property['name'], 
        description: property['description'],
        price: property['price'].to_i 
      )
    end

  end
end

