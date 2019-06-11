(*Limits Mathematica to requested resources*)
Unprotect[$ProcessorCount];$ProcessorCount = 4;
 
(*Prints the machine name that each kernel is running on*)
Print[ParallelEvaluate[$MachineName]];

(*Prints all Mersenne PRime numbers less than 5000*)
Print[Parallelize[Select[Range[5000],PrimeQ[2^#-1]&]]];
