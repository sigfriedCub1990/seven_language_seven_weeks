-module(comprehension).
-export([products_total/1]).

products_total(ProductsList) -> [{Product, Quantity*Price} || {Product, Quantity, Price} <- ProductsList].
