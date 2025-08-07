# Scooby Doo Mystery Tracker

## Learning Goals

- Build a Sinatra API backend using Active Record
- Design and interact with RESTful routes
- Implement object-oriented Ruby code in a CLI frontend
- Practice working with JSON and making HTTP requests from Ruby

## Introduction

Congrats on getting through all the material for Phase 3! You’ve learned how to work with databases, build web APIs with Sinatra, and design models with Active Record. Now it’s time to bring those skills together into a full project.

This project will focus on building a backend API with Sinatra and Active Record and consuming that API with a Ruby command-line application (CLI).

By the end of the project, you’ll have a functioning API and a CLI interface that lets users interact with it by creating, viewing, updating, and deleting records from the terminal.

## Requirements

For this project, you must:

### Backend

- Use Sinatra and Active Record to build a JSON API
- Create at least two models with a one-to-many relationship
- Expose RESTful routes for both models:
  - Full CRUD for one model
  - Read + Create at minimum for the second model
  - Your update action must include a prompt for the current values (retrieved from the API), allowing the user to change them via the CLI.
- Send associated data as JSON from your backend where appropriate (e.g., has_many relationships)

### Frontend (CLI)

- Build a Ruby CLI frontend that interacts with your API via HTTP requests
- Implement at least the following actions in your CLI:
  - Create a record
  - View all records
  - Update a record
  - Delete a record
- Your CLI should:
  - Be object-oriented (with at least two classes)
  - Parse and display JSON responses in a readable format
  - Accept user input and use it to send requests to your API
  - Use a loop or menu interface for interaction

## Planning

- Plan out your features
- Develop user stories
  - "As [ a user ], I want [ to perform this action ] so that [ I can accomplish this goal ]."
  - Features should not need you there to explain them to users
  - Create a `user-stories.md` file and add your user stories there

## Project Pitches

Before you start working on your project, you'll pitch your project idea to your instructors for approval and feedback.

For your project pitch, you should include:

- The basic story of your application
- The core features of your MVP
- The data you plan to persist and how you will structure it
- Challenges you expect to face
- How you are meeting the requirements of the project

**MVP ASAP** - Focus on getting your minimum viable product working first!

## Example Project Domain

You could build a Book Tracker app:

- `Author` has many `Books`
- Users can:
  - Create a new book
  - List all books
  - Update book details
  - Delete a book
  - View books by a specific author

Or a Workout Log:

- `WorkoutSession` has many `Exercises`
- Users can:
  - Log a new workout
  - Add exercises
  - Update reps/weights
  - View or delete past workouts

## Getting Started

### Step 1: Backend Setup

This repository has all the starter code needed to get a Sinatra backend up and
running. **Fork and clone** this repository to get started. Then, run:

```bash
bundle install
bundle exec rackup
```

This will start your API at http://localhost:9292.

Set up your database, models, migrations, and controllers in the provided structure. Use Postman or curl to test your routes during development.

**Important**: Be sure you fork a copy of the repo into your GitHub account
before cloning it. You can do this by using the link above or by clicking the
"Octocat" button at the top of this page, then clicking "Fork" in the upper
right corner of the repo page.

### Step 2: CLI Setup

Build your CLI application in the `cli/` directory:

1. Make sure your Sinatra API server is running:

   ```bash
   bundle exec rackup
   ```

2. Inside the `cli/` directory, create the files for your CLI app.

3. Use RestClient or Net::HTTP to make requests to your API.

4. Make sure your CLI uses `gets.chomp`, loops, and conditionals to prompt users and respond accordingly.

5. Run your CLI application:
   ```bash
   ruby cli/main.rb
   ```

Your CLI must:

- Be object-oriented (at least two classes)
- Make HTTP requests to your Sinatra API
- Parse and display JSON responses
- Accept user input and use it to send requests
- Use a loop or menu interface
- Include current value prompts for updates

## Project Tips

- Sketch your domain model first
- Test API endpoints with Postman or curl before building the CLI
- Use `binding.pry` for debugging server-side code
- Use puts and `pp` or gems like `tty-table` for CLI output

## Sample Project

A complete implementation is available on the `sample-project` branch. It demonstrates:

- **Pet Tracker** domain with Owners and Pets
- Full CRUD API with JSON responses and associated data
- Object-oriented CLI with RestClient and user-friendly interface
- All required features including current value prompts for updates

To view the sample:

```bash
git checkout sample-project
```

See `SAMPLE_PROJECT_README.md` for detailed documentation.

## Resources

- [dbdiagram.io][]
- [Postman][postman download]

[dbdiagram.io]: https://dbdiagram.io/
[postman download]: https://www.postman.com/downloads/
