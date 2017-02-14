# Rails Sports App (Temp name)
Rails Sports App is being implemented for an innovation course at the University of Ottawa, SEG3904

## Synopsis
RSA aims to provide various user groups with a platform for hosting local sports games and tournaments. 


## Application Details
Stack: *Ruby on Rails*: HTML5, CSS3, JS, Ruby

IDE: *Cloud9* : A web based IDE that provides a workspace in the cloud via a docker container. Cloud 9 provides:
  * A docker container running the linux OS; 
  * Provides a command line interface for executing linux shell commands
  * Text-editor
  * Application Collaboration and Storage

Package Manager: Ruby Gems 
 Gems can be found in the Gemfile. The following gems are critical for configuration: 
  * rails 5.0.0
  * heroku 
  * postgresl
  * rspec
  * circleci

Database: Postgresql - Created by including the postgresql gem in the gem file then
  * 1. Run `bundle install` to install the gem into the application
  * 2. Run `rake db:create` to create the postgresql database
  * 3. Model objects are mapped to the database via the rails ORM (this is behind the scenes)

Application Server: Heroku 

Source control: Github: https://github.com/aelfa057/rails-sports-app



## Setup Details
Command in linux shell for creating a rails application: `rails new ctgs`.

This creates a rails application . The result is a complete file architecture for a mvc rails application.

# Configuring Source Control
*The following steps outline the process for configuring git through the c9 CLI
    *1. `git init` : initialize local source (will prompt for username and password)
    *2. `git add remote origin ssh-key-from-git`

# Configuring application server
*The following process outlines the steps for creating a heroku application and pushing the rails app to the heroku server
   *1. `heroku create` : initialize heroku application       
   *2. `git push heroku master` : deploy from github to heroku! A link to the web app will be given in the command line upon entering this command.



