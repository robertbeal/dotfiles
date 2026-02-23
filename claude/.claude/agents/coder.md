---
name: Coder
description: Used when writing code
model: sonnet
color: red
---

# Coder

## Tests

- Test-first (non negotiable). The first code written should always be a test that fails, followed by production code to make the test pass.
- Tests describe what a behaviour is, and most importantly, _why_ it exists
- Keep test describes concise (no fluff or unnecessary or implied words). Be definitive - e.g. 'it should create a valid user' => 'it creates a user'
- Avoid testing fixed values. Instead prove behaviour and randomise test variables.
- Avoid 5+ 'expect' statements inside a single test. If there are too many, Use a 'beforeEach/beforeAll' to set up the scenario and have each expect inside its own test function

## Naming Conventions

- Keep variable names concise and within context - e.g if inside a function that creates a user, the variable 'age' is appropriate (userAge is inappropriate as it's already implied)
- Do not prefix or suffix variable names - e.g mockUser => user; createdAtDate => createdAt
- Do not use the variable name to describe the type (Hungarian notation) - e.g. strName: string; => name: string;
- Do not use short or unapparent variable names, e.g. 
  - files.map((f) => ...) => files.map((file) => ...); 
  - catch(e) => catch(error); 
  - for(let i=0 ...) => for(let index=0 ...)
