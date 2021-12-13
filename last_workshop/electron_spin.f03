program mulliken

!This Code computes Mulliken Charges and electron Population in a molecule
!For Workshop_2
  use mqc_gaussian
  use mqc_algebra 
  use mqc_est
  implicit none
!Declaration of Variables 
  character(len=:), allocatable::fileName
  type(mqc_gaussian_unformatted_matrix_file)::fileInfo
  type(mqc_molecule_data):: moldata
  type(mqc_scf_integral)::density, overlap
  type(mqc_matrix)::tmpMat,sMat
  type(mqc_vector):: mullikenPop
  integer::iOut=6,nBasis,nAtoms,i,j
  integer,dimension(:),allocatable::basisArray

!taking the name of the matrix from file on command line

  call mqc_get_command_argument(1, fileName)
  call fileInfo%load(fileName)

!Code to extract relevant quantities required for computing equation 1

    nBasis = fileInfo%getVal('nBasis')
    call fileInfo%getESTObj('overlap',est_integral=overlap)
    call fileInfo%getESTObj('density',est_integral=density)
    call fileInfo%getMolData(moldata)
    nAtoms = moldata%getNumAtoms()
    basisArray = fileInfo%getBasisArray('basis2Atom')



!MQC ALGEBRA

      sMat = overlap%getBlock('alpha')
      tmpMat=density%getBlock('alpha') - density%getBlock('beta')
  
  
!Initialize an Array of nAtoms length to store the partial charge information

    call mullikenPop%init(nAtoms)


!Loop Over all basis functions in orfder to compute the partial charges using eq. 1

    do i = 1, nBasis
      do j = 1, nBasis
        call mullikenPop%put(mullikenPop%at(basisArray(i))+0.5*sMat%at(i,j)*tmpMat%at(j,i),basisArray(i))
        call mullikenPop%put(mullikenPop%at(basisArray(j))+0.5*sMat%at(i,j)*tmpMat%at(j,i),basisArray(j))
      endDo
    endDo

!Subtracting the electron population from the nuclear charges to get the mulliken charges

    call mullikenPop%print(iOut,'Mulliken Electron Population')
    call mullikenPop%print(iOut,'Spin Density')

end program mulliken

