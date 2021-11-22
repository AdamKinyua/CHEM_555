program frutas_1    

implicit none 

character(len=256)::name
integer::number

write(*,*) 'Please enter fruit name'
write(*,*) 'please enter the number of fruits'
read(*,*) name, number
write(*,*) number
write(*,*)'your fruit is,' //trim(name)// ' :-)'

if (name .eq. 'pear') then 
 write(*,*) 'fruit is pear'

elseIf (name .eq. 'apple') then
 write(*,*) 'fruit is aple'

elseIf (name .eq. 'plum') then
 write(*,*) 'fruit is plum'

elseIf (name .eq. 'orange') then
 write(*,*) 'fruit is orange'

else
 write(*,*)'We have a mystery fruit'

endIf

end program frutas_1 


