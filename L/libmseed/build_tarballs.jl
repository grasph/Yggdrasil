using BinaryBuilder

name = "libmseed"
version = v"3.0.17"

# Collection of sources required to build libmseed
sources = [
    GitSource("https://github.com/iris-edu/libmseed",
              "b17f7dc8632af430c8f41056d297cf75f6093a58"),
]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir/libmseed/

# Specify LIBDIR and LIB_SO_BASE since these are different on Windows than otherwise
make install PREFIX="${prefix}" LIBDIR="${libdir}" LIB_SO_BASE=libmseed.${dlext}
"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = supported_platforms()

# The products that we will ensure are always built
products = [
    LibraryProduct("libmseed", :libmseed),
]

# Dependencies that must be installed before this package can be built
dependencies = Dependency[
]

build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies; julia_compat="1.6")
