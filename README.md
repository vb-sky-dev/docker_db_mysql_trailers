# Movie Database Project

This repository contains the files for setting up a movie database using MySQL, including sample data and a pre-configured Docker Compose setup with phpMyAdmin.

## Project structure

    project
    ├── docker-compose.yml
    └── docker-entrypoint-initdb.d
        ├── schema.sql
        └── data.sql

## Files

- `schema.sql`: Contains the SQL commands for creating the necessary tables for the movie database.
- `data.sql`: Contains sample data for populating the movie database tables.
- `docker-compose.yml`: Docker Compose configuration file for setting up a MySQL container and phpMyAdmin.

## Getting Started

1. Clone this repository to your local machine
2. cd in project directory
3. Start the Docker Compose setup:

docker-compose up -d


4. Access phpMyAdmin at `http://localhost:8080` in your web browser. Use the following credentials to log in:
- Username: `root`
- Password: `root`

## Modifying the Schema and Data

To modify the schema or add new tables, edit the `schema.sql` file in the `docker-entrypoint-initdb.d` directory.

To modify the sample data or add new data, edit the `data.sql` file in the `docker-entrypoint-initdb.d` directory.

**Note**: If you modify the schema or data files while the containers are running, you'll need to stop and remove the containers, then restart them to apply the changes:


## Tables and Relationships

The movie database consists of the following tables:

1. `user_management`: Stores information about users, including their name, email, phone number, and language preferences.
2. `move_management`: Stores information about movies, such as title, authors, year, rating, and images.
3. `movie_views`: Keeps track of movies viewed by users, including the user ID, movie ID, and timestamp of the view.
4. `movie_likes_dislikes`: Stores users' likes and dislikes for movies, including the user ID, movie ID, like/dislike status, and timestamp.
5. `movie_recommendations`: Contains movie recommendations for users, including the user ID, movie ID, and timestamp of the recommendation.
6. `movie_reviews`: Stores movie reviews written by users, including the user ID, movie ID, review text, and timestamp.

The tables are related through foreign key constraints:


    +-------------------+    +-------------------+
    |  user_management  |    |  move_management  |
    +--------+----------+    +--------+----------+
    |  id    |  (PK)    |    |  id    |  (PK)    |
    +--------+----------+    +--------+----------+
           ^                      ^
           |                      |
    +------|------+        +------|------+        +-------------------+
    | movie_views |        |movie_likes_dislikes |movie_recommendations  |
    +------+------+        +------+------+        +-------------------+
    |  id  | (PK) |        |  id  | (PK) |        |  id  |  (PK)      |
    +------+------+        +------+------+        +-------------------+
    | user_id (FK)|        |user_id (FK)|         | user_id |  (FK)   |
    +------+------+        +------+------+        +-------------------+
    |movie_id (FK)|        |movie_id (FK)|        |movie_id |  (FK)   |
    +------+------+        +------+------+        +-------------------+
           |                      |                      |
           v                      v                      v
    +-------------------+ +-------------------+ +-------------------+
    |  movie_reviews    | |   movie_views     | | movie_recommendations|
    +--------+----------+ +--------+----------+ +--------+----------+
    |  id    |  (PK)    | |  id    |  (PK)    | |  id    |  (PK)    |
    +--------+----------+ +--------+----------+ +--------+----------+
    | user_id |  (FK)   | |user_id |  (FK)    | |user_id |   (FK)   |
    +--------+----------+ +--------+----------+ +--------+----------+
    | movie_id |  (FK)  | |movie_id|  (FK)    | |movie_id|    (FK)  |
    +--------+----------+ +--------+----------+ +--------+----------+


## Database Relationships
In the movie database schema, there are several relationships between the tables:

One-to-Many relationships:
1. user_management to movie_views: One user can have many movie views, but each movie view is associated with only one user.
2. user_management to movie_likes_dislikes: One user can like/dislike many movies, but each like/dislike is associated with only one user.
3. user_management to movie_recommendations: One user can have many movie recommendations, but each recommendation is associated with only one user.
4. user_management to movie_reviews: One user can write many movie reviews, but each review is associated with only one user.
5. move_management to movie_views: One movie can be viewed by many users, but each movie view is associated with only one movie.
6. move_management to movie_likes_dislikes: One movie can be liked/disliked by many users, but each like/dislike is associated with only one movie.
7. move_management to movie_recommendations: One movie can be recommended to many users, but each recommendation is associated with only one movie.
8. move_management to movie_reviews: One movie can have many reviews, but each review is associated with only one movie.

Many-to-Many relationships:
There are no direct many-to-many relationships in this schema. However, the relationship between user_management and move_management can be considered many-to-many through the use of intermediary tables (movie_views, movie_likes_dislikes, movie_recommendations, and movie_reviews). A user can view, like, dislike, or review many movies, and a movie can be viewed, liked, disliked, or reviewed by many users.
