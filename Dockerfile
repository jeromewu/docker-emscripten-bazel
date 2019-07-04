FROM trzeci/emscripten:sdk-tag-1.38.32-64bit
# Install required packages
RUN apt-get update \
    && apt-get install -y pkg-config zip g++ zlib1g-dev unzip python
# Download and install bazel
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.26.0/bazel-0.26.0-installer-linux-x86_64.sh \
    && chmod +x bazel-0.26.0-installer-linux-x86_64.sh \
    && ./bazel-0.26.0-installer-linux-x86_64.sh \
    && rm ./bazel-0.26.0-installer-linux-x86_64.sh \
    && bazel clean --expunge
# Copy default emscripten config
COPY .emscripten /root/.emscripten
