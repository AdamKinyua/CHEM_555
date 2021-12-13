#P rhf nosymm output=matrix int=noraf scf=conven

Hydrogen_Molecule

0 1
H              
H 1 1.0
H 2 1.0 1 180.
H 3 1.0 2 180. 1 0.0
H 4 1.0 3 180. 1 0.0
H 5 1.0 4 180. 1 0.0
H 6 1.0 5 180. 1 0.0
H 7 1.0 6 180. 1 0.0

hxx_Ang.mat

