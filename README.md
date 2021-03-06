# Sweater Weather

## Background and Description 

Sweater Weather is a backend application that exposes a series of endpoints for a front end team. The endpoints will contain information that will allow a user to see the curent weather, as well as the forecasted weather at the destination, and travel time to reach the destination. 

## Requirements and Setup
### Ruby/Rails 
- Ruby 2.7.2
- Rails 5.2.6.3
### Setup 
1. Clone this repo. On your local machine, open the terminal and enter the following command:

```
$ git clone git@github.com:croixk/sweater_weather.git
```

2. You can now enter the project directory ```$ cd sweater_weather```

3. Now, install the required gems using ```$ bundle install```

4. Run database migrations with ```$ rails rake db:{drop,create,migrate,seed}```

5. Before consuming the APIs, you will need to start the local server ```$ rails s```

## APIs utilized 
This project utilizes the following public APIs - these APIs require are free, but do require registration for a key
### Open Weather 
https://openweathermap.org/api/one-call-api

### Pexels 
https://www.pexels.com/api/

### MapQuest's Geocoding API
https://developer.mapquest.com/documentation/geocoding-api/

## Endpoints 
This project exposes the following endpoints for a front end team

### Retrieve weather for a city 
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```

### Background image for a city 
```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```

### Register User 
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json
```

### Login 
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json
```

### Road Trip 
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json
```




