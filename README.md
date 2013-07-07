Brainiac on Rails
==============
This web-application used in National Research University of Electronic Technology (Russia, Moscow) for event "Brainiac" in social network "Vkontakte".

Requirements
==============
1. postgresql-9.1+
2. ruby-2.0.0-p247 (or later)

How To Install
==============
1. Create database user with name "brainiac".
2. Clone this application to your server.
3. Insert your VK-id to sql-script *renew_schema.sql* and execute it to create tables, indexes and initialize some records.
4. Install gem bundler (```gem install bundler```)
5. Install requirement gems to application (```bundle install```)
6. Create file *database.yml* in directory *config* with database connection settings

```yaml
development:
  adapter: postgresql
  host: localhost
  port: 5432
  username: brainiac
  password: your_password
  database: brainiac
  schema_search_path: brainiac
  encoding: utf8

test:
  adapter: postgresql
  host: localhost
  port: 5432
  username: brainiac
  password: your_password
  database: brainiac_test
  schema_search_path: brainiac
  encoding: utf8

production:
  adapter: postgresql
  host: localhost
  port: 5432
  username: brainiac
  password: your_password
  database: brainiac
  schema_search_path: brainiac
  encoding: utf8
```
7. Precompile asset (```rake assets:precompile```)
8. Start web-server unicorn (```bundle exec unicorn_rails -E production -D```)

License
==============
Copyright (c) 2013 Gorodishenin Anton. See LICENSE for details.
