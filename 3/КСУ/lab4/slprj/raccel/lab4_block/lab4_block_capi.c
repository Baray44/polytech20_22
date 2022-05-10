#include "__cf_lab4_block.h"
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "lab4_block_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "lab4_block.h"
#include "lab4_block_capi.h"
#include "lab4_block_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"lab4_block/Gain" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 1 , 0 ,
TARGET_STRING ( "lab4_block/Gain1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 ,
0 } , { 2 , 0 , TARGET_STRING ( "lab4_block/Gain11" ) , TARGET_STRING ( "" )
, 0 , 0 , 0 , 0 , 0 } , { 3 , 0 , TARGET_STRING ( "lab4_block/Gain2" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 4 , 0 , TARGET_STRING (
"lab4_block/Gain3" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 5 , 0 ,
TARGET_STRING ( "lab4_block/Gain4" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 ,
1 } , { 6 , 0 , TARGET_STRING ( "lab4_block/Gain5" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 1 } , { 7 , 0 , TARGET_STRING ( "lab4_block/Gain6" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 8 , 0 , TARGET_STRING (
"lab4_block/Gain7" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 9 , 0 ,
TARGET_STRING ( "lab4_block/Gain8" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 ,
0 } , { 10 , 0 , TARGET_STRING ( "lab4_block/Integrator" ) , TARGET_STRING (
"" ) , 0 , 0 , 0 , 0 , 0 } , { 11 , 0 , TARGET_STRING (
"lab4_block/Integrator1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , {
12 , 0 , TARGET_STRING ( "lab4_block/Add" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 13 , 0 , TARGET_STRING ( "lab4_block/Add1" ) , TARGET_STRING
( "" ) , 0 , 0 , 0 , 0 , 0 } , { 14 , 0 , TARGET_STRING ( "lab4_block/Add2" )
, TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 15 , 0 , TARGET_STRING (
"lab4_block/Add3" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 0 , 0 ,
( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 16 , TARGET_STRING (
"lab4_block/Gain" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 17 ,
TARGET_STRING ( "lab4_block/Gain1" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 }
, { 18 , TARGET_STRING ( "lab4_block/Gain11" ) , TARGET_STRING ( "Gain" ) , 0
, 0 , 0 } , { 19 , TARGET_STRING ( "lab4_block/Gain2" ) , TARGET_STRING (
"Gain" ) , 0 , 0 , 0 } , { 20 , TARGET_STRING ( "lab4_block/Gain3" ) ,
TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 21 , TARGET_STRING (
"lab4_block/Gain4" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 22 ,
TARGET_STRING ( "lab4_block/Gain5" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 }
, { 23 , TARGET_STRING ( "lab4_block/Gain6" ) , TARGET_STRING ( "Gain" ) , 0
, 0 , 0 } , { 24 , TARGET_STRING ( "lab4_block/Gain7" ) , TARGET_STRING (
"Gain" ) , 0 , 0 , 0 } , { 25 , TARGET_STRING ( "lab4_block/Gain8" ) ,
TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 26 , TARGET_STRING (
"lab4_block/Integrator" ) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0
} , { 27 , TARGET_STRING ( "lab4_block/Integrator1" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 28 , TARGET_STRING ( "lab4_block/Step"
) , TARGET_STRING ( "Time" ) , 0 , 0 , 0 } , { 29 , TARGET_STRING (
"lab4_block/Step" ) , TARGET_STRING ( "Before" ) , 0 , 0 , 0 } , { 30 ,
TARGET_STRING ( "lab4_block/Step" ) , TARGET_STRING ( "After" ) , 0 , 0 , 0 }
, { 31 , TARGET_STRING ( "lab4_block/Step1" ) , TARGET_STRING ( "Time" ) , 0
, 0 , 0 } , { 32 , TARGET_STRING ( "lab4_block/Step1" ) , TARGET_STRING (
"Before" ) , 0 , 0 , 0 } , { 33 , TARGET_STRING ( "lab4_block/Step1" ) ,
TARGET_STRING ( "After" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 } } ; static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 ,
( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . n2fouo3tqo , & rtB . gzuovv44uz ,
& rtB . gltpeh5sop , & rtB . bmpdxpuukw , & rtB . kiptfr0nri , & rtB .
a0ctm4of1t , & rtB . n5i0bmi10z , & rtB . i3ge44dq3o , & rtB . o14c142xjj , &
rtB . jnugpoe2gc , & rtB . ex2ynfqvfh , & rtB . fzn0feikol , & rtB .
n2q1ra2az3 , & rtB . odv4qvp5da , & rtB . imv1i2eaw1 , & rtB . okeqohix20 , &
rtP . Gain_Gain , & rtP . Gain1_Gain , & rtP . Gain11_Gain , & rtP .
Gain2_Gain , & rtP . Gain3_Gain , & rtP . Gain4_Gain , & rtP . Gain5_Gain , &
rtP . Gain6_Gain , & rtP . Gain7_Gain , & rtP . Gain8_Gain , & rtP .
Integrator_IC , & rtP . Integrator1_IC , & rtP . Step_Time , & rtP . Step_Y0
, & rtP . Step_YFinal , & rtP . Step1_Time , & rtP . Step1_Y0 , & rtP .
Step1_YFinal , } ; static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 , 1.0 } ; static
const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( const void * ) & rtcapiStoredFloats [ 0 ] , (
const void * ) & rtcapiStoredFloats [ 0 ] , 0 , 0 } , { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 1 ] , 1 ,
0 } } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals
, 16 , ( NULL ) , 0 , ( NULL ) , 0 } , { rtBlockParameters , 18 ,
rtModelParameters , 0 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap
, rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float"
, { 1576896443U , 407607761U , 3373128234U , 3581282499U } , ( NULL ) , 0 , 0
} ; const rtwCAPI_ModelMappingStaticInfo * lab4_block_GetCAPIStaticMap ( void
) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void lab4_block_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void lab4_block_host_InitializeDataMapInfo ( lab4_block_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
