# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby / Rails version
ruby 2.2.3 + rails 5

* System dependencies

This guide assume that you have installed docker for easy dev environment 
setup, if you don't like to go with docker, you must have: 

   * MySQL
   * Redis
   * Ruby
   * Rails

* Configuration

    $ docker-compose build

* Database initialization

In order to create the database, run migrations and seed people data, run this command:
    
    $ docker-compose run app rake db:setup
    
* How to run the test suite

    $ docker-compose run -e "RAILS_ENV=test" app rake

* Services (job queues, cache servers, search engines, etc.)

    Mails are handled by a `sidekiq` queue through ActiveJob, all jobs are
    stored in redis. When you start docker containers, sidekiq and redis 
    are started too
    
* Running the app
    
Docker will check the system dependencies, download the dabases images (mysql and redis), 
bundle the gemfile and start sidekiq and puma
  
    $ docker-compose up

Now you can access to your docker ip and port 3000, in my case, http://localhost:3000

* Feature
    
When a user is created/deleted, the system will send an email to all people, 
in dev mode, all mails are stored in letter opener, if you like to check all 
sent mails, go to http://localhost:3000/letter_opener
 
    
    