#include "__cf_lab4_block.h"
#ifndef RTW_HEADER_lab4_block_h_
#define RTW_HEADER_lab4_block_h_
#include <stddef.h>
#include <string.h>
#include "rtw_modelmap.h"
#ifndef lab4_block_COMMON_INCLUDES_
#define lab4_block_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "sigstream_rtw.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "lab4_block_types.h"
#include "multiword_types.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME lab4_block
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (16) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (2)   
#elif NCSTATES != 2
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T ex2ynfqvfh ; real_T jnugpoe2gc ; real_T n5i0bmi10z ;
real_T imv1i2eaw1 ; real_T fzn0feikol ; real_T gltpeh5sop ; real_T a0ctm4of1t
; real_T okeqohix20 ; real_T i3ge44dq3o ; real_T gzuovv44uz ; real_T
n2fouo3tqo ; real_T n2q1ra2az3 ; real_T o14c142xjj ; real_T kiptfr0nri ;
real_T bmpdxpuukw ; real_T odv4qvp5da ; } B ; typedef struct { struct { void
* LoggedData [ 2 ] ; } htq1arfp3d ; struct { void * LoggedData [ 2 ] ; }
ao10dldhvs ; int_T cjk14ddidf ; int_T a5t5outkud ; } DW ; typedef struct {
real_T avlawfz2ob ; real_T aksez1juqp ; } X ; typedef struct { real_T
avlawfz2ob ; real_T aksez1juqp ; } XDot ; typedef struct { boolean_T
avlawfz2ob ; boolean_T aksez1juqp ; } XDis ; typedef struct { real_T
avlawfz2ob ; real_T aksez1juqp ; } CStateAbsTol ; typedef struct { real_T
h2o5w0kdmj ; real_T b2vpgk2azg ; } ZCV ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
Integrator_IC ; real_T Gain8_Gain ; real_T Step_Time ; real_T Step_Y0 ;
real_T Step_YFinal ; real_T Gain5_Gain ; real_T Integrator1_IC ; real_T
Gain11_Gain ; real_T Step1_Time ; real_T Step1_Y0 ; real_T Step1_YFinal ;
real_T Gain4_Gain ; real_T Gain6_Gain ; real_T Gain1_Gain ; real_T Gain_Gain
; real_T Gain7_Gain ; real_T Gain3_Gain ; real_T Gain2_Gain ; } ; extern
const char * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ;
extern DW rtDW ; extern P rtP ; extern const rtwCAPI_ModelMappingStaticInfo *
lab4_block_GetCAPIStaticMap ( void ) ; extern SimStruct * const rtS ; extern
const int_T gblNumToFiles ; extern const int_T gblNumFrFiles ; extern const
int_T gblNumFrWksBlocks ; extern rtInportTUtable * gblInportTUtables ; extern
const char * gblInportFileName ; extern const int_T gblNumRootInportBlks ;
extern const int_T gblNumModelInputs ; extern const int_T
gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ; extern
const int_T gblInportComplex [ ] ; extern const int_T gblInportInterpoFlag [
] ; extern const int_T gblInportContinuous [ ] ; extern const int_T
gblParameterTuningTid ; extern size_t gblCurrentSFcnIdx ; extern DataMapInfo
* rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ;
void MdlOutputs ( int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T
tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( void ) ;
#endif
