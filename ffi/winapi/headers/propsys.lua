require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IPropertyChange; //Interface
  typedef void* IPropertyChangeArray; //Interface
  typedef void* IPropertyDescription; //Interface
  typedef void* IPropertyDescription2; //Interface
  typedef void* IPropertyDescriptionAliasInfo; //Interface
  typedef void* IPropertyDescriptionList; //Interface
  typedef void* IPropertyDescriptionRelatedPropertyInfo; //Interface
  typedef void* IPropertyDescriptionSearchInfo; //Interface
  typedef void* IPropertyEnumType; //Interface
  typedef void* IPropertyEnumType2; //Interface
  typedef void* IPropertyEnumTypeList; //Interface
  typedef void* IPropertyStore; //Interface
  typedef void* IPropertyStoreCache; //Interface
  typedef void* IPropertyStoreCapabilities; //Interface
  typedef void* IPropertyStoreFactory; //Interface
  typedef void* IPropertySystem; //Interface
  typedef void* IPropertyUI; //Interface
  typedef HRESULT PSSTDAPI; //Alias
  typedef LPVOID PCUSERIALIZEDPROPSTORAGE; //Alias
  typedef UINT PROPENUMTYPE; //Alias
  static const PROPENUMTYPE PET_DISCRETEVALUE = 0;
  static const PROPENUMTYPE PET_RANGEDVALUE = 1;
  static const PROPENUMTYPE PET_DEFAULTVALUE = 2;
  static const PROPENUMTYPE PET_ENDRANGE = 3;
  typedef UINT PROPDESC_DISPLAYTYPE; //Alias
  static const PROPDESC_DISPLAYTYPE PDDT_STRING = 0;
  static const PROPDESC_DISPLAYTYPE PDDT_NUMBER = 1;
  static const PROPDESC_DISPLAYTYPE PDDT_BOOLEAN = 2;
  static const PROPDESC_DISPLAYTYPE PDDT_DATETIME = 3;
  static const PROPDESC_DISPLAYTYPE PDDT_ENUMERATED = 4;
  typedef UINT PROPDESC_GROUPING_RANGE; //Alias
  static const PROPDESC_GROUPING_RANGE PDGR_DISCRETE = 0;
  static const PROPDESC_GROUPING_RANGE PDGR_ALPHANUMERIC = 1;
  static const PROPDESC_GROUPING_RANGE PDGR_SIZE = 2;
  static const PROPDESC_GROUPING_RANGE PDGR_DYNAMIC = 3;
  static const PROPDESC_GROUPING_RANGE PDGR_DATE = 4;
  static const PROPDESC_GROUPING_RANGE PDGR_PERCENT = 5;
  static const PROPDESC_GROUPING_RANGE PDGR_ENUMERATED = 6;
  typedef UINT PROPDESC_RELATIVEDESCRIPTION_TYPE; //Alias
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_GENERAL = 0;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_DATE = 1;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_SIZE = 2;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_COUNT = 3;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_REVISION = 4;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_LENGTH = 5;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_DURATION = 6;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_SPEED = 7;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_RATE = 8;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_RATING = 9;
  static const PROPDESC_RELATIVEDESCRIPTION_TYPE PDRDT_PRIORITY = 10;
  typedef UINT PROPDESC_SORTDESCRIPTION; //Alias
  static const PROPDESC_SORTDESCRIPTION PDSD_GENERAL = 0;
  static const PROPDESC_SORTDESCRIPTION PDSD_A_Z = 1;
  static const PROPDESC_SORTDESCRIPTION PDSD_LOWEST_HIGHEST = 2;
  static const PROPDESC_SORTDESCRIPTION PDSD_SMALLEST_BIGGEST = 3;
  static const PROPDESC_SORTDESCRIPTION PDSD_OLDEST_NEWEST = 4;
  typedef UINT PROPDESC_AGGREGATION_TYPE; //Alias
  static const PROPDESC_AGGREGATION_TYPE PDAT_DEFAULT = 0;
  static const PROPDESC_AGGREGATION_TYPE PDAT_FIRST = 1;
  static const PROPDESC_AGGREGATION_TYPE PDAT_SUM = 2;
  static const PROPDESC_AGGREGATION_TYPE PDAT_AVERAGE = 3;
  static const PROPDESC_AGGREGATION_TYPE PDAT_DATERANGE = 4;
  static const PROPDESC_AGGREGATION_TYPE PDAT_UNION = 5;
  static const PROPDESC_AGGREGATION_TYPE PDAT_MAX = 6;
  static const PROPDESC_AGGREGATION_TYPE PDAT_MIN = 7;
  typedef UINT PROPDESC_CONDITION_TYPE; //Alias
  static const PROPDESC_CONDITION_TYPE PDCOT_NONE = 0;
  static const PROPDESC_CONDITION_TYPE PDCOT_STRING = 1;
  static const PROPDESC_CONDITION_TYPE PDCOT_SIZE = 2;
  static const PROPDESC_CONDITION_TYPE PDCOT_DATETIME = 3;
  static const PROPDESC_CONDITION_TYPE PDCOT_BOOLEAN = 4;
  static const PROPDESC_CONDITION_TYPE PDCOT_NUMBER = 5;
  typedef DWORD PROPDESC_TYPE_FLAGS; //Alias
  typedef DWORD PERSIST_SPROPSTORE_FLAGS; //Alias
  typedef UINT CONDITION_OPERATION; //Alias
  static const CONDITION_OPERATION COP_IMPLICIT = 0;
  static const CONDITION_OPERATION COP_EQUAL = 1;
  static const CONDITION_OPERATION COP_NOTEQUAL = 2;
  static const CONDITION_OPERATION COP_LESSTHAN = 3;
  static const CONDITION_OPERATION COP_GREATERTHAN = 4;
  static const CONDITION_OPERATION COP_LESSTHANOREQUAL = 5;
  static const CONDITION_OPERATION COP_GREATERTHANOREQUAL = 6;
  static const CONDITION_OPERATION COP_VALUE_STARTSWITH = 7;
  static const CONDITION_OPERATION COP_VALUE_ENDSWITH = 8;
  static const CONDITION_OPERATION COP_VALUE_CONTAINS = 9;
  static const CONDITION_OPERATION COP_VALUE_NOTCONTAINS = 10;
  static const CONDITION_OPERATION COP_DOSWILDCARDS = 11;
  static const CONDITION_OPERATION COP_WORD_EQUAL = 12;
  static const CONDITION_OPERATION COP_WORD_STARTSWITH = 13;
  static const CONDITION_OPERATION COP_APPLICATION_SPECIFIC = 14;
  typedef UINT PROPDESC_COLUMNINDEX_TYPE; //Alias
  static const PROPDESC_COLUMNINDEX_TYPE PDCIT_NONE = 0;
  static const PROPDESC_COLUMNINDEX_TYPE PDCIT_ONDISK = 1;
  static const PROPDESC_COLUMNINDEX_TYPE PDCIT_INMEMORY = 2;
  static const PROPDESC_COLUMNINDEX_TYPE PDCIT_ONDEMAND = 3;
  static const PROPDESC_COLUMNINDEX_TYPE PDCIT_ONDISKALL = 4;
  static const PROPDESC_COLUMNINDEX_TYPE PDCIT_ONDISKVECTOR = 5;
  typedef UINT PSC_STATE; //Alias
  static const PSC_STATE PSC_NORMAL = 0;
  static const PSC_STATE PSC_NOTINSOURCE = 1;
  static const PSC_STATE PSC_DIRTY = 2;
  static const PSC_STATE PSC_READONLY = 3;
  typedef UINT PROPDESC_ENUMFILTER; //Alias
  static const PROPDESC_ENUMFILTER PDEF_ALL = 0;
  static const PROPDESC_ENUMFILTER PDEF_SYSTEM = 1;
  static const PROPDESC_ENUMFILTER PDEF_NONSYSTEM = 2;
  static const PROPDESC_ENUMFILTER PDEF_VIEWABLE = 3;
  static const PROPDESC_ENUMFILTER PDEF_QUERYABLE = 4;
  static const PROPDESC_ENUMFILTER PDEF_INFULLTEXTQUERY = 5;
  static const PROPDESC_ENUMFILTER PDEF_COLUMN = 6;
  typedef DWORD PROPDESC_SEARCHINFO_FLAGS; //Alias
  typedef DWORD PROPDESC_VIEW_FLAGS; //Alias
  typedef DWORD PROPDESC_FORMAT_FLAGS; //Alias
  typedef UINT PKA_FLAGS; //Alias
  static const PKA_FLAGS PKA_SET = 0;
  static const PKA_FLAGS PKA_APPEND = 1;
  static const PKA_FLAGS PKA_DELETE = 2;
]]
