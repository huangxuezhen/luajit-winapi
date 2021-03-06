require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  WINAPI_SocketCode_int WSADeleteSocketPeerTargetName( SOCKET Socket, const struct sockaddr* PeerAddr, ULONG PeerAddrLen, LPWSAOVERLAPPED Overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE CompletionRoutine);
  WINAPI_SocketCode_int WSAImpersonateSocketPeer(      SOCKET Socket, const sockaddr* PeerAddress, ULONG peerAddressLen);
  WINAPI_SocketCode_int WSAQuerySocketSecurity(        SOCKET Socket, const SOCKET_SECURITY_QUERY_TEMPLATE* SecurityQueryTemplate, ULONG SecurityQueryTemplateLen, SOCKET_SECURITY_QUERY_INFO* SecurityQueryInfo, ULONG* SecurityQueryInfoLen, LPWSAOVERLAPPED Overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE CompletionRoutine);
  WINAPI_SocketCode_int WSARevertImpersonation(        );
  WINAPI_SocketCode_int WSASetSocketPeerTargetName(    SOCKET Socket, const SOCKET_PEER_TARGET_NAME* PeerTargetName, ULONG PeerTargetNameLen, LPWSAOVERLAPPED Overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE CompletionRoutine);
  WINAPI_SocketCode_int WSASetSocketSecurity(          SOCKET Socket, const SOCKET_SECURITY_SETTINGS* SecuritySettings, ULONG SecuritySettingsLen, LPWSAOVERLAPPED Overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE CompletionRoutine);
]]
return ffi.load( 'Fwpuclnt.dll' )
