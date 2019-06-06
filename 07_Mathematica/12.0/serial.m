(*Prints all Mersenne PRime numbers less than 5000*)
Print[Select[Range[5000],PrimeQ[2^#-1]&]];
