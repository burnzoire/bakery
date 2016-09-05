# create a customer for this coding challenge. No user or session management implemented.
Customer.create!

# pre-populate items & packs
Item.create({
  name: "Vegemite Scroll",
  code: "VS5",
  item_packs_attributes: [{
    quantity: 3,
    price: 6.99
  }, {
    quantity: 5,
    price: 8.99
  }]
})

Item.create({
  name: "Blueberry Muffin",
  code: "MB11",
  item_packs_attributes: [{
    quantity: 2,
    price: 9.95
  }, {
    quantity: 5,
    price: 16.95
  }, {
    quantity: 8,
    price: 24.95
  }]
})

Item.create({
  name: "Croissant",
  code: "CF",
  item_packs_attributes: [{
    quantity: 3,
    price: 5.95
  }, {
    quantity: 5,
    price: 9.95
  }, {
    quantity: 9,
    price: 16.99
  }]
})