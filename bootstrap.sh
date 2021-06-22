#!/usr/bin/env bash
set -exu

die () {
  echo >&2 "$@"
  exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided. Please add the project name"

project_name=$1

# install ruby gems
bundle install

#install node packages
yarn

# copy env sample
cp .env.sample .env

# copy database configuration and change the project name with the given one
sed "s/sample_project/${project_name}/g" config/database.yml.example > config/database.yml

# setup database
bundle exec rails db:setup
