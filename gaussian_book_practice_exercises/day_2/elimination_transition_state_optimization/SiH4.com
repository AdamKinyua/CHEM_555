#T RHF/6-31G(d) Opt=(QST2, AddRedundant) Test

SiH2 + H2 --> SiH4 Reactants 

0,1
Si
X 1 1.0
H 1 1.48 2 55.0
H 1 1.48 2 55.0 3 180.0
H 1 R 2 A1 3 90.0 
H 1 R 5 A2 2 180.0

R=2.0
A1=180.0
A2=22.0

SiH2 + H2 --> SiH4 Products 

Si
X 1 1.0
H 1 1.48 2 55.0
H 1 1.48 2 55.0 3 180.0
H 1 R 2 A1 3 90.0
H 1 R 5 A2 2 180.0

R=1.48
A1=125.2
A2=109.5

4 5

