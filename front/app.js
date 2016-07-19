(function(){
  var app = angular.module('front', ['front-products', 'ngResource']);

  app.controller('MainController', function(){
    this.products = gems;
  });

  app.controller('PanelController', function(){
    this.tab = 1;

    this.selectTab = function(tab){
      this.tab = tab
    };

    this.isSelected = function(tab){
      return this.tab === tab
    };

  })

  app.controller('ReviewController', function(){
    this.review = {}
    this.addReview = function(product){
      product.reviews.push(this.review)
      this.review = {}
    };
  });

  gems = [
    {
      name: 'GemName',
      price: 2.95,
      description: 'GemDesc',
      canPurchase: true,
      soldOut: false,
      reviews: [
        {
          rate: 5,
          body: 'Awesome',
          author: 'test_author'
        },
        {
          rate: 4,
          body: 'not so Awesome',
          author: 'test_author'
        }
      ]
    },
    {
      name: 'GemName2',
      price: 12.95,
      description: 'GemDesc2',
      canPurchase: true,
      soldOut: false,
      reviews: [
        {
          rate: 5,
          body: 'Awesome',
          author: 'test_author'
        },
        {
          rate: 4,
          body: 'not so Awesome',
          author: 'test_author'
        }
      ]
    },
    {
      name: 'GemName3',
      price: 25.95,
      description: 'GemDesc3',
      canPurchase: true,
      soldOut: false,
      reviews: [
        {
          rate: 5,
          body: 'Awesome',
          author: 'test_author'
        },
        {
          rate: 4,
          body: 'not so Awesome',
          author: 'test_author'
        }
      ]
    },
    {
      name: 'GemName4',
      price: 252.95,
      description: 'GemDesc4',
      canPurchase: true,
      soldOut: false,
      reviews: [
        {
          rate: 5,
          body: 'Awesome',
          author: 'test_author'
        },
        {
          rate: 4,
          body: 'not so Awesome',
          author: 'test_author'
        }
      ]
    },
  ]
})();
