# Pattern recognition using singular value decomposition

Source code is under *src* and my images are in *run*. The document report.pdf is my paper on the topic, produced using LaTeX in the *report* folder.

## Abstract

*This paper presents a linear algebra method for pattern recognition.
Singular value decomposition is used to distinguish single handwritten
digits. I implement a method for giving test images to the program and
examine the goodness of recognition when accounting for different number
of variations in the training data.*

## Run in MATLAB command window: 
**Go to *src***

**>> cd [your-path-to-svd]/SVD-pattern-recognition-master/src/**

**Run main.m**

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
- Going forward or rather running the recognition multiple times the U will not be recalculated since the program checks for its existance in the base worksapce.

## More on how to run using your own images
The run/ folder contain readily available test .png images and you can create your own in any old graphics editor.

### Image requirements
- Square shaped: *height px = width px*
- White background: *rgb(255,255,255)*
- Black digit: *rgb(0,0,0)*
- Placement: *In the run/ folder!*

### Demo output:
```
>> main
Welcome! This is the pattern recignition bot beep boop
------------------------------------------------------
Write "test" for testing one number or "graph" for data collection: test
Filename of your digit image or "r" for a random number: image7.png
Integer value for cut-off parameter k: 42
Relative residual = 0.44336
Predicted number = 7
```
This is what the input image looked like:

![alt text](https://raw.githubusercontent.com/hd4niel/SVD-pattern-recognition/master/run/image7.png "Input digit 7")

And this is how my pattern recognition program interprets it so that it can be compared with the NIST data:

![alt text](https://raw.githubusercontent.com/hd4niel/SVD-pattern-recognition/master/run/output7.png "Interpreted digit 7")

Now plotting relative residual vs parameter k:
```
>> main
Welcome! This is the pattern recignition bot beep boop
------------------------------------------------------
Write "test" for testing one number or "graph" for data collection: graph
Filename of your digit image: image7.png
Integer value for cut-off parameter k: 30
```

![alt text](https://raw.githubusercontent.com/hd4niel/SVD-pattern-recognition/master/run/image7graph.png "Graph of relative residuals for image7.png")
