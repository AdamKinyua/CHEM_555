%chk=h2_r.chk
#P rhf/sto-3g output=matrix nosymm scf=conven int=noraff

restricted_2

0 1
H              
H 1 1.5

h2_restricted.mat

