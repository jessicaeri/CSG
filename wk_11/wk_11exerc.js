// CALLBACKS
//PART A:
// Task: Write a function that takes in an array of names and a callback. The function should use a setTimeout to simulate an async operation (e.g., “fetching” names) and then pass the loaded names to the callback.
// Create a function called loadNames(namesArray, callback).
// Inside the function, use setTimeout(...) (e.g., 1 second delay) to simulate an async operation.
// After the timeout, log "Names loaded" to the console, then invoke the callback with the array of names.
// Test it by passing in an array of strings (e.g., ["Alice", "Bob", "Charlie"]) and a callback that logs each name to the console.


// function loadNames(namesArray, callback) {
//   setTimeout(() => {
//     console.log("Names have been loaded.");
//     callback(namesArray);
//   }, 1000);
// }

// const namesArray = ["Moebeanz", "Kaiju", "Billy", "Boboi"];

// loadNames(namesArray, (names) => {
//   console.log("Jess' list of pets:")

//   //w/o numbering
//   // names.forEach(function (name) {
//   //   console.log(name);
//   // });

//   //w/ numbering
//   names.forEach(function (name, index) {
//     console.log((index + 1) + ". " + name);
//   });
// });

// Output:
// Names have been loaded.
// Jess' list of pets:
// Moebeanz
// Kaiju
// Billy
// Boboi

// Names have been loaded.
// Jess' list of pets:
// 1. Moebeanz
// 2. Kaiju
// 3. Billy
// 4. Boboi

// PART B
// Task: Chain two callback-based functions to handle “loading user data” and then “formatting it.” This is to practice the callback pattern more deeply (and see how it can get nested).
// Create a function loadUserData(callback) that simulates loading data via setTimeout. Let it return an object like { firstName: "John", lastName: "Doe" }.
// Create another function formatUserData(userData, callback) that takes the user object and returns a formatted string, e.g., "User: John Doe".
// Chain these calls, so loadUserData(...) triggers formatUserData(...).
// Print the final formatted string in the callback chain.

// function fetchScores() {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => {
//       // For demonstration, let's say there's a 10% chance of failure
//       const isError = Math.random() < 0.1;
//       if (isError) {
//         reject("Failed to fetch scores!");
//       } else {
//         resolve([90, 80, 75, 88]);
//       }
//     }, 1000);
//   });
// }

// fetchScores()
//   .then((scores) => {
//     console.log("Scores:", scores);
//     // TODO: calculate average and return it
//   })
//   .then((average) => {
//     // TODO: log the average
//   })
//   .catch((error) => {
//     console.error("Error:", error);
//   });


//PROMISES
// Part A
// Task: Create a function that returns a Promise which resolves or rejects based on a “random coin flip.”
// Create a function coinFlip() that returns a new Promise.
// Use Math.random() to decide if it’s heads (resolve("Heads!")) or tails (reject("Tails!")).
// Chain a .then() to handle the “Heads!” scenario and a .catch() to handle “Tails!”.
// Log the result accordingly.

// function coinFlip() {
//   return new Promise((resolve, reject) => {
//     const randomCoinFlip = Math.random();
//     setTimeout(() => {
//       if (randomCoinFlip > 0.5) {
//         resolve("Heads!");
//       } else {
//         reject("Tails!");
//       }
//     }, 1000)
//   });
// }

// coinFlip()
//   .then((result) => {
//     console.log("Promise fulfilled:", result);
//   })
//   .catch((error) => {
//     console.error("Promise rejected:", error);
//   });

// Output:
// ~/Documents/tempJess/CSG/wk_11 % node wk_11exerc.js
// Promise fulfilled: Heads!
// ~/Documents/tempJess/CSG/wk_11 % node wk_11exerc.js
// Promise rejected: Tails!

// ASYNC/AWAIT
// PART A
// Task: Convert a simple “add two numbers” Promise into an async/await function.
// Create a Promise-based function addNumbers(a, b) that resolves the sum after a short delay.
// Write an async function displaySum() that awaits addNumbers(...) and logs the sum.
// Use try/catch to handle rejections (e.g., if either a or b is not a number).

// function add(a, b) {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => {
//       if (typeof a !== "number" || typeof b !== "number") {
//         reject("Parameters must be numbers!");
//       } else {
//         resolve(a + b);
//       }
//     }, 500);
//   });
// }

// async function displaySum() {
//   try {
//     const sum = await add(19, 98);
//     console.log("Sum:", sum);
//   } catch (error) {
//     console.error("Error:", error);
//   }
// }

// displaySum(); // call with e.g., addNumbers( , )


// FETCH API 

// const fetchUser = async () => {
//   try {
//     const response = await fetch('https://api.github.com/users/leonshimizu');

//     // console.log(response);

//     if (!response.ok) {
//       throw new Error(`HTTP error. Status: ${response.status}`);
//     }

//     // const userData = await response.json();
//     // console.log(userData);
//     console.log(`${userData.name} has ${userData.public_repos} public GitHub repos!`);
//   } catch (err) {
//     console.error('Error:', err);
//   }
// }

// fetchUser();

import fetch from 'node-fetch';  // Use ES module import

const fetchUsers = async () => {
  try {
    const response = await fetch('https://jsonplaceholder.typicode.com/users');

    if (!response.ok) {
      throw new Error(`HTTP error. Status: ${response.status}`);
    }

    const users = await response.json();

    users.forEach(user => {
      console.log(`Name: ${user.name}, Email: ${user.email}`);
    });
  } catch (error) {
    console.log('Error:', error);
  }
};

fetchUsers();
