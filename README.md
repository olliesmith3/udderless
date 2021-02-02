### Udderless

### What is udderless?

Udderless is a new company that produces and delivers organic oat milk to customers in SW London.

This project is made up of two parts: 
    - a staff website to manage customers, orders and deliveries
    - a customer facing site that lets people manage their orders and register interest

### Requirements 

  - Staff site
      - Log in to website as staff (authenticated)
      - Connect to a database and store customer data and order data.
      - Email confirmations.
      - Search for customers and orders.
      - print off an order form for each delivery day.
      
  - [Customer Site - Click Here](https://github.com/olliesmith3/udderless_customer_site)
      - Initially (before Udderless launch) this site needs to simply allow customers to register interest and display About information.\
        - Look good in the theme of the UDDERLESS brand.

      - After the launch
        - Allow customers to manage their orders.
        - If a customer is not withing the postcode range then allow them to register interest.
        - Send confirmation emails.
        - Accessible to blind and deaf.

### Setting up mailer 

previously when working on a facebook clone rails project, I had done my confirmation and password reset emails using the Devise Gem. In order to personalise the mailers for my customer class - I didn't use the Devise gem. The mailer sends an email when a customer is signed up and when an order is made

### Deployment

Online resources suggest that the best option for free tier deployment of a rails project is Heroku

#### Mapbox Spike
 
This API has a geocoding tool and a navigation tool
Firstly, I converted the customer addresses to coordinates with the geocoding tool
The coordinates can then be added as waypoints in the navigation tool
This allows a planning of a route for delivery days

### The To Do List

- Add delivery date or day of the week to orders (then add this to the )

