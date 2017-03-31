#### Basic rules of coffeescript
# Whitespace - Blank areas on a web page that are placed on purpose. It is what separates content and is a design element of its own.
# Every function is an expression. What this means is that every function that you define is going to return something. You may or may not use what it's returning, but it's going to happen. Let me give you an example (Suppose you have a function called myFunc() and wanted to return both id and name out of that function.
# Scope is handled automatically. We no longer have to use the var keyword when setting up a variable.
# Use indentation instead of curly braces for scoping.
# No need for semi-colons.
# In CoffeeScript, == and != translates to === and !==, which you probably always want to be using.
# Speaking of this, CoffeeScript has a shortcut for it, the @ symbol

# basic syntax in JS
var myFunc;
myFunc = function(){
  return {
    id: 3,
    name: 'jane doe'
  };
};
# basic syntax in coffeescript
myFunc = ->
    id: 3
    name: 'jane doe'

# JS
function User(id){
  this.id = id
}
#CS
class User
  constructor: (@id) ->

# JS
if(typeof zombie !== "undefined" && zombie !== null){
  alert("Run!")
}
# CS
alert "Run!" if zombie?

# JS
var name;
name = "jane doe";
alert("My name is " + name);
# CS
name = "jane doe"
alert "My name is #{name}"

# CS knows to strip / add commas in arrays as needed. these will all compile down correctly:
fruits = ['mango', 'avocado', 'banana']
veggies = [
  "lettuce"
  "spinach"
  "peas"
]
numbers = [1,2,3,]

#create a range of an array in 2 ways:
numbers = [1..10]
# => [1, 2, 3, 4, 5,6, 7, 8, 9, 10 ]
numbers = [1...10]
# => [1, 2, 3, 4, 5, 6, 7, 8, 9]

numbers = [10..1]
# => [ 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 ]
numbers = [10...1]
# => [10, 9, 8, 7, 6, 5, 4, 3, 2 ]
