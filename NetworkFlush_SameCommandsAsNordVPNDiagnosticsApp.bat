


C:\WINDOWS\system32\ipconfig.exe /release
::  releases the IP address on active adapters
C:\WINDOWS\system32\ipconfig.exe /flushdns
::  purges the DNS Resolver cache
C:\WINDOWS\system32\ipconfig.exe /renew
::  renews the IP address on active adapters
C:\WINDOWS\system32\netsh.exe winsock reset
::  resets the Winsock Catalog to a clean state
C:\WINDOWS\system32\netsh.exe interface ipv4 reset
::  resets IPv4 interface information
C:\WINDOWS\system32\netsh.exe interface ipv6 reset
::  resets IPv6 interface information
C:\WINDOWS\system32\netsh.exe interface ip delete destinationcache
::  flushes the destination cache


