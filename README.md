# Rails + Hotwire Template

![CI](https://github.com/rootstrap/rails_hotwire_base/workflows/CI/badge.svg)
[![Code Climate](https://api.codeclimate.com/v1/badges/6b4e50e445c617d9f25d/maintainability)](https://codeclimate.com/github/rootstrap/rails_hotwire_base/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/6b4e50e445c617d9f25d/test_coverage)](https://codeclimate.com/github/rootstrap/rails_hotwire_base/test_coverage)

Rails + Hotwire Base is a boilerplate project for full-stack Rails apps with a modern SPA-like experience. It follows the community best practices in terms of standards, security and maintainability, integrating a variety of testing and code quality tools. It's based on Rails 6 and Ruby 3.0.

Finally, it contains a plug and play Administration console (thanks to [ActiveAdmin](https://github.com/activeadmin/activeadmin)).

## Features

This template comes with:
- Schema
  - Users table
  - Admin users table
- Endpoints
  - Sign up with user credentials
  - Sign in with user credentials
  - Sign out
  - Reset password
  - Show and update user profile
- Administration panel for users
- Rspec tests
- Code quality tools
- Docker support

## How to use

1. Clone this repo
1. Install PostgreSQL in case you don't have it
1. Run `bootstrap.sh` with the name of your your project like `./bootstrap.sh my_awesome_project`
1. `rspec` and make sure all tests pass
1. `rails s`
1. You can now try your app!

## How to use with docker

1. Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)
2. Modify the following lines in the `database.yml` file:
  ``` yaml
  default: &default
    adapter: postgresql
    encoding: unicode
    pool: 5
    username: postgres
    password: postgres
    host: db
    port: 5432
  ```
3. Generate a secret key for the app by running `docker-compose run --rm --entrypoint="" web rake secret`, copy it and add it in your environment variables.
4. Run `docker-compose run --rm --entrypoint="" web rails db:create db:migrate`.
   1. (Optional) Seed the database with an AdminUser for use with ActiveAdmin by running `docker-compose run --rm --entrypoint="" web rails db:seed`. The credentials for this user are: email: `admin@example.com` ; password: `password`.
5. (Optional) If you want to deny access to the database from outside of the `docker-compose` network, remove the `ports` key in the `docker-compose.yml` from the `db` service.
6. (Optional) Run the tests to make sure everything is working with: `docker-compose run --rm --entrypoint="" web rspec .`.
7. Run the application with `docker-compose up`.
8. You can now try your app!

## Gems

- [ActiveAdmin](https://github.com/activeadmin/activeadmin) for easy administration
- [Annotate](https://github.com/ctran/annotate_models) for doc the schema in the classes
- [Better Errors](https://github.com/charliesome/better_errors) for a better error page
- [Brakeman](https://github.com/presidentbeef/brakeman) for static analysis security
- [Bullet](https://github.com/flyerhzm/bullet) help to kill N+1
- [DelayedJob](https://github.com/collectiveidea/delayed_job) for background processing
- [Devise](https://github.com/heartcombo/devise) for basic auth
- [Dotenv](https://github.com/bkeepers/dotenv) for handling environment variables
- [Draper](https://github.com/drapergem/draper) for decorators
- [Factory Bot](https://github.com/thoughtbot/factory_bot) for testing data
- [Faker](https://github.com/stympy/faker) for generating test data
- [Flipper](https://github.com/jnunemaker/flipper) for feature flags
- [Letter Opener](https://github.com/ryanb/letter_opener) for previewing a mail in the browser
- [Omniauth Google Oauth2](https://github.com/zquestz/omniauth-google-oauth2) for Google Sign Up/Sign in
- [Pagy](https://github.com/ddnexus/pagy) for pagination
- [Pry](https://github.com/pry/pry) for enhancing the ruby shell
- [Puma](https://github.com/puma/puma) for the server
- [Pundit](https://github.com/varvet/pundit) for authorization management
- [Rails Best Practices](https://github.com/flyerhzm/rails_best_practices) for rails linting
- [Reek](https://github.com/troessner/reek) for ruby linting
- [RSpec](https://github.com/rspec/rspec) for testing
- [Rubocop](https://github.com/bbatsov/rubocop/) for ruby linting
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) adds other testing matchers
- [Simplecov](https://github.com/colszowka/simplecov) for code coverage
- [Webmock](https://github.com/bblimke/webmock) for stubbing http requests
- [YAAF](https://github.com/rootstrap/yaaf) for form objects

## Optional configuration

- Set your mail sender in `config/initializers/devise.rb`
- Config your timezone accordingly in `application.rb`.

# Hotwire with Redis

[Turbo Streams](https://github.com/hotwired/turbo-rails#turbo-streams) uses [Action Cable](https://guides.rubyonrails.org/action_cable_overview.html) to deliver asynchronous updates to subscribers. This feature allows the user to receive live updates through websockets.

Action Cable relies on `redis` as [subscription adapter](https://guides.rubyonrails.org/action_cable_overview.html#subscription-adapter) for production environment.

With just a little configuration you can make it work.

```yaml
# config/cable.yml

production:
  adapter: redis
  url: <%= ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" } %>
```

## Code quality

With `rails code_analysis` you can run the code analysis tool, you can omit rules with:

- [Rubocop](https://github.com/bbatsov/rubocop/blob/master/config/default.yml) Edit `.rubocop.yml`
- [Reek](https://github.com/troessner/reek#configuration-file) Edit `.reek.yml`
- [Rails Best Practices](https://github.com/flyerhzm/rails_best_practices#custom-configuration) Edit `config/rails_best_practices.yml`
- [Brakeman](https://github.com/presidentbeef/brakeman) Run `brakeman -I` to generate `config/brakeman.ignore`
- [Bullet](https://github.com/flyerhzm/bullet#whitelist) You can add exceptions to a bullet initializer or in the controller

## Configuring Code Climate

1. After adding the project to CC, go to `Repo Settings`
1. On the `Test Coverage` tab, copy the `Test Reporter ID`
1. Set the current value of `CC_TEST_REPORTER_ID` in the CI project env variables

## Code Owners

You can use [CODEOWNERS](https://help.github.com/en/articles/about-code-owners) file to define individuals or teams that are responsible for code in the repository.

Code owners are automatically requested for review when someone opens a pull request that modifies code that they own.

## Credits

Rails + Hotwire Base is maintained by [Rootstrap](http://www.rootstrap.com) with the help of our
[contributors](https://github.com/rootstrap/rails_hotwire_base/contributors).

[<img src="https://s3-us-west-1.amazonaws.com/rootstrap.com/img/rs.png" width="100"/>](http://www.rootstrap.com)
