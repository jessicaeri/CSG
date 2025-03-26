// Week 10 Day 46

// QOTD: What do you appreciate about your parents?
//   - Dad is super reliable and my mom is super funny 

// ----------------------------------------------

// What is javascript?
//   -implement complex features from a static webpage
//   Ex:
//   ERB - had to continue to refresh 

// Every modern browser has a Javscript developer tool 
//   -Mac: CMD+OPT+I

// 1. Ensure that Javascript is installed correctly onto your computer.
// brew install Node
// brew -v 

//----------------------Different variables-------------------

// console.log(); = puts
// console.log("Hello Class");


// var:
// The original way to declare variables in JavaScript.
// Function-scoped or GLOBALLU scoped.
// Accessible within the function in which it’s declared. If declared outside any function, it becomes globally scoped.
// Can be re-declared and updated.
// Modern JavaScript development rarely uses var due to its quirks and potential for scope-related bugs. However, if you’re working in legacy code or need to support very old browsers, you may still see or use var.

// let or "variable_name"; = sets variable
// let:
// Introduced in ES6 (2015).
// Block-scoped. 
// w/in {}
// Only accessible within the block (e.g., {}) it’s declared in. This provides better control over variable scope and avoids accidental overwrites.
// CAN be updated but not re-declared in the same scope.
// Use let for variables that you anticipate reassigning within a block or scope. It’s particularly useful for loops, conditionals, or situations where the variable’s value needs to change.

// const:
// Also introduced in ES6.
// Block-scoped.
// Cannot be updated or re-declared.
// Must be initialized at the time of declaration.
// Use const for variables whose values should not change after they are initialized. It’s great for configuration values, fixed data, or when you want to indicate that a value should remain constant throughout the program.
// const test = 10;
// "= 10" is the initializer

// const is generally preferred over let for any variable you don’t plan to reassign, as it can make code more predictable and easier to read.

// can mutate the data w/in hash but cannot change the structure of the data
// const user = {name: "Noah", age: 25};
// user.age = 26
// user.name = "Alanna"

//EXERCISE:
// Declare variables using var, let, and const.
//   Try updating the variables and observe what happens.

// count = 4
// if (count > 5) {
//   var result = "Greater than 5";
// }

// console.log(result)
//     UNDEFINED 

// count = 7
// if (count > 5) {
//   var result = "Greater than 5";
// }

// console.log(result)
//     Greater than 5

// const user = { name: "Noah", age: 25 };
// console.log(user)

// user.age = 26
// user.name = "Alanna"
// console.log(user)

//-------------------TYPES OF DATA --------------------
// Number
// let count = 10;
// let price = 19.99;

// console.log(typeof (count)); //number
// console.log(typeof (count)); //number

// Boolean
// let isLoggedIn = true;
// //camelcase in JS

// let hasAccess = false;

// console.log(typeof (isLoggedIn)); //boolean
// console.log(typeof (hasAccess)); //boolean

// // Undefined
// let something
// console.log(typeof something); //undefined

// Symbol
// const id = Symbol('id');
// console.log(typeof id) // symbol

// Array
// let numbers = [1, 2, 3, 4];
// numbers[2] = 10;
// console.log(typeof numbers) //object
// console.log(numbers); //[ 1, 2, 10, 4 ]

// Object
// let data = null;
// console.log(typeof (data)); //object

// let person = {
//   name: "Audreana",
//   age: 26
// }

// console.log(typeof person) //object
// console.log(person.name)

//---------------------------------------------------------
// Comparison operators

// == "loose equality" - allows type coercion
// console.log(5 == '5');
//   as long as value is the same regardless of type TRUE


// === "Strict equality" - no type coercion
// console.log(5 === '5');
//   FALSE - bc it is a string

// !=
// !==

// console.log(5 != '5'); // false
// console.log(5 !== '5'); // true

// && if both are true AND
//   || if one is true OR
// !inverts the operand

// let a = true
// let b = false

//console.log(a && b)


//--------------------FUNCTIONS---------------------------------
// function greet(name) {
//   console.log("in the function");
//   return "Hello " + name + "!"
// }

// console.log(greet("Charles"));

//Exercise:
// Write 2 functions
// A function to greet someone
// function greet(name) {
//   return "Buenas yan Hafa Adai " + name + "!"
// }

// console.log(greet("Damen"));

// A function to calculate the sum of 2 variables
// function add(x, y) {
//   return x + y
// }

// console.log(add(4, 5));

// add = parameter - var. we are using w/in the function
// (x,y) = argument - what we pass in when we call the function
// return ENDS the function

// Arrow Functions

// const greet = (name) => {
//   return "Hello " + name + "!";
// }

// console.log(greet("Leon"));

//EXERCISE 
// One line function

// const introductions = (name) => {
//   return greet(name) + " How are you today?";
// }

// console.log(introductions("Jess"))

//------------------- SCOPES-------------------------------

// Global Scope
//   - variables declared outside of function or block 
//   - available pretty much everywhere
//   - often risky if over used bc the global var can be modified EVERYWHERE 
//      - naming collisions or unexpected behavior

// var globalVariable = "I am a global variable";

// function showGlobal() {
//   console.log(globalVariable);
// }

// showGlobal();
// console.log(globalVariable);

// Function Scope
// - variables declared with var inside of a function 
// - only available w.in that specific function - cannot be accessed outside of the function
// - great for encapsulating logic and avoiding naming collisions

// function testScope() {
//   var functionVar = "I am inside a function";
//   console.log(functionVar);
// }

// testScope();

// console.log(functionVar);


// Block Scope 
// - variables declared with let or const inside of a block ({}) 
// - only available within that specific block
// - can be if, loops, or any code wrapped in a {}

// if (true) {
//   let blockVar = 'I am block scoped';
//   const blockConst = 10;
//   console.log(blockVar);
//   console.log(blockConst);
// }

// console.log(blockVar);
// console.log(blockConst);

//----------------- HOISTING ---------------------
// HOISTS(lifts) their declarations to the top of the code.

//   FUNCTION
// sayHi(); //Hi!

// function sayHi() {
//   console.log("Hi!");
// }

// VAR
// console.log(name); //undefined

// var name = "Jordan";

// LET or CONST
// console.log(age); //cannot access 'age' before explicitly defining/intiializing

// let age = 30;

// console.log(city); // cannot access 'city'

// const city = "Tokyo";

// --------------- ASYNCHRONOUS and SYNCHRONOUS---------------

// ASYNCHRONOUS
// console.log("Step 1");

// setTimeout(() => {
//   console.log("Step 2");
// }, 2000);

// console.log("Step 3");

// SYNCHRONOUS
// puts "Step 1"
// sleep(2)
// puts "Step 2"
// puts "Step 3"

// Other examples:
// function doHeavyCalculation() {
//   let sum = 0;
//   for (let i = 0; i < 1e9; i++) {
//     sum += i;
//   }
//   return sum;
// }

// console.log("Start calculation...");
// console.log(doHeavyCalculation()); // synchronous & blocking
// console.log("End calculation.");  

// Hoisting Exercise:
// 1. Experiment with var, let, and const:
//   A - Declare variables in different blocks and see which ones produce errors when accessed outside.
//     B - Try calling a var variable above its declaration.Confirm you get undefined instead of an error.
// 2. Observe Hoisting in Action:
// A - Write multiple console.log statements before you actually declare variables.Watch how var differs from let/const.
// B - Test calling both a function declaration and a function expression before they appear. Note the differences.

// 1A. 
// {
//   var a = "var";
//   let b = "let";
//   const c = "const";
// }

// console.log(a); // var 
// console.log(b); // undefined
// console.log(c); // undefined

// 1B.
// console.log(a); // undefined 
// var a = "var";

// console.log(a); // var #hoists the NAME but not the value
// var a = 12;

// 2A.
// console.log(a); 
// console.log(b); 
// console.log(c);

// {
//   // var a = "var"; // undefined
//   // let b = "let"; // undefined
//   const c = "const"; // undefined
// }

// 2B.
// FUNCTION
// sayHi(); //Hi!

// function sayHi() {
//   console.log("Hi!");
// }

// EXPRESSION
// sayHi(); //UNDEFINED - 

// var sayHi() {
//   console.log("Hi!");
// }

//--------------------------------------------------------------

// QOTD: What is a weird obsession you have or ever had ???
//   - I collect my cat's whiskers

//-------------------Conditionals ---------------------

// const age = 28;
// if (age >= 18) {
//   console.log("You are old enough to vote.");
// } else if (age == 18) {
//   console.log("You are just old enough t vote.");
// } else {
//   console.log("you are NOT old enough to vote")
// }

// const age = 19;

// if (age > 18) {
//   console.log("You are old enough to vote.");
// } else if (age == 18) {
//   console.log("You are just old enough to vote.");
// } else {
//   console.log("You are not old enought to vote.");
// }


// const isMember = false;

// if (!isMember) { // ! changed it to true
//   console.log("Welcome, member!");
// } else {
//   console.log("Access denied. Please sign up.");
// }

// const day = "Monday";


// switch (day) {
//   case "Monday":
//     console.log("Start of the work week!");
//     break;
//   case "Tuesday":
//     console.log("It's only Tuesday...");
//     break;
//   default: 
//     console.log("Enjoy your day!");
// }

// dependent on the day inputted in line 389

// ternary operator 
// condition ? if it's true : if it's false 

// const age = 16;

// const canDrive = (age >= 16) ? "Yes" : "No";
// // condition ? true : false
// console.log(canDrive);

// EXERCISE ---------
//Exercises:
// A) Simple Authorization
// Prompt for a user’s role (e.g., "admin", "editor", "viewer").
// Use if/else (or switch) to determine and log an access level message:
// "admin" → "Full access".
// "editor" → "Partial access".
// "viewer" → "Read-only access".
// Otherwise → "No access".
// Optionally, store the result in a variable and log it or use it in further logic.


// B) Grading System
// Prompt for a numeric score (0–100).
// Output the letter grade using if/else if/else:
// >= 90 → A
// >= 80 → B
// >= 70 → C
// Otherwise → D/F
// Print a message like "Your grade is A" or "You got a C. Study more next time!".


// C) Ternary Check
// Create a variable isLoggedIn (true/false).
// Use a ternary to set a message variable:

// D) Switch on Fruits
// Let fruit = "apple".
// Use a switch statement to handle "apple", "banana", "grape", and default.
// Print different messages, like "Apples are red", "Bananas are yellow", "Grapes are purple".
// If none matches, print "Unknown fruit."

// const accessLevel = "admin";

// switch (accessLevel) {
//   case "admin":
//     console.log("Full access");
//     break;
//   case "editor":
//     console.log("Partial access");
//     break;
//   case "view":
//     console.log("Read-only access");
//     break;
//   default:
//     console.log("No access");
// }

// const isLoggedIn = true;

// const websiteUser = (isLoggedIn === true) ? "Logged In" : "Not Loggedin";
// console.log(websiteUser);

// ------------------ USER INPUT -----------------------
//Think ruby gets.chomp

const readline = require('readline');
// This brings in a built-in Node.js module called 'readline' so we can read input from the terminal.

// Create interface
const rl = readline.createInterface({
  input: process.stdin,  // Takes input from the user (keyboard).
  output: process.stdout // Outputs text to the terminal.
});
// This creates the 'interface' we’ll use to ask questions and get answers.

//ASK QUESTION for the user to enter something
rl.question('Enter a day: ', (input) => {
  // The user's input is stored in the variable "input"

  const trimmedInput = input.trim(); // Remove extra spaces
  const day = trimmedInput; // Store input into a variable named 'day'

  // Check the value of 'day' and run different code depending on what the user typed
  switch (day) {
    case "Monday":
      console.log("Start of the work week!");
      break;
    case "Tuesday":
      console.log("It's only Tuesday...");
      break;
    default:
      console.log("Enjoy your day!");
  }

  rl.close(); // Close the interface so the program doesn't keep running
});
// A 'switch' statement checks the value of 'day' and matches it to a case.
// It helps organize multiple conditions more clearly than multiple 'if' statements.

// ----------------LOOPS---------------------------
// FOR------------
for (let i = 0; i < 5; i++) {
  console.log(i);
}
// Starts i at 0, keeps going while i is less than 5, increases i by 1 each time (i++).
// Useful when you know how many times you want to repeat something.
// Prints: 0 1 2 3 4

//WHILE--------

let count = 0;

while (count < 3) {
  console.log(count);
  count++; //++ increases by one each loop
}
// Keeps looping WHILE the condition is true.
// Best for situations where you don’t know ahead of time how many times to run.
// Prints: 0 1 2

//DO...WHILE--------
let number = 5;

do {
  console.log("Number is:", number);
  number--; //decreases by one each loop
} while (number > 0);
// This loop runs at least once BEFORE checking the condition.
// Great when you need the loop to run at least one time no matter what.
// Prints: 5, 4, 3, 2, 1

//FOR In... OBJECTS--------- EACH LOOP OBJECTS
const person = { name: "Jess", age: 26 };

for (let key in person) {
  console.log(key, "=", person[key]);
}
// Loops through the keys of an object (e.g., name and age).
// Useful when working with objects.
// Loops over each key in the object.
// Prints: name = Jess and age = 26

//FOR Of... OBJECTS--------- EACH LOOP ARRAYS OR STRINGS
const fruits = ["apple", "banana", "cherry"];

for (let fruit of fruits) {
  console.log(fruit);
}
// Loops through the actual values in an array NOT INDEXES
// Prints: apple banana cherry




const word = "something";

for (let char of word) {
  console.log(char);
}
// Loops through each letter in the string.
// Prints: s o m e t h i n g

//LOOP conditions - Break/continue
for (let i = 0; i < 10; i++) {
  if (i === 5) break; // Stop the loop when i is 5
  console.log(i);
}
// break = exit loop early
// Stops completely when i is 5.
// Prints: 0 1 2 3 4

for (let i = 0; i < 5; i++) {
  if (i === 2) continue; // Skip this iteration when i is 2
  console.log(i);
}

// Skips the number 2, continues the loop.
// Prints: 0 1 3 4
// continue = skip the current loop step and go to the next one



//---------------- ARRAY METHODS --------------------------
const fruits = ["apple", "banana", "cherry"];

fruits.push("grape");       // Adds to the end of the array
//[ 'apple', 'banana', 'cherry', 'grape' ]

fruits.pop();               // Removes the last item
//[ 'apple', 'banana', 'cherry' ]

fruits.unshift("mango");    // Adds to the beginning
//[ 'mango', 'apple', 'banana', 'cherry' ]


fruits.shift();             // Removes the first item
//[ 'apple', 'banana', 'cherry' ]


const coolFruits = fruits.slice(1, 3);
// Creates a new array from index 1 to 2 (doesn’t change the original)
//[ 'banana', 'cherry' ]


fruits.splice(2, 1, 'strawberry');
// Changes the original array: remove 1 item at index 2, and insert 'strawberry'
//[ 'apple', 'banana', 'strawberry' ]


//----------- Array Exercise Functions---------------
const numbers = [1, 2, 3, 4, 5];

numbers.forEach((number) => {
  console.log(number ** 2);
  // Logs the square of each number (1*1, 2*2, etc.)
});
// 1
// 4
// 9
// 16
// 25


const squares = numbers.map(num => num ** 2);
// Creates a NEW array with each number squared.
//[ 1, 4, 9, 16, 25 ]


const evenNumbers = numbers.filter(num => (num % 2) === 0);
// Creates a new array with only even numbers.
//[ 2, 4 ]


const sum = numbers.reduce((total, num) => total + num, 0);
// Adds all the numbers together into a single value (sum).
//15


//---------- Real-Life Example (with products)---------
const products = [
  { name: 'Laptop', price: 1200 },
  { name: 'Phone', price: 800 },
  { name: 'Tablet', price: 500 },
  { name: 'Headphones', price: 150 },
];
const expensive = products.filter(product => (product.price > 500));
// New array with only the expensive items.
// [
//   { name: 'Laptop', price: 1200 },
//   { name: 'Phone', price: 800 }
// ]


const discountedPrice = products.map(product => ({
  name: product.name,
  price: product.price * 0.9
}));
// Applies a 10% discount and returns a new array of updated products.
// [
//   { name: 'Laptop', price: 1080 },
//   { name: 'Phone', price: 720 },
//   { name: 'Tablet', price: 450 },
//   { name: 'Headphones', price: 135 }
// ]


const total = discountedPrice.reduce((total, product) => total + product.price, 0);
// Adds up all the discounted prices into one total value.
//2385



//---------------  Destructuring (Array or Object Unpacking)---------
//Ruby - #{}
//JS - ${}


//ARRAY EX---------
const rgb = [255, 200, 0];
const [red, green, blue] = rgb;
console.log(`Red: ${red}, Green: ${green}, Blue: ${blue}`);
// Unpacks values from an array into individual variables
// Red: 255, Green: 200, Blue: 0


//OBJECT EX---------
const user = {
  name: 'Alanna',
  age: 22,
  city: 'Tamuning'
};

const { name, age } = user;
console.log(`${name} is ${age} years old.`);
// Pulls properties out of the object directly into variables.
// Alanna is 22 years old.



//------------- Functions w/ default values--------
function greet(name = "Someone") {
  console.log(`Hello ${name}`);
}

greet("Charles");  // Hello Charles (with a name)
greet();           // Hello Someone (without a name; uses default)
// The "= 'Someone'" is a default value if nothing is passed in.
