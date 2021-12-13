#P rhf nosymm output=matrix int=noraf scf=conven

Hydrogen_Molecule

0 1
H              
H 1  1.0
H 2  1.0  1  180.
H 3 1.0  2  180.  1  0.0

hxxx_Ang.mat

