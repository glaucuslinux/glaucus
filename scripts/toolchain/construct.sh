#!/usr/bin/dash -ex
construct(){
        for item in $@
        do
                case $item in
                        binutils_*)
                                . $CERD/binutils/ceras
                                build_toolchain $item
                                ;;
                        gmp_*)
                                . $CERD/gmp/ceras
                                build_toolchain $item
                                ;;
                        mpfr_*)
                                . $CERD/mpfr/ceras
                                build_toolchain $item
                                ;;
                        mpc_*)
                                . $CERD/mpc/ceras
                                build_toolchain $item
                                ;;
                        gcc_*)
                                . $CERD/gcc/ceras
                                build_toolchain $item
                                ;;
                        linux|musl|libstdc++-v3|isl)
                                . $CERD/$item/ceras
                                build_toolchain
                                ;;
                esac
        done
}
construct binutils_1 \
        gmp_1 mpfr_1 mpc_1 \
        gcc_1 \
        linux \
        musl \
        libstdc++-v3 \
        binutils_2 \
        gmp_2 mpfr_2 mpc_2 isl \
        gcc_2
