# Sinatra template application

This is a sample CRUD Sinatra app that allows user to create, update, and delete a list of favorite songs, albums and realease dates.

This application can be used as a starting point for a [Postgres](http://www.postgresql.org/)
database backed, via [Sequel](http://sequel.jeremyevans.net/), application that uses
[Sinatra](http://www.sinatrarb.com/). It can be deployed to [Heroku](https://www.heroku.com/).

## Development
1. `bundle install`
1. Create a database by running `psql -d postgres -f scripts/create_databases.sql`
1. Run the migrations in the development database using `rake db:migrate`. If you would
like to migrate to a specific version you can do so using this rake task. Run `rake -T` for
details.
1. Run the migrations in the testing database using `RACK_ENV=test rake db:migrate`.
1. `rerun rackup`
    * running rerun will reload app when file changes are detected
1. Run tests using `rspec`. The tests will clean up the database before each test run.

## Migrations on Heroku
To run the migrations on heroku, run `heroku run 'rake db:migrate'`. If you
do not have a Heroku configuration variable named DATABASE_URL, then you will need to create one.
