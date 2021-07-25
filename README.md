# Define-a-Word

#### By Kristen Hopper

## Technologies Used

* _Ruby_
* _Docker_
* _RSpec_
* _pry_
* _Sinatra_
* _Capybara_

## Description

This app was developed to be a classroom tool to improve vocabulary and encourage critical thinking skills in young children. It demonstrates the use of routing using Sinatra with Ruby. 

## Setup/Installation Requirements

To use this project, you will first need to install [Docker](https://docs.docker.com/get-docker/). Once it is installed, run `docker pull ruby:2.6.5` in the terminal to pull and install the correct image of Ruby on your machine.

You can now clone the project by running `git clone https://github.com/krishops/word_definer` in the terminal.

This app is also available at https://shielded-plains-20120.herokuapp.com/.

## Project Testing

Within the root directory, run the command `docker-compose run --rm web bundle exec rspec` to run the rspec tests of the project.
Testing should output:
**21 examples, 0 failures**  

## Known Bugs

There are no known bugs.

## License

[MIT](https://opensource.org/licenses/MIT)

Copyright (c) Kristen Hopper

## Contact Information

hopperdavis@gmail.com