program input_command_line
  implicit none 
  integer:: x, y, sum, nargs 
  character:: inarg

  nargs = command_argument_count()
  if (nargs .ne. 1) then
    print*, 'a single integer value should be specified'
    stop
  endIf

  call get_command_argument(1, inarg)
  read (inarg, '(i3)') y

  x = 6   
  sum = x + y
  
  print*,'the value of y is', y

  if (sum .eq. 9) then
    print*, 'Hurray!'

  else
    print*, 'uh oh'

  endIf


end program input_command_line
