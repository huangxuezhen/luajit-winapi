require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HBLUETOOTH_RADIO_FIND; //Alias
  typedef HANDLE HBLUETOOTH_DEVICE_FIND; //Alias
  typedef HANDLE HBLUETOOTH_AUTHENTICATION_REGISTRATION; //Alias
  typedef HANDLE HBLUETOOTH_CONTAINER_ELEMENT; //Alias
  typedef LPVOID PFN_AUTHENTICATION_CALLBACK; //Alias
  typedef LPVOID PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK; //Alias
  typedef LPVOID PFN_DEVICE_CALLBACK; //Alias
  typedef LPVOID PFN_AUTHENTICATION_CALLBACK_EX; //Alias
  enum { BLUETOOTH_MAX_NAME_SIZE = 248 };
  enum { BLUETOOTH_MAX_SERVICE_NAME_SIZE = 256 };
  enum { BLUETOOTH_DEVICE_NAME_SIZE = 256 };
  enum { BTH_MAX_PIN_SIZE = 16 };
  typedef ULONGLONG BTH_ADDR; //Alias
  static const BTH_ADDR BLUETOOTH_NULL_ADDRESS = 0;
  typedef struct BLUETOOTH_ADDRESS {
    BTH_ADDR ullLong;
  } BLUETOOTH_ADDRESS;
  typedef USHORT BTH_MFG; //Alias
  static const BTH_MFG BTH_MFG_ERICSSON = 0;
  static const BTH_MFG BTH_MFG_NOKIA = 1;
  static const BTH_MFG BTH_MFG_INTEL = 2;
  static const BTH_MFG BTH_MFG_IBM = 3;
  static const BTH_MFG BTH_MFG_TOSHIBA = 4;
  static const BTH_MFG BTH_MFG_3COM = 5;
  static const BTH_MFG BTH_MFG_MICROSOFT = 6;
  static const BTH_MFG BTH_MFG_LUCENT = 7;
  static const BTH_MFG BTH_MFG_MOTOROLA = 8;
  static const BTH_MFG BTH_MFG_INFINEON = 9;
  static const BTH_MFG BTH_MFG_CSR = 10;
  static const BTH_MFG BTH_MFG_SILICONWAVE = 11;
  static const BTH_MFG BTH_MFG_DIGIANSWER = 12;
  static const BTH_MFG BTH_MFG_TI = 13;
  static const BTH_MFG BTH_MFG_PARTHUS = 14;
  static const BTH_MFG BTH_MFG_BROADCOM = 15;
  static const BTH_MFG BTH_MFG_MITEL = 16;
  static const BTH_MFG BTH_MFG_WIDCOMM = 17;
  static const BTH_MFG BTH_MFG_ZEEVO = 18;
  static const BTH_MFG BTH_MFG_ATMEL = 19;
  static const BTH_MFG BTH_MFG_MITSIBUSHI = 20;
  static const BTH_MFG BTH_MFG_RTX_TELECOM = 21;
  static const BTH_MFG BTH_MFG_KC_TECHNOLOGY = 22;
  static const BTH_MFG BTH_MFG_NEWLOGIC = 23;
  static const BTH_MFG BTH_MFG_TRANSILICA = 24;
  static const BTH_MFG BTH_MFG_ROHDE_SCHWARZ = 25;
  static const BTH_MFG BTH_MFG_TTPCOM = 26;
  static const BTH_MFG BTH_MFG_SIGNIA = 27;
  static const BTH_MFG BTH_MFG_CONEXANT = 28;
  static const BTH_MFG BTH_MFG_QUALCOMM = 29;
  static const BTH_MFG BTH_MFG_INVENTEL = 30;
  static const BTH_MFG BTH_MFG_AVM_BERLIN = 31;
  static const BTH_MFG BTH_MFG_BANDSPEED = 32;
  static const BTH_MFG BTH_MFG_MANSELLA = 33;
  static const BTH_MFG BTH_MFG_NEC = 34;
  static const BTH_MFG BTH_MFG_WAVEPLUS_TECHNOLOGY_CO = 35;
  static const BTH_MFG BTH_MFG_ALCATEL = 36;
  static const BTH_MFG BTH_MFG_PHILIPS_SEMICONDUCTOR = 37;
  static const BTH_MFG BTH_MFG_C_TECHNOLOGIES = 38;
  static const BTH_MFG BTH_MFG_OPEN_INTERFACE = 39;
  static const BTH_MFG BTH_MFG_RF_MICRO_DEVICES = 40;
  static const BTH_MFG BTH_MFG_HITACHI = 41;
  static const BTH_MFG BTH_MFG_SYMBOL_TECHNOLOGIES = 42;
  static const BTH_MFG BTH_MFG_TENOVIS = 43;
  static const BTH_MFG BTH_MFG_MACRONIX_INTERNATIONAL = 44;
  static const BTH_MFG BTH_MFG_INTERNAL_USE = 65535;
  typedef struct BLUETOOTH_RADIO_INFO {
    DWORD dwSize;
    BLUETOOTH_ADDRESS address;
    WCHAR szName[BLUETOOTH_MAX_NAME_SIZE];
    ULONG ulClassofDevice;
    USHORT lmpSubversion;
    BTH_MFG manufacturer;
  } BLUETOOTH_RADIO_INFO;
  typedef BLUETOOTH_RADIO_INFO *PBLUETOOTH_RADIO_INFO; //Pointer
  typedef struct BLUETOOTH_DEVICE_INFO {
    DWORD dwSize;
    BLUETOOTH_ADDRESS Address;
    ULONG ulClassofDevice;
    BOOL fConnected;
    BOOL fRemembered;
    BOOL fAuthenticated;
    SYSTEMTIME stLastSeen;
    SYSTEMTIME stLastUsed;
    WCHAR szName[BLUETOOTH_MAX_NAME_SIZE];
  } BLUETOOTH_DEVICE_INFO;
  typedef BLUETOOTH_DEVICE_INFO *PBLUETOOTH_DEVICE_INFO; //Pointer
  typedef struct BLUETOOTH_LOCAL_SERVICE_INFO {
    BOOL Enabled;
    BLUETOOTH_ADDRESS btAddr;
    WCHAR szName[BLUETOOTH_MAX_SERVICE_NAME_SIZE];
    WCHAR szDeviceString[BLUETOOTH_DEVICE_NAME_SIZE];
  } BLUETOOTH_LOCAL_SERVICE_INFO;
  typedef struct BLUETOOTH_PIN_INFO {
    UCHAR pin[BTH_MAX_PIN_SIZE];
    UCHAR pinLength;
  } BLUETOOTH_PIN_INFO;
  typedef struct BLUETOOTH_OOB_DATA_INFO {
    UCHAR C[16];
    UCHAR R[16];
  } BLUETOOTH_OOB_DATA_INFO;
  typedef BLUETOOTH_OOB_DATA_INFO *PBLUETOOTH_OOB_DATA_INFO; //Pointer
  typedef struct BLUETOOTH_NUMERIC_COMPARISON_INFO {
    ULONG NumericValue;
  } BLUETOOTH_NUMERIC_COMPARISON_INFO;
  typedef struct BLUETOOTH_PASSKEY_INFO {
    ULONG passkey;
  } BLUETOOTH_PASSKEY_INFO;
  typedef union BLUETOOTH_AUTHENTICATE_RESPONSE_u {
    BLUETOOTH_PIN_INFO pinInfo;
    BLUETOOTH_OOB_DATA_INFO oobInfo;
    BLUETOOTH_NUMERIC_COMPARISON_INFO numericCompInfo;
    BLUETOOTH_PASSKEY_INFO passkeyInfo;
  } BLUETOOTH_AUTHENTICATE_RESPONSE_u;
  typedef UINT BLUETOOTH_AUTHENTICATION_METHOD; //Alias
  static const BLUETOOTH_AUTHENTICATION_METHOD BLUETOOTH_AUTHENTICATION_METHOD_LEGACY = 1;
  static const BLUETOOTH_AUTHENTICATION_METHOD BLUETOOTH_AUTHENTICATION_METHOD_OOB = 2;
  static const BLUETOOTH_AUTHENTICATION_METHOD BLUETOOTH_AUTHENTICATION_METHOD_NUMERIC_COMPARISON = 3;
  static const BLUETOOTH_AUTHENTICATION_METHOD BLUETOOTH_AUTHENTICATION_METHOD_PASSKEY_NOTIFICATION = 4;
  static const BLUETOOTH_AUTHENTICATION_METHOD BLUETOOTH_AUTHENTICATION_METHOD_PASSKEY = 5;
  typedef struct BLUETOOTH_AUTHENTICATE_RESPONSE {
    BLUETOOTH_ADDRESS bthAddressRemote;
    BLUETOOTH_AUTHENTICATION_METHOD authMethod;
    BLUETOOTH_AUTHENTICATE_RESPONSE_u ;
    UCHAR negativeResponse;
  } BLUETOOTH_AUTHENTICATE_RESPONSE;
  typedef BLUETOOTH_AUTHENTICATE_RESPONSE *PBLUETOOTH_AUTHENTICATE_RESPONSE; //Pointer
  typedef struct SDP_STRING_TYPE_DATA {
    USHORT encoding;
    USHORT mibeNum;
    USHORT attributeId;
  } SDP_STRING_TYPE_DATA;
  typedef SDP_STRING_TYPE_DATA *PSDP_STRING_TYPE_DATA; //Pointer
  typedef struct BLUETOOTH_FIND_RADIO_PARAMS {
    DWORD dwSize;
  } BLUETOOTH_FIND_RADIO_PARAMS;
  typedef struct BLUETOOTH_DEVICE_SEARCH_PARAMS {
    DWORD dwSize;
    BOOL fReturnAuthenticated;
    BOOL fReturnRemembered;
    BOOL fReturnUnknown;
    BOOL fReturnConnected;
    BOOL fIssueInquiry;
    UCHAR cTimeoutMultiplier;
    HANDLE hRadio;
  } BLUETOOTH_DEVICE_SEARCH_PARAMS;
  typedef struct BLUETOOTH_COD_PAIRS {
    ULONG ulCODMask;
    LPCWSTR pcszDescription;
  } BLUETOOTH_COD_PAIRS;
  typedef struct BLUETOOTH_SELECT_DEVICE_PARAMS {
    DWORD dwSize;
    ULONG cNumOfClasses;
    BLUETOOTH_COD_PAIRS* prgClassOfDevices;
    LPWSTR pszInfo;
    HWND hwndParent;
    BOOL fForceAuthentication;
    BOOL fShowAuthenticated;
    BOOL fShowRemembered;
    BOOL fShowUnknown;
    BOOL fAddNewDeviceWizard;
    BOOL fSkipServicesPage;
    PFN_DEVICE_CALLBACK pfnDeviceCallback;
    LPVOID pvParam;
    DWORD cNumDevices;
    PBLUETOOTH_DEVICE_INFO pDevices;
  } BLUETOOTH_SELECT_DEVICE_PARAMS;
  typedef UINT BLUETOOTH_AUTHENTICATION_REQUIREMENTS; //Alias
  static const BLUETOOTH_AUTHENTICATION_REQUIREMENTS MITMProtectionNotRequired = 0x00;
  static const BLUETOOTH_AUTHENTICATION_REQUIREMENTS MITMProtectionRequired = 0x01;
  static const BLUETOOTH_AUTHENTICATION_REQUIREMENTS MITMProtectionNotRequiredBonding = 0x02;
  static const BLUETOOTH_AUTHENTICATION_REQUIREMENTS MITMProtectionRequiredBonding = 0x03;
  static const BLUETOOTH_AUTHENTICATION_REQUIREMENTS MITMProtectionNotRequiredGeneralBonding = 0x04;
  static const BLUETOOTH_AUTHENTICATION_REQUIREMENTS MITMProtectionRequiredGeneralBonding = 0x05;
  static const BLUETOOTH_AUTHENTICATION_REQUIREMENTS MITMProtectionNotDefined = 0xff;
  typedef UINT SDP_TYPE; //Alias
  static const SDP_TYPE SDP_TYPE_NIL = 0x00;
  static const SDP_TYPE SDP_TYPE_UINT = 0x01;
  static const SDP_TYPE SDP_TYPE_INT = 0x02;
  static const SDP_TYPE SDP_TYPE_UUID = 0x03;
  static const SDP_TYPE SDP_TYPE_STRING = 0x04;
  static const SDP_TYPE SDP_TYPE_BOOLEAN = 0x05;
  static const SDP_TYPE SDP_TYPE_SEQUENCE = 0x06;
  static const SDP_TYPE SDP_TYPE_ALTERNATIVE = 0x07;
  static const SDP_TYPE SDP_TYPE_URL = 0x08;
  static const SDP_TYPE SDP_TYPE_CONTAINER = 0x20;
  typedef UINT SDP_SPECIFICTYPE; //Alias
  static const SDP_SPECIFICTYPE SDP_ST_NONE = 0x0000;
  static const SDP_SPECIFICTYPE SDP_ST_UINT8 = 0x0010;
  static const SDP_SPECIFICTYPE SDP_ST_UINT16 = 0x0110;
  static const SDP_SPECIFICTYPE SDP_ST_UINT32 = 0x0210;
  static const SDP_SPECIFICTYPE SDP_ST_UINT64 = 0x0310;
  static const SDP_SPECIFICTYPE SDP_ST_UINT128 = 0x0410;
  static const SDP_SPECIFICTYPE SDP_ST_INT8 = 0x0020;
  static const SDP_SPECIFICTYPE SDP_ST_INT16 = 0x0120;
  static const SDP_SPECIFICTYPE SDP_ST_INT32 = 0x0220;
  static const SDP_SPECIFICTYPE SDP_ST_INT64 = 0x0320;
  static const SDP_SPECIFICTYPE SDP_ST_INT128 = 0x0420;
  static const SDP_SPECIFICTYPE SDP_ST_UUID16 = 0x0130;
  static const SDP_SPECIFICTYPE SDP_ST_UUID32 = 0x0220;
  static const SDP_SPECIFICTYPE SDP_ST_UUID128 = 0x0430;
  typedef struct SDP_ELEMENT_DATA_u_s1 {
    LPBYTE value;
    ULONG length;
  } SDP_ELEMENT_DATA_u_s1;
  typedef struct SDP_ELEMENT_DATA_u_s2 {
    LPBYTE value;
    ULONG length;
  } SDP_ELEMENT_DATA_u_s2;
  typedef struct SDP_ELEMENT_DATA_u_s3 {
    LPBYTE value;
    ULONG length;
  } SDP_ELEMENT_DATA_u_s3;
  typedef struct SDP_ELEMENT_DATA_u_s4 {
    LPBYTE value;
    ULONG length;
  } SDP_ELEMENT_DATA_u_s4;
  typedef struct SDP_LARGE_INTEGER_16 {
    ULONGLONG LowPart;
    LONGLONG HighPart;
  } SDP_LARGE_INTEGER_16;
  typedef struct SDP_ULARGE_INTEGER_16 {
    ULONGLONG LowPart;
    ULONGLONG HighPart;
  } SDP_ULARGE_INTEGER_16;
  typedef union SDP_ELEMENT_DATA_u {
    SDP_LARGE_INTEGER_16 int128;
    LONGLONG int64;
    LONG int32;
    SHORT int16;
    CHAR int8;
    SDP_ULARGE_INTEGER_16 uint128;
    ULONGLONG uint64;
    ULONG uint32;
    USHORT uint16;
    UCHAR uint8;
    UCHAR booleanVal;
    GUID uuid128;
    ULONG uuid32;
    USHORT uuid16;
    SDP_ELEMENT_DATA_u_s1 string;
    SDP_ELEMENT_DATA_u_s2 url;
    SDP_ELEMENT_DATA_u_s3 sequence;
    SDP_ELEMENT_DATA_u_s4 alternative;
  } SDP_ELEMENT_DATA_u;
  typedef struct SDP_ELEMENT_DATA {
    SDP_TYPE type;
    SDP_SPECIFICTYPE specificType;
    SDP_ELEMENT_DATA_u data;
  } SDP_ELEMENT_DATA;
  typedef SDP_ELEMENT_DATA *PSDP_ELEMENT_DATA; //Pointer
]]
