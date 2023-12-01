# README

## Local development

This library management system with user and librarian functionalities.
It facilitates user registration, authentication, book searches, check-outs, returns, and account management.
Librarians have additional capabilities such as user search, book management, and overseeing overdue books.

- Create a `.env` file inside the root directory to set environment variables needed for Google Login (compare `.env.example`)

- Setup the pre-commit hook:

  ```shell
  cp scripts/git_hooks/pre-commit .git/hooks/
  chmod +x .git/hooks/pre-commit
  ```

- Run `docker compose up`.
- To run the tests: `RAILS_ENV=test bundle exec rspec` within the rails container.
