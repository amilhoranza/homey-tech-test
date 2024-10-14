
# Homey Projects

### Hosted Application
Here is the hosted link to the application
- https://homey.freepostos.com.br

### Test Users
- **Admin:**
  - Email: `amilhoranza@gmail.com`
  - Password: `Pass1234`

- **Regular user:**
  - Email: `user@user.com.br`
  - Password: `Pass1234`

## BONUS
I created also API endpoints to the main features of the project.
- **Authentication:**
   ```bash
   curl --location 'https://homey.freepostos.com.br/api/v1/auth/login' --form 'email="amilhoranza@gmail.com"' --form 'password="Pass1234"'
   ```
- **Create new project:**
   ```bash
   curl --location 'https://homey.freepostos.com.br/api/v1/projects' --header 'Authorization: YOUR_TOKEN_HERE' --header 'Content-Type: application/json' --data '{"name": "Project created via API"}'
   ```

## How to Run the Tests

To run the tests for the Rails application, follow these steps:

### Prerequisites
- Ruby version `3.2.2`
- Rails version `7.1.4`
- PostgreSQL
- RSpec

### Steps

1. **Install Dependencies:**

   Run the following command to install all necessary gems:

   ```bash
   bundle install
   ```

2. **Setup the Test Database:**

   Run the following command to create and migrate the test database:

   ```bash
   rails db:create RAILS_ENV=test
   rails db:migrate RAILS_ENV=test
   ```

3. **Run the Tests:**

   To run all the tests, use the following command:

   ```bash
   rspec
   ```

   Or if you prefer to run individual tests, use:

   ```bash
   rspec spec/path/to/test_file_spec.rb
   ```
