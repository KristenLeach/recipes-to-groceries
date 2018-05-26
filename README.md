# Recipes to Groceries

Welcome to Recipes to Groceries! This app allows users to add recipes to a database. From there, recipes can be added to a user's meal plan, and a grocery list of items needed is created for the user. 

## Getting Started

```Fork and clone this repo```

### Enabling OmniAuth for FB login 

```Follow instructions in .env template```

### Prerequisites
To install all necessary gems, run 

```bundle install```

To set up database and add seed data, run 

```rails db:migrate```

then 

```rails db:seed```

### Deploy the program on a local server

To deploy the program in the browser, run 

```thin start --ssl```

Navigate to ```https://localserver:3000/``` to get started. 


## Built With

* [Ruby on Rails](http://rubyonrails.org) - Web framework
* [OmniAuth](https://github.com/omniauth/omniauth) - Third-party log in 
* [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) - Image uploading/storage

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* **Kristen Leach** - [Kristen Leach @ github](https://github.com/kristenleach)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* This project was built for Flatiron School's Full-Stack Web Development course. 
