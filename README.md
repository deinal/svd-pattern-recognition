# Pattern recognition using singular value decomposition
### Run in MATLAB command window: 
**Go to src/**

**>> main**
```
Welcome! This is the pattern recignition bot beep boop
------------------------------------------------------
Write "test" for testing one number or "graph" for data collection: graph
Filename of your digit image: image3.png
Integer value for cut-off parameter k: 30
```
or
```
Welcome! This is the pattern recignition bot beep boop
------------------------------------------------------
Write "test" for testing one number or "graph" for data collection: test
Filename of your digit image or "r" for a random number: r
Integer value for cut-off parameter k: 20
```
- The first time the program is run a variable named U should not exist in the workspace (save your work and start off with a clean slate `clear; clc`). 
- The training data U takes approximately 30 seconds to finish, its size is ~30Mb.
- Going forward or rather running the recognition multiple times the U will not be recalculated since *main.m* contains a check for its existance.