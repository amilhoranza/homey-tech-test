
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

## Questions I Would Ask My Colleagues:

	1.	How should the project statuses be structured?
	-	Expected answer: “The project can have statuses like ‘pending’, ‘in_progress’, ‘completed’, and ‘archived’.”
	2.	Should there be any validation or restriction on who can change the project status?
	-	Expected answer: “Yes, only users with admin roles can change the project status.”
	3.	What kind of users are involved in this project conversation history?
	-	Expected answer: “There are two types of users: regular users (who can comment) and admins (who can comment and change statuses).”
	4.	How should the conversation history be structured? Should both comments and status changes be mixed chronologically in the same list?
	-	Expected answer: “Yes, both comments and status changes should be displayed chronologically in one list.”
	5.	Is there any requirement regarding the format of the conversation history (e.g., timestamps, user names, etc.)?
	-	Expected answer: “Yes, each item in the history should display the timestamp, the user who made the change, and the content of the comment or status change.”
	6.	Should comments or status changes be editable or deletable after being created?
	-	Expected answer: “No, once a comment or status change is made, it cannot be edited or deleted.”
	7.	Should there be any notifications or other side effects when a status is changed?
	-	Expected answer: “Not for now. Just logging the change in the history is enough.”
	8.	Do we need any user authentication and roles setup for this project?
	-	Expected answer: “Yes, implement basic authentication with admin and regular user roles.
 
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
