//------------------------ WEEK 11 Day 1: ----------------------------

// ================================================
// ASYNCHRONOUS JAVASCRIPT LESSON PLAN & PRACTICE
// ================================================

/*
GOAL:
Learn the difference between synchronous and asynchronous JavaScript.
Understand how to use Callbacks, Promises, and Async/Await to handle tasks
that take time like loading data or waiting for input.

Each section contains:
- a short explanation
- code examples
- comments
- expected output (after the code block)
*/

// =====================================
// 1 - SYNC vs ASYNC
// =====================================
/*
Description:
Synchronous code runs line by line.
Asynchronous code (like setTimeout) runs later, after other code finishes.
*/

console.log("A");

setTimeout(() => {
  console.log("B"); // This runs after A and C
}, 0);

console.log("C");

// Expected Output:
// A
// C
// B


// =====================================
// 2 - CALLBACK FUNCTIONS
// =====================================
/*
Description:
A callback is a function passed into another function.
It runs after an asynchronous task is completed.
*/

* allows for the code to run the way and order you want it to.
* ^^ for simpler callback example
  * "do something THEN do something else"
  * sync runs first then async

function fakeAsyncOperation(data, callback) {
  console.log('Processing:', data);
  setTimeout(function () {
    callback(data + '[processed]');
  }, 1000);
}

fakeAsyncOperation('file1', function (result) {
  console.log('Result:', result);
});

// Expected Output:
// Processing: file1
// (after 1 second)
// Result: file1[processed]


// =====================================
// 3 - DELAYED GREETING WITH CALLBACK
// =====================================
/*
Description:
This logs a greeting after a delay, then runs a callback function.
*/

function delayedGreeting(name, delay, callback) {
  setTimeout(() => {
    console.log(`Hello, ${name}!`);
    if (callback) {
      callback();
    }
  }, delay);
}

delayedGreeting('Alice', 1000, () => {
  console.log('Greeting complete!');
});

// Expected Output:
// (after 1 second)
// Hello, Alice!
// Greeting complete!


// =====================================
// 4 - CHAINING CALLBACKS
// =====================================
/*
Description:
You can chain asynchronous functions by calling one inside the other’s callback.
*/

function getUser(callback) {
  setTimeout(() => {
    const userName = 'Bob';
    console.log('Fetched user:', userName);
    callback(userName);
  }, 1000);
}

function getWelcomeMessage(name, callback) {
  setTimeout(() => {
    const message = `Welcome, ${name}!`;
    callback(message);
  }, 1000);
}

getUser((userName) => {
  getWelcomeMessage(userName, (welcomeMsg) => {
    console.log('Final message:', welcomeMsg);
  });
});

// Expected Output:
// (after 1 second)
// Fetched user: Bob
// (after another 1 second)
// Final message: Welcome, Bob!


// =====================================
// 5 - INTRO TO PROMISES
// =====================================
/*
Description:
A Promise is an object representing a future task that will either succeed or fail.
*/

const isReady = false;

const checkReadiness = new Promise((resolve, reject) => {
  if (isReady) {
    resolve('Everything is ready!');
  } else {
    reject('Not ready yet.');
  }
});

checkReadiness
  .then((message) => {
    console.log('Success:', message);
  })
  .catch((error) => {
    console.log('Error:', error); //easier to find error
  });

// Expected Output (because isReady is false):
// Error: Not ready yet.


// =====================================
// 6 - RANDOM RESULT PROMISE
// =====================================
/*bu
Description:
Simulates a task that randomly resolves or rejects after 1 second.
*/

function randomResult() {
  return new Promise((resolve, reject) => {
    const randomNumber = Math.random();
    setTimeout(() => {
      if (randomNumber > 0.5) {
        resolve('Success!');
      } else {
        reject('Failure!');
      }
    }, 1000);
  });
}

randomResult()
  .then((message) => console.log(message))
  .catch((error) => console.log(error));

// Expected Output:
// (after 1 second)
// Either "Success!" or "Failure!" randomly


// =====================================
// 7 - FETCH USER DATA WITH PROMISE
// =====================================
/*
Description:
Fetches data from a fake user API and handles success or failure.
*/

function fetchUserData(userId) {
  return new Promise((resolve, reject) => {
    fetch(`https://jsonplaceholder.typicode.com/users/${userId}`)
      .then((response) => {
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
      })
      .then((data) => {
        resolve(data);
      })
      .catch((error) => {
        reject(error);
      });
  });
}

fetchUserData(1)
  .then((user) => {
    console.log('User data:', user);
  })
  .catch((err) => {
    console.error('Error fetching user:', err);
  });

// Expected Output:
// User data: { id: 1, name: "...", ... }


// =====================================
// 8 - PROMISE CHAINING
// =====================================
/*
Description:
Performs two async additions in a row using .then() chaining.
*/

function add(a, b) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (typeof a !== 'number' || typeof b !== 'number') { //!== doesnt equal 
        reject('Input must be numbers.');
      } else {
        resolve(a + b);
      }
    }, 1000);
  });
}

add(2, 3)
  .then((sum) => {
    console.log('Sum:', sum);
    return add(sum, 4);
  })
  .then((newSum) => {
    console.log('New Sum:', newSum);
  })
  .catch((error) => {
    console.log('Error:', error);
  });

// Expected Output:
// (after 1 second) Sum: 5
// (after another 1 second) New Sum: 9


// =====================================
// 9 - ASYNC/AWAIT BASIC
// =====================================
/*
Description:
Uses async/await to wait for a multiplication result.
*/

function multiply(a, b) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (typeof a !== 'number' || typeof b !== 'number') {
        reject('Input must be a number!');
      } else {
        resolve(a * b);
      }
    }, 500);
  });
}

async function showMultiplication() {
  try {
    const result = await multiply(4, 5);
    console.log('Result:', result);
  } catch (error) {
    console.log('Error:', error);
  }
}

showMultiplication();

// Expected Output:
// (after 0.5 second)
// Result: 20


// =====================================
// 10 - MULTIPLE AWAITS
// =====================================
/*
Description:
Performs two async multiplications one after the other.
*/

async function doMultipleThings() {
  try {
    const step1 = await multiply(2, 3);
    console.log('Step 1:', step1);

    const step2 = await multiply(step1, 4);
    console.log('Step 2:', step2);
  } catch (error) {
    console.log('Error:', error);
  }
}

doMultipleThings();

// Expected Output:
// (after 0.5 second) Step 1: 6
// (after another 0.5 second) Step 2: 24


// =====================================
// 11 - FETCH USING ASYNC/AWAIT
// =====================================
/*
Description:
Uses async/await to fetch data from the GitHub API.
  Browser based API that returns a promise
*/

install: npm install node - fetch

import fetch from 'node-fetch';  // Use ES module import

const fetchUser = async () => {
  try {
    const response = await fetch('https://api.github.com/users/leonshimizu');

    // console.log(response);

    if (!response.ok) {
      throw new Error(`HTTP error. Status: ${response.status}`);
      // throw - This is a JavaScript keyword that generates an exception (error). When you throw an error, code execution stops at that point and control moves to the nearest catch block.
      // new Error() - This creates a new instance of JavaScript's built-in Error object. It's the standard way to create error objects in JavaScript.
    }

    // const userData = await response.json();
    // console.log(userData);
    console.log(`${userData.name} has ${userData.public_repos} public GitHub repos!`);
  } catch (err) {
    console.error('Error:', err);
  }
}

fetchUser();


// Expected Output:
// Leon Shimizu has [X] public GitHub repos!
// { ...GitHub user object... }


// =====================================
// 12 - ASYNC/AWAIT WITH ERROR + CLEANUP
// =====================================
/*
Description:
Simulates a process that might fail.
Demonstrates using try/catch/finally for error handling and cleanup.
*/

function fetchNumber() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const rand = Math.random();
      if (rand < 0.3) {
        reject('Random fetch error!');
      } else {
        resolve(rand * 100);
      }
    }, 600);
  });
}

function processNumber(num) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (typeof num !== 'number') {
        reject('Invalid input. Expected a number!');
      } else {
        resolve(Math.round(num));
      }
    }, 400);
  });
}

async function runProcess() {
  console.log('Starting process...');
  try {
    const rawNum = await fetchNumber();
    console.log('Fetched raw number:', rawNum);

    const processed = await processNumber(rawNum);
    console.log('Processed number:', processed);
  } catch (error) {
    console.error('Error in runProcess:', error);
  } finally {
    console.log('Process finished (success or error).');
  }
}

runProcess();

// Expected Output:
// Starting process...
// (after 0.6s) Fetched raw number: <some number>
// (after 0.4s) Processed number: <rounded number>
// OR
// Error in runProcess: Random fetch error!
// Process finished (success or error).



//------------------------ WEEK 11 Day 2: ----------------------------
REVIEW OF YESTERDAY 11.1

//------------------------ WEEK 11 Day 3: ----------------------------
// === Lesson: Understanding Promise.all vs Promise.race ===

// 1. `Promise.all` - Wait for All Promises to Resolve or Reject

/**
 * Fetches multiple resources in parallel and waits for all of them to resolve.
 */
async function fetchMultipleResources() {
  const urls = [
    'https://jsonplaceholder.typicode.com/posts/1',
    'https://jsonplaceholder.typicode.com/users/2',
    'https://jsonplaceholder.typicode.com/comments/3',
  ];

  try {
    // Fetch all URLs in parallel using Promise.all
    const responses = await Promise.all(urls.map(url => fetch(url)));

    // Ensure all responses are successful
    responses.forEach(response => {
      if (!response.ok) {
        throw new Error(`HTTP error. Status: ${response.status}`);
      }
    });

    // Convert all responses to JSON
    const dataPromises = responses.map(response => response.json());

    // Wait for all JSON data to resolve
    const data = await Promise.all(dataPromises);

    // All data received successfully
    console.log('All Data Received:', data);

  } catch (error) {
    console.log('Error:', error);  // Logs if any promise fails
  }
}

// Calling the fetchMultipleResources function
fetchMultipleResources();

// 2. `Promise.race` - Proceed with the First Promise to Settle

/**
 * Simulates timers with different delays, and proceeds with the first one to finish.
 */
function createTimer(delay, name) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(`Timer ${name} finished in ${delay} ms`);
    }, delay);
  })
}

async function raceTimers() {
  try {
    // Race multiple timer promises
    const result = await Promise.race([
      createTimer(1000, 'One'),
      createTimer(2000, 'Two'),
      createTimer(500, '.5')
    ]);

    // Log the result of the first settled promise (fastest timer)
    console.log('Winner:', result);

  } catch (error) {
    console.log('Error:', error);  // Logs if any promise rejects
  }
}

// Calling the raceTimers function
raceTimers();

/*
  === Comparison Summary: `Promise.all` vs `Promise.race` ===

  | Feature                        | `Promise.all`                                    | `Promise.race`                                       |
  |---------------------------------|--------------------------------------------------|------------------------------------------------------|
  | **Behavior**                    | Waits for **all promises to resolve** (or one to reject) | Waits for **the first promise** to settle (resolve or reject) |
  | **Resolution**                  | Resolves when **all promises resolve** successfully | Resolves with the first settled promise (either resolve or reject) |
  | **Rejection**                   | Rejects if **any promise rejects**               | Rejects with the result of the **first rejected promise** |
  | **Use case**                    | Use when you need to wait for **all promises** to complete | Use when you only care about **the fastest promise** |
  | **Order of Results**            | Results are returned in the order of the input array | The result of the first promise to settle is returned |

  === Example Use Cases ===

  - **Use `Promise.all`** when you need to make multiple API calls or perform tasks in parallel and wait for all to finish before proceeding.
  - **Use `Promise.race`** when you care about the fastest promise and want to stop as soon as the first promise settles.

*/

//---------------------------- THREADS --------------------------------------------


//----------------------------- MICROTASKS and MACROTASKS ----------------------------
1. Understanding Microtasks and Macrotasks
Concept: JavaScript handles asynchronous tasks by splitting them into microtasks and macrotasks.Knowing the difference between these two task types helps you predict and control the execution order in asynchronous code.
Why Microtasks and Macrotasks Matter ?
  Microtasks(like Promises) execute after the current script completes but before any macrotasks.
    Macrotasks(like setTimeout callbacks) only execute after all microtasks have finished, even if the timeout is set to zero.
Code Example: Observing Microtask and Macrotask Execution Order
javascript
Copy code
// taskOrder.js

console.log('Script start');

setTimeout(() => {
  console.log('setTimeout');
}, 0);

Promise.resolve().then(() => {
  console.log('Promise1');
}).then(() => {
  console.log('Promise2');
});

console.log('Script end');

Expected Output:
arduino
Copy code
Script start
Script end
Promise1
Promise2
setTimeout

Explanation:
console.log('Script start') and console.log('Script end') run first because they're synchronous.
The microtasks(Promise callbacks) execute next, resulting in "Promise1" and "Promise2".
The macrotask(setTimeout) runs last, even with a delay of zero.
  Activity:
Copy the example code above into a new JavaScript file.
Run it in the console to observe the order of execution.
Experiment by adding additional setTimeout and Promise calls to see how they affect execution order.
Key Takeaway:
Microtasks complete before macrotasks.This understanding helps prevent unexpected behavior when combining asynchronous operations in JavaScript.

2. Implementing a Retry Mechanism for Failed Requests
Concept: Network requests may occasionally fail due to temporary issues(e.g., connectivity or server issues).Implementing a retry mechanism with exponential backoff allows your application to handle these failures gracefully by retrying requests after increasing delays.
Why Implement a Retry Mechanism ?
  Improves application resilience by handling intermittent network issues.
Reduces the chance of failed requests affecting the user experience.
Exponential backoff helps prevent overwhelming the server with immediate retries.
Code Example: Retry Mechanism with Exponential Backoff
javascript
Copy code
// retryFetch.js

async function fetchWithRetry(url, options = {}, retries = 3, delay = 1000) {
  try {
    const response = await fetch(url, options);

    if (!response.ok) {
      throw new Error(`Server responded with status ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    if (retries > 0) {
      console.log(`Retrying... Attempts left: ${retries}`);
      await new Promise(res => setTimeout(res, delay));
      return await fetchWithRetry(url, options, retries - 1, delay * 2); // Exponential backoff
    } else {
      console.error('Request failed after maximum retries');
      throw error;
    }
  }
}

// Usage example
fetchWithRetry('https://api.example.com/data')
  .then(data => console.log('Fetched data:', data))
  .catch(error => console.error('Fetch failed:', error));

Explanation:
Initial Attempt: The fetchWithRetry function tries to fetch data from the given URL.
Failure Handling: If the fetch fails(due to a network issue or a non - 2xx response status), it enters the catch block.
  Retries: The function retries the request, with the delay doubling each time(exponential backoff).
Max Retries: After exhausting the retries, an error message is logged, and the error is thrown.
  Activity:
Implement the fetchWithRetry function in a new JavaScript file.
Test it with a valid URL to see successful data retrieval.
Change the URL to an invalid endpoint to observe the retry mechanism in action.
Adjust retries and delay values to understand the impact of different backoff strategies.
Key Takeaway:
The retry mechanism with exponential backoff is a valuable tool for building resilient applications that handle network instability gracefully.

Practice Challenge
Combine Microtasks and Macrotasks:
Write code that includes both microtasks(using Promise callbacks) and macrotasks(setTimeout) to control asynchronous execution order.
Experiment with nested Promise and setTimeout calls to observe and control their behavior.
Implement Retry Mechanism with Advanced Features:
Modify the retry mechanism to handle specific HTTP errors differently(e.g., skip retries for client errors like 404).
Add an optional maxDelay parameter to prevent excessively long delays.
User Feedback and Error Logging:
Enhance the retry mechanism to display user - friendly messages when retries are happening(e.g., "Retrying connection…").
Log detailed error information in a central location(e.g., console, alert, or in -app message).

  //-------------------------------- Week 11 Day 4 --------------------------------------
  QOTD:

