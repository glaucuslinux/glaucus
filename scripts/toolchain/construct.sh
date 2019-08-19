#!/usr/bin/dash -ex
construct(){
        for item in $@
        do
                case $item in
                        linux|binutils|gmp|mpfr|mpc|musl|isl|zstd)
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
construct linux \
        binutils \
        gmp mpfr mpc \
        gcc_1 \
        musl \
        isl \
        zstd \
        gcc_2
