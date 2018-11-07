#!/bin/bash

# Download pretrained embeddings.
#curl -O http://appositive.cs.washington.edu/resources/turian.50d.txt
curl -O https://nlp.stanford.edu/data/glove.840B.300d.zip
unzip glove.840B.300d.zip
#rm glove.840B.300d.zip

# Build custom kernels.
#TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')

# Build custom kernels.
#TF_CFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))') )
#TF_LFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))') )


# Linux (pip)
#g++ -std=c++11 -shared coref_kernels.cc -o coref_kernels.so -I $TF_INC -fPIC -D_GLIBCXX_USE_CXX11_ABI=0
#g++ -std=c++11 -shared coref_kernels.cc -o coref_kernels.so -fPIC ${TF_CFLAGS[@]} ${TF_LFLAGS[@]} -O2 -D_GLIBCXX_USE_CXX11_ABI=0


# Linux (build from source)
#g++ -std=c++11 -shared coref_kernels.cc -o coref_kernels.so -I $TF_INC -fPIC

# Mac
#g++ -std=c++11 -shared coref_kernels.cc -o coref_kernels.so -I $TF_INC -fPIC -D_GLIBCXX_USE_CXX11_ABI=0  -undefined dynamic_lookup
