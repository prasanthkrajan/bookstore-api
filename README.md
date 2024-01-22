# Bookstore API

### Development Setup

1. Ensure you run `bundle install`, and `rake db:setup`, prior to `rails s`

2. API docs can be accessed at `http://localhost:3000/apipie`

3. Your API should now be running on `localhost:3000`. To test it out, try adding the endpoints below:

### API Endpoints

#### GET /api/v1/books

* retrieves all books, by default, title sorted in ascending order
* e.g: `GET http://localhost:3000/api/v1/books`


#### GET /api/v1/books/:id

* retrieves a specific book, and if not found, returns error
* e.g: `GET http://localhost:3000/api/v1/books/5`

#### POST /api/v1/books/

* creates a book, and if not found, returns error
* e.g: `POST http://localhost:3000/api/v1/books`

#### PUT /api/v1/books/:id

* looks for a specific book, and if not found, returns error, and once found, performs an update
* e.g: `PUT http://localhost:3000/api/v1/books/:id`


#### DELETE /api/v1/books/:id

* looks for a specific book, and if not found, returns error, and once found, deletes it
* e.g: `DELETE http://localhost:3000/api/v1/books/:id`




