# Mathematica 12.0 

Mathematica is a general symbolic and numerical simulation package that is known both for its powerful features and efficiency.

Here is a quick example of interactive serial and parallel calcualtions to print all Mersenne PRime numbers less than 5000.
This example came from [UChicago](https://rcc.uchicago.edu/docs/software/environments/mathematica/index.html)

[![asciicast](https://asciinema.org/a/250322.svg)](https://asciinema.org/a/250322?t=10)

While most people use Mathematica in interactive mode running on one CPU core, it does have capabilies to run on HPCs using a batch queue manager.
We encourage users to do some testing on the login node and do their production runs by submitting
them to compute nodes via the batch scheduler.


## What versions of Mathematica are available?

You can always execute `module spider matlab` to see what versions of Matlab are available. In our
case, you should see something like this:

```
user@localhost>  module spider mathematica

----------------------------------------------------------------------
  math/mathematica:
----------------------------------------------------------------------
    Description:
      Application for symbolic and numerical computation

     Versions:
        math/mathematica/12.0

------------------------------------------------------------------------
  For detailed information about a specific "math/matthematica" module (including how to load the modules) use the module's full name.
  For example:

     $ module spider math/mathematica/12.0
------------------------------------------------------------------------
```

## Limitations
Our current license only allows users to run Mathematica on the login/master node. In the future, we
do plan to have licenses available to run it in batch or interactive mode in the compute nodes.


# Examples

See the example above on running Mathematica on the master node.

