
# Homey Projects

### Deployed Project
Here are the hosted link to the application
- https://homey.freepostos.com.br

### Test Users
- **Admin:**
  - Email: `amilhoranza@gmail.com`
  - Password: `Pass1234`

- **Regular user:**
  - Email: `user@user.com.br`
  - Password: `Pass1234`

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
