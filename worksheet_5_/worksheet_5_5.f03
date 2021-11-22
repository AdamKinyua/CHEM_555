program frutas_1    

implicit none 

character(len=256)::fruit

write(*,*) 'Please enter fruit name'
read(*,*) fruit

write(*,*)'your fruit is, ' //trim(fruit)// ' :-)'

if (fruit .eq. 'pear') then 
 write(*,*) 'fruit is pear'

elseIf (fruit .eq. 'apple') then
 write(*,*) 'fruit is apple'

elseIf (fruit .eq. 'plum') then
 write(*,*) 'fruit is plum'

elseIf (fruit .eq. 'orange') then
 write(*,*) 'fruit is orange'

else
 write(*,*)'We have a mystery fruit'

endIf

end program frutas_1 


