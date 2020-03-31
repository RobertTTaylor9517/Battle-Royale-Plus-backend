# Battle Royale Plus backend
***
Fun to play Web-Browser Based game
Progress through the dungeon in this turn-based rpg simulation

### See this [project](https://battle-royale-plus.herokuapp.com/)

### Methods Used
+ Used JWT to manage session and website security
+ Used Simple Command gem to create custom encode and decode methods for JWT

### Technologies
+ Ruby
+ Ruby on Rails
+ PostgreSQL
+ JWT security

## Project Description
***

##### Overview:
This is the backend for my final project with Flatiron School. I was tasked to build an application that uses a Ruby on Rails Backend, and a React/Redux frontend. Since I have experience in game and app development, I thought it would be cool to make a browser based video game with the skills that I learned in Flatiron.
[Frontend](https://github.com/RobertTTaylor9517/Battle-Royale-Plus-frontend)

##### Challenges:
My main challenge was managing all of the game data and choosing what I specifically needed to change in the database, so it wouldn't cause any undefined error on the frontend


## Getting Started
***
1. Clone this repo.
2. Open it in a terminal or your favorite IDE
3. Create the database with `rails db:create`
4. Then seed the data with `rails db:seed`
5. Run `bundle install` to install all neccessary gems
6. Add a .env file and make sure to define ENV['KEY']
7. Start backend with `rails s`, preferably on port 3000 
