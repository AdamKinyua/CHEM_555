program misc_5

  implicit none 

  character(len=256)::fruit
  integer::nargs

  nargs = command_argument_count()
  if (nargs .ne. 1) then
    write(*,*) 'A single fruit must be specified'
    stop
  endIf

  call get_command_argument(1, fruit)

  if (fruit .eq. 'orange') then 
    write(*,*)'we have an orange'

  elseIf (fruit .eq. 'guava') then 
    write(*,*)'It shall come to pass'

  else
    write(*,*)'let there be a mystery fruit'
  endIf


end program misc_5
