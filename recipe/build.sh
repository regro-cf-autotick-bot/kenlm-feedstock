
BDIR="./build"

[[ -d $BDIR ]] && rm -rf $BDIR
mkdir $BDIR

# Build
pushd $BDIR
cmake .. -DKENLM_MAX_ORDER=$KENLM_MAX_ORDER -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX
# Install
make -j all install
popd
rm -rf $BDIR

# Install python module
MAX_ORDER="$KENLM_MAX_ORDER" $PYTHON -m pip install .
