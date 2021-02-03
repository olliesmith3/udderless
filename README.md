### Udderless

### What is udderless?

Udderless is a pre-seed startup that produces and delivers organic oat milk to customers in SW London. As the two directors are my friends, this project is providing them with a custom built site and at the same time giving me practice at building a project for real stakeholders.

- This project is made up of two parts: 
    - A staff website to manage customers, orders and deliveries
    - A customer facing site that lets people manage their orders and register interest

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
### Requirements - based off of regular talks with the directors

  - Staff site
      - Log in to website as staff (authenticated)
      - Connect to a database to store customer data and order data.
      - Email confirmations.
      - Search for customers and orders.
      - Print off an order form for each delivery day.
      - Be able to plan a route for delivery days and to follow the route on a map on the app.
      
  - [Customer Site - Click Here](https://github.com/olliesmith3/udderless_customer_site)
      - Initially (before Udderless launch) this site needs to simply allow customers to register interest and display About information.\
        - Look good in the theme of the Udderless brand.

      - After the launch
        - Allow customers to manage their orders.
        - If a customer is not withing the postcode range then allow them to register interest.
        - Send confirmation emails.
        - Accessible to blind and deaf.

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

