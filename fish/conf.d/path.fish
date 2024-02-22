# Add anaconda or default python to PATH
fish_add_path ~/anaconda3/bin

# Java path
fish_add_path /usr/lib/jvm/jdk-17/bin
#Spring CLI
fish_add_path /opt/spring-3.0.1/bin
# AVRA
fish_add_path /opt/avra-1.3.0/src
# AVRGCC & AVRDUDE
fish_add_path /opt/arduino-1.8.19/hardware/tools/avr/bin

fish_add_path /home/santatra/.dotnet/

# Deno and yarn
set DENO_INSTALL "/home/santatra/.deno"
fish_add_path "$DENO_INSTALL/bin"
fish_add_path "/home/santatra/.yarn/bin"
fish_add_path "/usr/local/go/bin"
