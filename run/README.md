# Example run using your own images
This folder contain my test images and you can test my program by creating similar ones in Paint or whatever.
## Demo output:
```
>> digitrecog
Welcome! This is the pattern recignition bot beep boop
------------------------------------------------------
Write filename of your digit image or r for a random number: image7.png
Integer value for cut-off parameter k: 42
Relative residual = 0.44336
Predicted number = 7
```
This is what the input image looked like:

![alt text](https://raw.githubusercontent.com/hd4niel/SVD-pattern-recognition/master/run/image7.png "Input digit 7")

And this is how my pattern recognition program interprets it so that it can be compared with the NIST data:

![alt text](https://raw.githubusercontent.com/hd4niel/SVD-pattern-recognition/master/run/output7.png "Interpreted digit 7")

## Image requirements
- Square shaped: *height px = width px*
- White background: *rgb(255,255,255)*
- Black digit: *rgb(0,0,0)*
- Placement: *In this run/ folder!*