#P rhf nosymm output=matrix int=noraf scf=conven

BH3_Molecule

0 1
 B              
 H                  1            B1
 H                  1            B2    2            A1
 H                  1            B3    3            A2    2            D1    0

   B1             1.18000000
   B2             1.18000000
   B3             1.18000000
   A1           120.00000011
   A2           119.99999978
   D1           180.00000000

bh3_Ang.mat

