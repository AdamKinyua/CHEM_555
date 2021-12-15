%chk=ethylene_opt_singlet.chk
#P rhf/6-31g(d) test opt

Etheylene Optimization using parameters in gaussian book pg 42 

0 1
 C              
 C 1 CC
 H 1 CH 2 HCC
 H 1 CH 2 HCC 3 180. 
 H 2 CH 1 HCC 3 180. 
 H 2 CH 1 HCC 4 180.


CC=1.31
CH=1.07
HCC=121.5

