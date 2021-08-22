program tester

    call test_fftpack_qct()
    print *, "All tests in `test_fftpack_qct` passed."

contains

    subroutine check(condition, msg)
        logical, intent(in) :: condition
        character(*), intent(in) :: msg
        if (.not. condition) error stop msg
    end subroutine check

    subroutine test_fftpack_qct
        use fftpack, only: qct
        use iso_fortran_env, only: dp => real64
        real(kind=dp) :: eps = 1.0e-10_dp

        real(kind=dp) :: x(3) = [9, -9, 3]

        call check(sum(abs(qct(x, 2) - [-3.7279220613578570_dp, 21.727922061357859_dp])) < eps, &
                   msg="`qct(x, 2)` failed.")
        call check(sum(abs(qct(x, 3) - qct(x))) < eps, &
                   msg="`qct(x,3)` failed.")
        call check(sum(abs(qct(x, 4) - [-3.3871908980838743_dp, -2.1309424696909023_dp, &
                                        11.645661095452331_dp, 29.872472272322447_dp])) < eps, &
                   msg="`qct(x, 4)` failed.")

    end subroutine test_fftpack_qct

end program tester
