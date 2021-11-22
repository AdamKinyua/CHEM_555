program misc_3

  implicit none 

  character(len=256):: fruit 

  fruit = 'guava'

  if (fruit .eq. 'pear') then
    write(*,*) 'the fuirt is pear'

  elseIf (fruit .eq. 'tangerine') then
    write(*,*) 'fruit is tangerine'

  elseIf (fruit .eq. 'orange') then
    write(*,*) ' fruit is orange'

  else
    write(*,*) 'we have a mysterious fruit'

  endIf


end program misc_3
