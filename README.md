# Scooby Doo Mystery Tracker

## Features

- Create, view, update, and delete
- Monsters
- Mystery

## Clone Instructions

```bash
  git clone git@github.com:Shantelgray/Scooby_Doo_Project.git
  cd Scooby_Doo_Project
```

## Install Dependencies

Make sure you have Ruby Installed Then run:

```bash
bundle install
```

## Setup the database with test data

```bash
database: bundle exec rake db:create db:migrate db:seed
```

## Start the Sinatra Backend

From the project root

```bash
bundle exec rackup
This will start your API at http://localhost:9292.
```

## Run the CLI app

In a seperate terminal tab:

```bash
bundle exec ruby cli\main.rb
```

## Requirements

- Ruby
- Bundler
- rest-client, pry, json, Gemfile
- Sinatra
