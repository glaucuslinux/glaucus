#!/usr/bin/dash -ex
construct(){
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
construct linux binutils gmp mpc mpfr gcc_1 musl gcc_2
