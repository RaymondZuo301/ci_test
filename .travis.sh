ROOT_DIR=`pwd`
BUILD_DIR=$ROOT_DIR/build
DOC_DIR=$BUILD_DIR/doc/doxygen/html

TUTORIALS_DIR=$BUILD_DIR/doc/tutorials/html
ADVANCED_DIR=$BUILD_DIR/doc/advanced/html

CMAKE_C_FLAGS="-Wall -Wextra -Wabi -O2"
CMAKE_CXX_FLAGS="-Wall -Wextra -Wabi -O2"

function build_all ()
{
  # A complete build
  # Configure
  mkdir $BUILD_DIR && cd $BUILD_DIR
  cmake -DCMAKE_C_FLAGS="$CMAKE_C_FLAGS" -DCMAKE_CXX_FLAGS="$CMAKE_CXX_FLAGS" \
        $ROOT_DIR
  # Build
  make -j2
}

case $1 in
  before-install ) before_install;;
  build ) build_all;;
  test ) test_all;;
  doc ) doc;;
esac
