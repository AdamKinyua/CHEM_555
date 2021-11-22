program worksheet_5

implicit none 

integer::i,max_i=5
integer::j

do i = 1,max_i
 do j = 1,i-1
  write(*,*) 'i,j equals', i,',',j
 endDo
endDo

end program worksheet_5


