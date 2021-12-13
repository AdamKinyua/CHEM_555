#P rhf nosymm output=matrix int=noraf scf=conven

ch4_molecule

0 1
 C              
 H                  1            B1
 H                  1            B2    2            A1
 H                  1            B3    2            A2    3            D1    0
 H                  1            B4    2            A3    3            D2    0

   B1             1.07000000
   B2             1.07000000
   B3             1.07000000
   B4             1.07000000
   A1           109.47120272
   A2           109.47120272
   A3           109.47123145
   D1           120.00001472
   D2          -119.99999264

ch4_Ang.mat

