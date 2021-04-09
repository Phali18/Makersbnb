
require_relative 'database_connection'
require 'pg'


class Property
  
  attr_reader :id, :name, :description, :price, :user_id

  def initialize(id:, name:, description:, price:, user_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @user_id = user_id
  end
  
  def self.all
    properties = DatabaseConnection.query('SELECT * from properties;')
    
    properties.map do |property| 
    Property.new(
       id: property['id'], 
        name: property['name'], 
        description: property['description'],
        price: property['price'].to_i,
        user_id: property['user_id'].to_i 
      )
    end
  end

  def self.create(user_id:, name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO properties (user_id, name, description, price) VALUES('#{user_id}','#{name}', '#{description}', '#{price}') RETURNING id, user_id, name, description, price;")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'].to_i, user_id: result[0]['user_id'].to_i,)
  end

  def self.update(id:, name:, description:, price:)
    result = DatabaseConnection.query("UPDATE properties SET name='#{name}', description='#{description}', price='#{price}' WHERE id='#{id}' RETURNING id, name, description, price;")
    Property.new(user_id: result[0]['user_id'], id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM properties WHERE id = #{id};")
    property = result.map do |property|
      Property.new(
        id: property['id'], 
        name: property['name'], 
        description: property['description'],
        price: property['price'].to_i,
        user_id: property['user_id'].to_i
      )
     end.first
  end
end

