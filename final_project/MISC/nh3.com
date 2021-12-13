#P rhf nosymm output=matrix int=noraf scf=conven

NH3_Molecule

0 1
 N              
 H                  1            B1
 H                  1            B2    2            A1
 H                  1            B3    3            A2    2            D1    0

   B1             1.00000000
   B2             1.00000000
   B3             1.00000000
   A1           109.47120255
   A2           109.47125080
   D1          -119.99998525

nh3_Ang.mat

