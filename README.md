# Define-a-Word

#### By Kristen Hopper

## Technologies Used

* _Ruby_
* _Docker_
* _rspec_
* _pry_
* _sinatra_
* _capybara_

## Description

This app was developed to be a classroom tool to improve vocabulary and encourage critical thinking skills in young children. It demonstrates the use of routing using Sinatra with Ruby. 

## Setup/Installation Requirements

To use this project, you will first need to install [Docker](https://docs.docker.com/get-docker/). Once it is installed, run `docker pull ruby:2.6.5` in the terminal to pull and install the correct image of Ruby on your machine.

You can now clone the project by running `git clone https://github.com/krishops/word_definer` in the terminal.

This app is also available at HEROKU LINK HERE.

## Project Testing

Within the root directory, run the command `docker-compose run --rm web bundle exec rspec` to run the rspec tests of the project.
Testing should output:
**19 examples, 1 failures**  

## Known Bugs

App is unable to update or delete definitions of words.
Integration test for deleting a word fails.

## License

[MIT](https://opensource.org/licenses/MIT)

Copyright (c) Kristen Hopper

## Contact Information

hopperdavis@gmail.com