program timer 
  implicit none
  real :: start, finish,runtime 
  call cpu_time(start)
  !Code comes in here
  call cpu_time(finish)
  runtime = finish-start
  print*,'runtime: ', runtime
end program timer 
