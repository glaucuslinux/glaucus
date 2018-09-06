#!/usr/bin/dash -ex

prepare () {
	. /home/glaucus/scripts/variables
	. /home/glaucus/scripts/toolchain/clean.sh
	
	assign_basic_variables

	. $CERD/gcc/ceras
	tar xfv $CERD/gcc/gcc-$version.tar.xz -C $TMPD/toolchain/sources

	cd $TMPD/toolchain/builds
	mkdir -v linux binutils gcc_1 musl gcc_2
}

construct () {
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

prepare
construct linux binutils gmp mpc mpfr gcc_1 musl gcc_2
