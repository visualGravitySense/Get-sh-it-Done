-- Create Users table to store user information and settings
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Tasks table to store task-related information
CREATE TABLE Tasks (
    task_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(20) CHECK (status IN ('pending', 'in_progress', 'completed', 'archived')) DEFAULT 'pending',
    priority VARCHAR(10) CHECK (priority IN ('low', 'medium', 'high')) DEFAULT 'medium',
    due_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Task_History table to log changes to tasks for audit and history tracking
CREATE TABLE Task_History (
    history_id SERIAL PRIMARY KEY,
    task_id INT REFERENCES Tasks(task_id) ON DELETE CASCADE,
    change_description TEXT NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Notifications table to store notifications for tasks and user preferences
CREATE TABLE Notifications (
    notification_id SERIAL PRIMARY KEY,
    task_id INT REFERENCES Tasks(task_id) ON DELETE CASCADE,
    notification_type VARCHAR(50) CHECK (notification_type IN ('reminder', 'deadline', 'custom')) NOT NULL,
    notification_message TEXT NOT NULL,
    scheduled_time TIMESTAMP NOT NULL,
    sent BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create User_Notifications table to manage user-specific notification settings
CREATE TABLE User_Notifications (
    user_notification_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    notification_id INT REFERENCES Notifications(notification_id) ON DELETE CASCADE,
    notification_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Tags table to support tagging of tasks for categorization
CREATE TABLE Tags (
    tag_id SERIAL PRIMARY KEY,
    tag_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create Task_Tags table to manage many-to-many relationship between tasks and tags
CREATE TABLE Task_Tags (
    task_tag_id SERIAL PRIMARY KEY,
    task_id INT REFERENCES Tasks(task_id) ON DELETE CASCADE,
    tag_id INT REFERENCES Tags(tag_id) ON DELETE CASCADE
);
