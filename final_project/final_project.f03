program hartreefock 

    use mqc_gaussian
    use iso_fortran_env

        implicit none
        character(len=:),allocatable :: command,fileName
        type(mqc_gaussian_unformatted_matrix_file)::matFile
        integer(kind=int64)::iOut=output_unit,iIn=input_unit,iPrint=0,i,j,nElec,nAlpha,nBeta,nBasis, &
        iter=1,max_iter=18,nBasUse,multi
        type(mqc_scalar)::conver,thresh
        type(mqc_wavefunction)::wavefunc
        type(mqc_molecule_data)::moleculeInfo
        type(mqc_twoERIs),dimension(1)::eris
        type(mqc_scalar)::Vnn,Energy,half
        type(mqc_scf_integral ):: Gmat,Fock,Xmat,old_density

        real :: start, finish,runtime


        half = 0.5
        thresh = 1.0e-8

        j = 1
        do i=1,command_argument_count()
            if (i.ne.j) cycle
            call mqc_get_command_argument(i,command)
            if (command.eq.'-f') then
  !
  !*              -f matrix_file    Input matrix file with initial set of molecular orbitals
  !
            call mqc_get_command_argument(i+1,fileName)
              j = i + 2
            else 
              call mqc_error_A('Unrecognized input flag',6,'command',command)
            endIf
            deallocate(command)
        endDo
!
!      Recover required data from matrix file.
!
      call matFile%load(fileName)
      call matFile%getESTObj('wavefunction',wavefunc)
      call wavefunc%print(iOut,'all')
      call matFile%getMolData(moleculeInfo)
      call matFile%get2ERIs('regular',eris(1))
      call eris(1)%print(iOut,'AO 2ERIs')
      nElec = wavefunc%nElectrons%ival()
      nAlpha = wavefunc%nAlpha%ival()
      nBeta = wavefunc%nBeta%ival()
      nBasis = wavefunc%nbasis%ival()
!
! Compute nuclear nuclear repulsion energy
!
      Vnn = mqc_get_nuclear_repulsion(moleculeInfo)
      call moleculeInfo%print(iOut)
      call Vnn%print(iOut,'Nuclear Repulsion Energy (au)')

!
!Initialize the density matrix here (to debug you can use the already - converged density matrix from Gaussian stored in wavefunc%density matrix and check convergence is achieved in a single step. 
!Otherwise initialize the density matrix to the zero matrix using wavefunc%density matrix%init routine. 
!The wavefunc%density matrix is the variable to use to store the density matrix.
! 
!INITIALIZING DENSITY MATRIX
      call wavefunc%density_matrix%init(nBasis,nBasis)
      call wavefunc%density_matrix%print(6,'Initial Density Matrixdensity')    
!
!Get the othogonalization matrix X using the mqc scf transformation matrix !routine. 
!You should store the X matrix in the Xmat variable.
!! Multiplies two integrals together
!
      call mqc_scf_transformation_matrix(wavefunc%overlap_matrix,Xmat,nBasUse)
      call Xmat%print(iOut,'Orthogonalization transformation matrix')    
!
!
! Here we start doing the Itinerations 
!
      call cpu_time(start)
      do while ( iter .le.max_iter)
        write(iOut,'(A,I3)') 'Itineration #:',iter
      !call cpu_time(finish)
      !runtime = finish - start
      !print*,'runtime in seconds: ', runtime
!
!Form G matrix using contraction of eris and density matrix using contraction routine.
!Use the Gmat variable to store the G matrix.
!
      Gmat = contraction([eris],wavefunc%density_matrix)
      call Gmat%print(iOut, 'G matrix')
!
!Form the Fock matrix by adding the core Hamitonian to the G matrix. Print it out and 
!if you are using the density matrix from the Gaussian file , check it agrees  with the Fock
!matrix on the Gaussian file (you can print it out using
!call wavefunc%fock matrix%print(iOut,'Fock matrix on Gaussian file') before overwriting
! it ). Use the wavefunc%fock matrix variable to store the Fock matrix.
!
      call wavefunc%core_hamiltonian%print(iOut, 'Core Hamiltonian')
      Fock = Gmat + wavefunc%core_hamiltonian
      call Fock%print(iOut,'Fock Matrix on Gaussian File')
!
!Compute the energy of the current iteration. Save the energy in the Energy
!Variable 
      Energy = half*contraction(wavefunc%fock_matrix,Xmat)
      call Energy%print(iOut,'Iteration Energy (au)')
!
!
!Orthogonalize the Fock Matrix using matmul and dagger routines
!
      Fock = matmul(dagger(Xmat),matmul(Fock,Xmat))
      call Fock%print(iOut,'Orthogonalized Fock Matrix')
!
!Diagonalize the Fock matrix using the diag routine ans save the MO coefficients
!into wavefunc%MO_energies and wavefunc%MO_coefficients.
!
      call Fock%diag(wavefunc%MO_energies,wavefunc%MO_coefficients)
!
!Back-transform the MO coefficients to the nonorthogonal atomic orbital basis 
!using matmul
!
      call wavefunc%MO_coefficients%print(iOut,' Orthogonal MO coefficients')
      wavefunc%MO_coefficients = matmul(Xmat, wavefunc%MO_coefficients)
      call wavefunc%MO_coefficients%print(iOut,'MO coefficients')
      if (wavefunc%wf_type.eq.'G') then
        wavefunc%MO_coefficients = wavefunc%MO_coefficients%orbitals(alphaOrbsIn=[(i, i=1, nBasis, 2),(i, i=-2, -1*nBasis, -2)], &
        betaOrbsIn = [(i, i = -2, -1*nBasis, -2),(i, i = 1, nBasis, 2)])
      endIf
      call wavefunc%MO_energies%print(iOut, 'Orbital Energies')
      call wavefunc%MO_coefficients%print(iOut, 'MO Coefficients')!
!Save the old density matrix to old density and form the new density matrix. You
!will need to extract just the occupied orbitals from the density matrix, which
!can be done using wavefunc%MO_coefficients%orbitals('occupied',[nAlpha],[nBeta]). Then use matmul and
!dagger routines to construct the new density matrix.
!
      old_density = wavefunc%density_matrix
      call old_density%print(iOut, 'Old Density')
      wavefunc%density_matrix = matmul(wavefunc%MO_coefficients%orbitals('occupied', [nAlpha],[nBeta]), &
      dagger(wavefunc%MO_coefficients%orbitals('occupied', [nAlpha], [nBeta])))
      call wavefunc%density_matrix%print(iOut, 'New Density Matrix')
!
!Test convergence and exit or iterate . Store the convergence in conver variable
!The convergence can be obtained by using the mqc_integral_norm routine on the 
!difference between the current and old density matrices. Compare your conver
!variable to the thresh variable and exit if you are comverged (conver.lt.thresh). If you
!have reached the maximum number of iterations, exit the program with an error.
!Otherwise, increment the iteration number by one and redo the loop.
!
      conver = mqc_integral_norm((wavefunc%density_matrix-old_density),'F')
      call conver%print(iOut,'Convergence on density matrix')
          !*******
          call cpu_time(finish)
          runtime = finish - start 
          print*,'runtime in seconds: ', runtime
          !********
      if(conver.le.thresh) exit
      if ( iter .eq.max_iter) call mqc_error('Maximum number of iterations reached') 
        iter = iter+1
      endDo
    call energy%print(iOut,'Final energy')
end program hartreefock


