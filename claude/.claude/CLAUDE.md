 ## Coding Principles
 
- Code Consistency above all else
- TDD (Test-Driven Development) - any production code written must be in response to a failing test
- BDD (Behaviour-Driven Development) - prefer testing code behaviour _over_ state or fixed examples
- Test Complexity - use it as a guide to know when to break down a module into seperate modules
- Incremental Change - work in small, incremental commits. Keep the code in a working "green" state between commits.
- Immutable variables - do not mutate a variable once defined

## Worflow

- Red - write a test that fails
- Green - write the simplest production code to make the test pass
- Refactor - re-work the code until it is understandable, clean and concise
