program workshop_1

  implicit none 
  
  character(len=256):: holder
  real::E,m, l, b, p
  integer:: n, narms
  p = 3.142

  narms = command_argument_count()
  if (narms .ne. 4) then
    write(*,*) 'Values of n, m, l, and b, should be provided'
    stop
  endIf

  call get_command_argument(1, holder)
  read(holder, '(i3)') n
  call get_command_argument(2, holder)
  read(holder, '(f10.3)') m
  call get_command_argument(3, holder)
  read(holder, '(f10.3)') l
  call get_command_argument(4, holder)
  read(holder, '(f10.3)') b

  E = (float(n)**2*p**2)/(2*m*l**2) + b*l/2
  write(*,*) 'E is:',E


end program workshop_1
