#!/usr/bin/dash -ex
<<<<<<< HEAD
<<<<<<< HEAD
construct(){
=======
=======
>>>>>>> cad9b0b9592f2a00ae3f18c547d72250341be9c5
construct () {
>>>>>>> cad9b0b9592f2a00ae3f18c547d72250341be9c5
        for item in "$@"
        do
                case $item in
                        linux|binutils|gmp|mpc|mpfr|musl)
                                . $CERD/$item/ceras
                                build_toolchain
                                ;;
                        gcc_*)
                                . $CERD/gcc/ceras
                                build_toolchain $item
                                ;;
                esac
        done
}
. /home/glaucus/scripts/toolchain/clean.sh
. /home/glaucus/scripts/variables
assign_basic_variables
construct linux binutils gmp mpc mpfr gcc_1 musl gcc_2
