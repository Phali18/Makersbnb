CREATE TABLE booking_requests (id SERIAL PRIMARY KEY, 
    booking_details VARCHAR(200),
    user_id INT REFERENCES users(id),
    property_id INT REFERENCES properties(id));