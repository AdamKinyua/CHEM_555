program workshop_1

  implicit none 

  character(len=3)::inarg
  real::E, m, l, b, p
  integer::n, nargs
  p = 3.142

  nargs = command_argument_count()
  if (nargs .ne. 4) then
    write(*,*) 'Values of n, m, l, and b, should be provided'
    stop
  endIf

  call get_command_argument(1,inarg)
  read(inarg,'(i3)') n
  call get_command_argument(2,inarg)
  read(inarg,'(f10.3)') m
  call get_command_argument(3,inarg)
  read(inarg,'(f10.3)') l
  call get_command_argument(4,inarg)
  read(inarg,'(f10.3)') b

  E = (float(n)**2*p**2)/(2*m*l**2) + b*l/2
  write(*,*) 'E is:',E


end program workshop_1
