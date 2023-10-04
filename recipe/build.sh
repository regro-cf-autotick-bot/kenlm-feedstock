#!/bin/bash
set -ex

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
python setup.py bdist_wheel --install-option="--max_order $KENLM_MAX_ORDER"
pip install dist/kenlm*.whl
