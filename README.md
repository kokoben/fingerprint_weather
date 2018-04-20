# Weather

A simple Ruby on Rails application that enables users to search locations and view weather details made available by [MetaWeather](https://www.metaweather.com).

#### Live Demo
<https://limitless-oasis-59888.herokuapp.com/>

### Before You Start

- Clone the repository locally (please do **not fork** on Github)

### Prerequisites

- Ruby: A Ruby version manager is highly recommended for installing Ruby and required Gems. You can find more information on available Ruby managers here: <https://www.ruby-lang.org/en/documentation/installation/#managers>

### Objectives

- Implement caching where location query responses are stored in a *SQL* database to speed-up subsequent searches (note: cache invalidation is not a requirement).

- Add an appropriate weather icon to location weather result (`show` template). See MetaWeather API documentation for details: <https://www.metaweather.com/api/>
    
	**Hint**: Match `weather_state_abbr` with appropriate weather icon made available a: `https://www.metaweather.com/static/img/weather/png/64/?.png`.

### Optionals

- Replace Rails view templates with React or Vue.

- Implement a simple interface that allows an “admin” to review, add, or remove locations from the cache (authentication is not required).

### Submitting the Completed Project

- Create and push your code to a Github repository
- Send link to your repository by replying to the project invite email.
