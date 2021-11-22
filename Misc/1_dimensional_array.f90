program one_dimensional_array
  
  implicit none

  real::A(5)
  real::B(-2:2)
  integer::i

  write(*,*) 'A(5)'
  do i = 1, 5
    write(*,*) '', A(i)
  endDo

  write(*,*)
  write(*,*) 'B(-2:2)'
  do i = -2, 8
    write(*,*) '', B(i)
  endDo

end program one_dimensional_array
