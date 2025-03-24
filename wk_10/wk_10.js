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