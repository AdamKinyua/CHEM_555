program frutas    

implicit none 

character(len=256)::fruit='pear'

if (fruit .eq. 'pear') then 
 write(*,*) 'fruit is pear'

elseIf (fruit .eq. 'apple') then
 write(*,*) 'fruit is aple'

elseIf (fruit .eq. 'plum') then
 write(*,*) 'fruit is plum'

elseIf (fruit .eq. 'orange') then
 write(*,*) 'fruit is orange'

else
 write(*,*)'We have a mystery fruit'

endIf

end program frutas 


