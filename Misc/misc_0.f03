program misc_0

  implicit none 

  integer::i,j, max_i = 5, max_j = 5
  
  do i = 1, max_i
    write(*,*) 'i equals', i
  endDo

  do j = max_j, 1, -2
    write(*,*) 'j equals', j
  endDo



end program misc_0
