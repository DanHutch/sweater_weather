# README
## Sweater Weather

Sweater Weather is a Ruby on Rails API that provides Fast JsonAPI formatted endpoints for weather data, based on location. This app uses the Google geo-coding API to return geographical coordinates for a location, and the Dark Sky weather API to return weather data, based on coordinates. It was built by Dan Hutchinson (github: DanHutch) as a final solo project for Module 3 of the Back-End Engineering program at the Turing School.

This project was built using Rails v5.2.2,  Ruby v2.4.1, and PostgresQL v11.1 and comes with all the necessary gems in the Gemfile. After forking and cloning the repo, simply run `bundle` from the command line.

### Setup:

First, clone this repo:

```
git clone git@github.com:DanHutch/sweater_weather.git
```
Then, run `bundle` from the command line, from within the project directory. Then, you can create the database and schema using `rake db:{create,migrate}`.

If done properly, you should now be able to run the local test suite using the command `bundle exec rspec`.

*This app requires API keys for both the Google geocoding API and the Dark Sky weather API in order to function. In the development of Sweater Weather, `gem 'figaro'` was used to hide API keys in testing and development, and is recommended for this purpose.*

Once API keys have been properly stored in the environment, you can delete the spec casettes and run `bundle exec rspec` to verify service functionality.

### Gems:

- rails
- bcrypt
- pry
- pg
- puma
- fast_jsonapi
- faraday
- figaro
- bootsnap
- byebug
- fuubar
- rspec-rails
- shoulda-matchers
- simplecov
- vcr
- webmock
- listen
- spring
- spring-watcher-listen
- tzinfo-data

### Schema:

![Schema Diagram](./schema_diagram.png)

### API Endpoints:

1. **Weather for a City**
   - Method: `GET`
   - URI: `/api/v1/forecast`
   - This endpoint returns weather data for the specified location.
   - Sample request:
     ```
     GET /api/v1/forecast?location=denver,co
     Content-Type: application/json
     Accept: application/json
     ```
   - Sample response body (abridged): `status: 200`

     ![sample weather response](./sample_weather_response.png)

2. **Account Creation**
   - Method: `POST`
   - URI: `/api/v1/users`
   - This endpoint allows creation of a User entry/account by sending user `email:`, `password:`, and matching `password_confirmation:` in the body of a `post` request.
   - Sample request:
     ```
     POST /api/v1/users
     Content-Type: application/json
     Accept: application/json

     {
       "email": "whatever@example.com",
       "password": "password"
       "password_confirmation": "password"
     }
     ```
   - Sample response body: `status: 201`

     ![sample user create response](./sample_user_create_response.png)

3. **Login**
   - Method: `POST`
   - URI: `/api/v1/sessions`
   - This endpoint allows user login (creation of a session) by sending a valid user `email:` and `password:` in the body of a `post` request.
   - Sample request:
     ```
     POST /api/v1/sessions
     Content-Type: application/json
     Accept: application/json

     {
       "email": "whatever@example.com",
       "password": "password"
     }
     ```
   - Sample response body: `status: 200`

     ![sample user create response](./sample_user_create_response.png)

4. **Favoriting Locations**
   - Method: `POST`
   - URI: `/api/v1/favorites`
   - This endpoint allows creation of a user favorite (location) by sending a `location:` (i.e. `"denver, co"`) along with a valid user `api_key:` in the body of a `post` request.
   - Sample request:
     ```
     POST /api/v1/favorites
     Content-Type: application/json
     Accept: application/json

     {
       "location": "Denver, CO",
       "api_key": "jgn983hy48thw9begh98h4539h4"
     }
     ```
   - Sample response body: `status: 201`

     ![sample favorite create response](./sample_favorite_create_response.png)

5. **Listing Favorite Locations**
   - Method: `GET`
   - URI: `/api/v1/favorites`
   - This endpoint returns a user's favorited locations, along with weather data for those locations, by sending a valid user `api_key:` in the body of a `get` request.
   - Sample request:
     ```
     GET /api/v1/favorites
     Content-Type: application/json
     Accept: application/json

     {
       "api_key": "jgn983hy48thw9begh98h4539h4"
     }
     ```
   - Sample response body (abridged): `status: 200`

     ![sample favorites response](./sample_favorites_response.png)

6. **Removing Favorite Locations**
   - Method: `DELETE`
   - URI: `/api/v1/favorites`
   - This endpoint deletes a user favorite entry by sending a favorite `location:`, along with a valid user `api_key:` in the body of a `delete` request. It returns a response with an empty body (status code `204`).
   - Sample request:
     ```
     DELETE /api/v1/favorites
     Content-Type: application/json
     Accept: application/json

     {
       "location": "Denver, CO",
       "api_key": "jgn983hy48thw9begh98h4539h4"
     }
     ```
   - Response status: `204` (`No Content`)

### Contributing:

In order to contribute, please fork this repo, then clone your new repo and create a branch for your feature.

Please make sure to test your feature fully, using RSpec, before commiting your changes and pushing to your own repo, then create and submit a pull request back to this repository.

Please contact Dan Hutchinson (DanHutch) via GitHub, if you have any questions, etc.
