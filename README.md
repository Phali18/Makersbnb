# MakersBnB - Team Fire 

This is a web application which acts as a clone of Airbnb. A user can list a property that they own to be booked, and also make bookings for available listings.

## Headline Specifications

– A user can create an account or sign in with their existing account credentials

– A user with an account can list a property with a name, description and price

– A user can add a range of dates when the property is available for booking

– A user can edit the property they have listed

- A user with an account can request to book a property for a specified duration, which is pending approval from the host

- Until the status of the booking is confirmed, the property should still be available for booking requests

## User Stories

```
As a user who owns a property
So that I add a listing
I would like to create an account
```

```
As a user who owns a property
In order to host my property on the website
I would like to add my property to the listings
```
```
As a user who owns a property
So I can see what listings I have on the site
I would like to see all of my properties
```

```
As a user who owns a property
So customers can see when the property is available
I would like to offer a range of dates when the space is available 
```

```
As an user who owns multiple properties 
In order to host them all 
I would like to add more than one listing to my account 
```

```
As a user who owns a property
To update my customers
I would like make any changes to my properties 
```

```
As a user who owns a property
So that I can rent out my space
I would like to approve any rental requests
```

```
As a user
So I can hire a space 
I would like to create an account 
```

```
As a user
To see what properties are available
I want to see a list of all properties 
```

```
As a user 
So that I can see more details on a property
I would like to view information about a specific property 
```

```
As a user 
So that I have somewhere to stay
I would like to request to book a property 
```

```
As a user
So I can see my existing requests
I would like to be presented with a list of requests I have made on my account
```

Stretch 

```
As a B&B owner
In order to prevent booking clashes 
I would like the space to be unavailable for booking when it is confirmed 
```

```
As a B&B owner 
So that my property remains available until I approve a request
I would like the property to remain available until I confirm any booking requests 
```

```
As a b&b owner 
In order to advertise my property 
```
# Set Up

## Database setup
Here is how to set up the databases for this project:
1. Start postgres in the terminal
```
psql postgres
```

2. Create the original database - makersbnb

```
CREATE DATABASE makersbnb;
```
3. Connect to the database

``` 
\c makersbnb
```

4. Add the table for properties
```
CREATE TABLE properties (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(140), price NUMERIC);
```
5. Add the table for users
```
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60), user_id INTEGER REFERENCES users (id));
```

6. Add a table for booking requests
```
CREATE TABLE booking_requests (id SERIAL PRIMARY KEY, booking_details VARCHAR(200), user_id INT REFERENCES users(id), property_id INT REFERENCES properties(id));
```
7. Create the test database
```
CREATE DATABASE makersbnb_test;
```

8. Repeat steps 3 - 6 for the test database

## Gemfile setup

Here are the gems used for this project:

```
source 'https://rubygems.org'

gem 'bcrypt'
gem 'capybara'
gem 'pg'
gem 'rspec'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
```