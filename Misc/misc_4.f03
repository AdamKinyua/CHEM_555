program misc_4

  implicit none

  character(len=256) :: fruit 

  write(*,*) 'Enter a fruit'

  read(*,*) fruit 

  if (fruit.eq. 'orange') then
    write(*,*) 'someone brought an orange'

  elseIf (fruit.eq. 'guava') then 
    write(*,*) 'someone brought a guava'

  else
    write(*,*) 'A mysterious fruit has come to us'

  endIf


end program misc_4
