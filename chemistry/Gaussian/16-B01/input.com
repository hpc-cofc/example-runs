%nproc=20
%mem=110gb
%chk=jneutral-opt.chk
#T b3lyp/6-31+G* integral=UltraFine opt(maxstep=10,maxcycles=200)

4-BMC-optimization

0 1
O          0.00000        0.00000        0.00000
C          0.00000        0.00000        3.50600
C          0.00000        0.97000        2.28000
C          1.45100       -0.52200        3.25200
C          1.30800        1.79400        2.51700
C          2.28200        0.79500        3.22500
C          1.35400       -0.96600        1.80900
C          0.38700       -0.00800        1.16800
C         -0.16600        0.70700        4.85600
C         -1.05600       -1.10900        3.39800
C         -1.24100        1.79300        1.99500
H          1.79700       -1.29000        3.96000
H          1.08000        2.66500        3.15200
H          1.71000        2.17800        1.56600
H          3.22200        0.66500        2.66700
H          2.53700        1.12700        4.24400
H          0.51000        1.56400        4.98600
H          0.02600       -0.00500        5.67600
H         -1.20100        1.07300        4.96800
H         -0.91900       -1.84200        4.21200
H         -1.00000       -1.65300        2.44100
H         -2.06900       -0.68600        3.49300
H         -1.09900        2.38900        1.07900
H         -1.45400        2.48200        2.82900
H         -2.11800        1.14600        1.83500
C          1.93800       -1.98700        1.12200
H          2.25200       -2.85000        1.72600
C          2.22300       -2.03300       -0.31600
C          1.45800       -1.31800       -1.27000
C          3.28700       -2.84400       -0.78300
C          1.77600       -1.38900       -2.63700
H          0.59000       -0.73900       -0.94700
C          3.60200       -2.90100       -2.14900
H          3.87200       -3.42400       -0.06100
C          2.85600       -2.17000       -3.10000
H          1.16500       -0.83800       -3.36000
H          4.43500       -3.52900       -2.48500
C          3.20900       -2.23400       -4.56900
H          3.26000       -3.27800       -4.91800
H          2.46300       -1.70300       -5.18000
H          4.19300       -1.77200       -4.75600

