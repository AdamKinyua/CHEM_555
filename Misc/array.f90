program array

  implicit none 

  integer::matA(2,3)
  integer::i,j

  matA=reshape((/2,4,3,6,9,8/),(/2,3/))

  do i = 1,2
      write(*,*)(matA(i,j), j = 2,3)
  endDo

end program array
