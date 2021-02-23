### Udderless
![Logo](./client/src/assets/images/TM-logo-final-1.gif?raw=true "Logo")
### What is udderless?

Udderless is a new company that produces and delivers organic oat milk to customers in SW London.

This project is made up of two parts: 
    - a staff website to manage customers, orders and deliveries
    - a customer facing site that lets people manage their orders and register interest

### Requirements 

  - [Staff Site - Click Here](https://github.com/olliesmith3/udderless)
      - Log in to website as staff (authenticated)
      - Connect to a database and store customer data and order data.
      - Search for customers and orders.
      - print off an order form for each delivery day.
      
  - Customer site
    - v1
        - A place for customers to visit, learn a about the company and register their interest.
    - v2 - After launch
        - Allow customers to manage their orders.
        - If a customer is not within the postcode range then allow them to register interest.
        - Send confirmation emails.
        - Accessible for screen readers.

### Choosing a tech stack

- I wanted to use a React frontend for this project
    - Give me a better understanding of api requests
    - Very popular framework which is important to learn
    - Possibility of adding a React Native client for running on mobile devices naitvely.

- One part of this involved adding axios, a library that allows you to make API requests.

- React testing library - ability to write both unit tests and integration tests with one technology.

- Rails API and Postgres database
    - Already understand these technologies so will avoid having too many moving parts.

### How to use

Clone this repository and install the dependencies by running bundle and yarn.
```
bundle install
cd client 
yarn
```
Set up the database:
```
rails db:setup
rails db:migrate
```
Start the server and the client on seperate ports. in the first terminal:
```
rails s -p 3001
```
And in a new terminal:
```
cd client
yarn start
```
Now open up localhost:3000 in your browser and begin using the customer portal v1:

![HomePage](./client/public/README-images/homepage.png?raw=true "Home Page")
This page is simply for customers to learn a bit more about the company

![Register Interest Form](./client/public/README-images/register-interest-form.png?raw=true "Register Interest Form")
This form is where potential customers can register their interest. First name and postcode are compulsory fields whereas it is only compulsory for one of either email or telephone to be filled.

![Thank You Message](./client/public/README-images/thank-you-message.png?raw=true "Thank You Message")
The thank you message presented is tailored to the customer's name and postcode.

Visit localhost:3001 to use the staff site. To gain full access to the staff site: Remove ':check_staff' from line 2 of both /app/controllers/customers_controller.rb and /app/controllers/orders_controller.rb.

In order to run the tests:
```
$ rails test
$ rails test:system
$ cd client
$ yarn test
```

### What I will be working on next

- Authorisation of interests - to avoid multiple sign ups from the same customer need to check database that email or tel hasnt been registered before.

- Completing ARIA labels and making accessible for screen readers

- Deployment - Previously I have used Google cloud and Heroku

- Get started with version 2!


### How to set up and use

Clone the repository, change into the udderless_manager directory and run the following: 
```
$ bundle install
$ rails db:setup 
$ rails db:migrate
$ rails start
```
Then go to localhost:3000. Remove ':check_staff' from line 2 of both /app/controllers/customers_controller.rb and /app/controllers/orders_controller.rb so that you can interact with the site.
In order to run the tests:
```
$ rails test
```
Or the system tests:
```
$ rails test:system
```

### Setting up mailer 

In order to personalise the mailers for my customer class - I didn't use the Devise gem. The mailer sends an email when a customer is signed up and when an order is made.
To configure the mailer with GMail I had to set up 2FA on my google account (created specifically for sending emails) and then create an app password for my app - this 16 character string was then used instead of my gmail password in the smtp settings in environments/development.rb. Other setup was as is in the rails guides.

### Deployment

Online reviews suggest that the best option for free tier deployment of a rails project is Heroku

#### Mapbox API Spike

- The purpose of this spike was to try to get the API to plan a route when provided with a list of addresses.
 
  - This API has a geocoding tool and a navigation tool
  - Firstly, I converted the customer addresses to coordinates with the geocoding tool
  - The coordinates can then be added as waypoints in the navigation tool
  - This allows a planning of a route for delivery days

### The To Do List

- Add delivery date or day of the week to orders (then add this to the mailers)
- Complete deployment of both sites.
- Configure simplecov for accurate coverage

