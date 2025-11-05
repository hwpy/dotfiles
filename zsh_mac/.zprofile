
# MacPorts Installer addition on 2024-09-18_at_17:27:57: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Homebrew
# eval "$(/usr/local/bin/brew shellenv)"
# export PATH=/usr/local/bin:$PATH

# Packages
export PATH=/opt/local/lib/postgresql15/bin:$PATH
export CFLAGS="-I/opt/local/include/freetds"

# openssl
export LDFLAGS="-L/opt/local/libexec/openssl3/lib"
export CPPFLAGS="-I/opt/local/libexec/openssl3/include"

# macports
export C_INCLUDE_PATH=/opt/local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/opt/local/include:$CPLUS_INCLUDE_PATH
export LIBRARY_PATH=/opt/local/lib:$LIBRARY_PATH

# homebrew
# export C_INCLUDE_PATH=/usr/local/include:$C_INCLUDE_PATH
# export CPLUS_INCLUDE_PATH=/usr/local/include:$CPLUS_INCLUDE_PATH
# export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH

# other
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# user path
export PATH="~/.local/bin:$PATH"
