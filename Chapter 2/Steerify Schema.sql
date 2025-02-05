CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    user_type ENUM('BusinessOwner', 'Investor', 'Customer') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, password_hash, user_type) VALUES
('John Doe', 'john@example.com', 'hashed_password', 'Investor'),
('Jane Smith', 'jane@example.com', 'hashed_password', 'BusinessOwner'),
('Mike Johnson', 'mike@example.com', 'hashed_password', 'Customer');


CREATE TABLE businesses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    business_name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    price_range VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO businesses (owner_id, business_name, category, location, price_range) VALUES
(2, 'Tech Innovations', 'Technology', 'Lagos, Nigeria', '₦500,000 - ₦1,000,000');


CREATE TABLE startups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    business_id INT NOT NULL,
    valuation DECIMAL(15,2) NOT NULL,
    funding_stage ENUM('Seed', 'Series A', 'Series B', 'Series C') NOT NULL,
    funds_raised DECIMAL(15,2) DEFAULT 0,
    ai_optimized_valuation DECIMAL(15,2) DEFAULT NULL,  -- AI-Suggested Price
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE
);


INSERT INTO startups (business_id, valuation, funding_stage, funds_raised) VALUES
(1, 5000000, 'Seed', 2000000);



CREATE TABLE investments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    investor_id INT NOT NULL,
    business_id INT NULL,  -- Can be NULL if investing in a startup
    startup_id INT NULL,   -- Can be NULL if investing in a regular business
    amount DECIMAL(15,2) NOT NULL,
    expected_roi DECIMAL(5,2) NOT NULL,
    funding_stage ENUM('Seed', 'Series A', 'Series B', 'Series C') DEFAULT NULL,
    ai_predicted_roi DECIMAL(5,2) DEFAULT NULL,  -- AI ROI Suggestion
    ai_fraud_alert BOOLEAN DEFAULT FALSE,  -- AI Fraud Detection
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (investor_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE,
    FOREIGN KEY (startup_id) REFERENCES startups(id) ON DELETE CASCADE
);

INSERT INTO investments (investor_id, startup_id, amount, expected_roi, funding_stage) VALUES
(1, 1, 1000000, 15.5, 'Seed');




CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    payment_method ENUM('Credit Card', 'Bank Transfer', 'Crypto') NOT NULL,
    status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO transactions (user_id, amount, payment_method, status) VALUES
(1, 5000, 'Credit Card', 'Completed');




CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    business_id INT NULL,  -- Can be NULL if reviewing a startup
    startup_id INT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    ai_sentiment VARCHAR(10) DEFAULT NULL,  -- AI: 'Positive', 'Negative', 'Neutral'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE,
    FOREIGN KEY (startup_id) REFERENCES startups(id) ON DELETE CASCADE
);

INSERT INTO reviews (user_id, business_id, rating, comment) VALUES
(3, 1, 5, 'Excellent startup, great investment opportunity!');




CREATE TABLE ai_recommendations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    recommended_business_id INT NULL,
    recommended_startup_id INT NULL,
    ai_confidence_score DECIMAL(5,2) NOT NULL,  -- AI Confidence in Recommendation
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (recommended_business_id) REFERENCES businesses(id) ON DELETE CASCADE,
    FOREIGN KEY (recommended_startup_id) REFERENCES startups(id) ON DELETE CASCADE
);

INSERT INTO ai_recommendations (user_id, recommended_startup_id, ai_confidence_score) VALUES
(1, 1, 89.5);
