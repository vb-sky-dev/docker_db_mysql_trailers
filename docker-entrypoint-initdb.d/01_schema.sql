USE test_db;

CREATE TABLE user_management (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    country VARCHAR(100),
    user_language VARCHAR(50)
);


CREATE TABLE move_management (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    authors VARCHAR(255),
    relise_year INT,
    rating DECIMAL(3, 2),
    cast_list TEXT,
    image_main VARCHAR(512),
    image_search VARCHAR(512),
    trailer_link VARCHAR(2048),
    watch_legal_resources TEXT
);


CREATE TABLE movie_views (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_management(id),
    FOREIGN KEY (movie_id) REFERENCES move_management(id)
);


CREATE TABLE movie_likes_dislikes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    rating TINYINT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_management(id),
    FOREIGN KEY (movie_id) REFERENCES move_management(id)
);


CREATE TABLE movie_recommendations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_management(id),
    FOREIGN KEY (movie_id) REFERENCES move_management(id)
);


CREATE TABLE movie_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    review_text TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_management(id),
    FOREIGN KEY (movie_id) REFERENCES move_management(id)
);

