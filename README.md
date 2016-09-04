# Coding Challenge Brief

## Bakery

### Background:  

A bakery used to base the price of their produce on an individual item cost. So if a customer ordered 10 cross buns then they would be charged 10x the cost of single bun. The bakery has decided to start  selling their produce prepackaged in bunches and charging the customer on a per pack basis. So if the  shop sold vegemite scroll in packs of 3 and 5 and a customer ordered 8 they would get a pack of 3 and  a pack of 5. The bakery currently sells the following products:  

Name | Code | Packs 
-----|------|------
Vegemite Scroll | VS5 | 3 @ $6.99, 5 @ $8.99
Blueberry Muffin | MB11 | 2 @ $9.95, 5 @ $16.95, 8 @ $24.95
Croissant | CF | 3 @ $5.95<br>5 @ $9.95, 9 @ $16.99 

### Task:  

Given a customer order you are required to determine the cost and pack breakdown for each product.  To save on shipping space each order should contain the minimal number of packs.  

### Input:  

Each order has a series of lines with each line containing the number of items followed by the product  code. An example input:

```
10 VS5  
14 MB11
13 CF    
```

### Output:  

A successfully passing test(s) that demonstrates the following output:


```
10 VS5 $17.98
 2 x 5 $8.99
14 MB11 $54.8
  1 x 8 $24.95
  3 x 2 $9.95  
13 CF $25.85
  2 x 5 $9.95
  1 x 3 $5.95
```


### Advice:

 - Choose whatever language you’re comfortable with
 - The input/output format is not important, do whatever feels reasonable
 - Make sure you include at least one test
 - We expect the see code which you would be happy to put in production
  If something is not clear don’t hesitate to ask or just make an assumption and go with it


# Author's notes

## Setup

### Pre-requisites
This repository is backed by a docker configuration. Tested with Docker version 1.12 and docker-compose version 1.8.

To start the application, first set up the databases with the following command:

```
docker-compose run --rm web rake db:setup
```

This will pull all required images before executing the command. This will take some time, depending on connection speed. Once complete, start the application with:

```
docker-compose up
```

## Tests

Tests can be run from with the following (with documentation formatting):

```
docker-compose run --rm -e RAILS_ENV=test web rspec -f -d . 
```

## UI

Of course the UI is basic but I felt it fits the brief OK. It can be accessed at `http://localhost:3000/orders`. Create an order, and then add items as desired... yum yum. Items and their packs can be modified from `http://localhost:3000/items`.


## Notes

The main spec to confirm correct distribution of item packs can be seen in `spec/models/order_item_spec.rb`.

A few types of specs were omitted for this challenge as I felt the important specs were in the models and controllers.

With a bit more time, the few areas would be improved:

- Adding an order item of an existing item should add to the quantity rather than appearing as another order item (validating uniqueness on item_id).

- Add the ability to edit an order item - currently the order item histories are built before creation, I'd prefer to allow existing histories to be updated as quantity is updates.