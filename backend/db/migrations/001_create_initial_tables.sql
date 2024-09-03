-- db/migrations/001_create_initial_tables.sql

-- Add a new column to the Users table
ALTER TABLE Users ADD COLUMN profile_picture VARCHAR(255);

-- Create a new table for storing user preferences
CREATE TABLE User_Preferences (
    preference_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    preference_name VARCHAR(100) NOT NULL,
    preference_value TEXT
);
