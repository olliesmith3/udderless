### Udderless

### Plan with Luke

03/12/20

### What does the staff site need to do? 

  Log in to website as staff

  Connect to a database and store customer data and order data.

  Customer data: First name, Last name, Address, email, telephone...

  Order data: quantity, timestamp, customer_id

  Enter new customers and new orders with a form

  print off an order form for deliveries. per delivery day.

  Send emails?

    These could be to confirm an order and give an estimated date of delivery / send marketing stuff

  Be deployed with a non local database (cloud AWS? Heroku?)

  Search function: be able to search for customers and orders

### Other questions: 

How will the delivery drivers work? is it going to be a bit like deliveroo?

Route planning feature? to take into account all the deliveries for that day

### Customer website?

  Website where customers can go online and fill out a form if a new customer or login if already a customer - then they can order milk

  App? Will take ages because ive never done it before but could try with react native. 

### barny talking:

    landing page - postcode checker or log in

    if not within postcode - have option to register interest (tel and email)

    stores other postcodes into different table

    once logged in - About us (whats in the milk and story about the boys)/ homepage, order udderless button - form to order. My orders (edit orders), My account (edit details), Sign out.

### Luke talking

    deliveries - monday and thursday (3 day shelf life)

    accessible for blind and deaf - hover descriptions - screen reader compatibility

### Who to ask...

    Charlotte about GDPR and SQL injection vulnerability


look at https://snyk.io/product/open-source-security-management/?utm_medium=Paid-Search&utm_source=google&utm_campaign=nb_language&utm_content=sql&utm_term=%2Bsql%20%2Bvulnerability&gclid=EAIaIQobChMIpIehnp-y7QIV2sLtCh3Iqw_ZEAAYASAAEgI9ZPD_BwE (SNYK) to avoid SQL injection vulnerability.

https://youtu.be/LQVukFENNeY

https://en.m.wikipedia.org/wiki/SQL_injection

There are other types of injection vulnerabilities too - JS injection etc.





### Tech stack - 

  Staff website => RoR?, Postgres, React front end?