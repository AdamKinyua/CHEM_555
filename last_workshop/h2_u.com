%chk=h2_r.chk
#P uhf/sto-3g output=matrix nosymm scf=conven int=noraff guess=mix

unrestricted_2

0 1
H              
H 1 1.5

h2_unrestricted.mat

