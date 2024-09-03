-- db/seed.sql

-- Insert default user data
INSERT INTO Users (username, email, password_hash) VALUES
('admin', 'admin@example.com', 'hashed_password'),
('testuser', 'testuser@example.com', 'hashed_password');

-- Insert some initial tasks
INSERT INTO Tasks (user_id, title, description, status, priority, due_date) VALUES
(1, 'Initial Setup', 'Set up the initial project structure', 'pending', 'high', '2024-09-15'),
(2, 'Create Database Schema', 'Design and implement the initial database schema', 'in_progress', 'medium', '2024-09-20');

-- Insert default tags
INSERT INTO Tags (tag_name) VALUES
('Urgent'),
('Work'),
('Personal');

-- Associate tasks with tags
INSERT INTO Task_Tags (task_id, tag_id) VALUES
(1, 1),
(2, 2);
