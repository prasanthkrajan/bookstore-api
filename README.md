# Bookstore API

### Development Setup

1. Ensure you run `bundle install`, and `rake db:setup`, prior to `rails s`

2. API docs can be accessed at `http://localhost:3000/apipie`

3. Your API should now be running on `localhost:3000`. To test it out, try adding the endpoints below:

4. This API is deployed on, and is accessible at `https://evening-mountain-72578-e052605603a4.herokuapp.com`

5. API docs can be accessed at `https://evening-mountain-72578-e052605603a4.herokuapp.com/apipie`

### API Endpoints

#### GET /api/v1/books

* retrieves all books, by default, title sorted in ascending order
* supports `per_page` and `page` params
* e.g: `GET https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/books`
* e.g: `GET https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/books?per_page=3&page=1`


#### GET /api/v1/books/:id

* retrieves a specific book, and if not found, returns error
* e.g: `GET https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/books/5`

#### POST /api/v1/books/

* creates a book, and if not found, returns error
* e.g: `POST https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/books`

#### PUT /api/v1/books/:id

* looks for a specific book, and if not found, returns error, and once found, performs an update
* e.g: `PUT https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/books/5`


#### DELETE /api/v1/books/:id

* looks for a specific book, and if not found, returns error, and once found, deletes it
* e.g: `DELETE https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/books/5`

#### GET /api/v1/authors

* retrieves all authors
* supports `per_page` and `page` params
* e.g: `GET https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/authors`
* e.g: `GET https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/authors?per_page=5&page=1`


#### GET /api/v1/authors/:id

* retrieves a specific author, and if not found, returns error
* e.g: `GET https://evening-mountain-72578-e052605603a4.herokuapp.com/api/v1/authors/5`


