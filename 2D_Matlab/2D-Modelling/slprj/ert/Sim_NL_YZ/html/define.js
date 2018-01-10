function CodeDefine() { 
this.def = new Array();
this.def["Sim_NL_YZ_Init"] = {file: "Sim_NL_YZ_c.html",line:75,type:"fcn"};
this.def["Sim_NL_YZ"] = {file: "Sim_NL_YZ_c.html",line:89,type:"fcn"};
this.def["Sim_NL_YZ_Update"] = {file: "Sim_NL_YZ_c.html",line:155,type:"fcn"};
this.def["Sim_NL_YZ_Deriv"] = {file: "Sim_NL_YZ_c.html",line:165,type:"fcn"};
this.def["Sim_NL_YZ_initialize"] = {file: "Sim_NL_YZ_c.html",line:175,type:"fcn"};
this.def["RT_MODEL_Sim_NL_YZ_T"] = {file: "Sim_NL_YZ_h.html",line:33,type:"type"};
this.def["DW_Sim_NL_YZ_f_T"] = {file: "Sim_NL_YZ_h.html",line:42,type:"type"};
this.def["X_Sim_NL_YZ_n_T"] = {file: "Sim_NL_YZ_h.html",line:47,type:"type"};
this.def["XDot_Sim_NL_YZ_n_T"] = {file: "Sim_NL_YZ_h.html",line:52,type:"type"};
this.def["XDis_Sim_NL_YZ_n_T"] = {file: "Sim_NL_YZ_h.html",line:57,type:"type"};
this.def["MdlrefDW_Sim_NL_YZ_T"] = {file: "Sim_NL_YZ_h.html",line:79,type:"type"};
this.def["rtTimingBridge"] = {file: "../../_sharedutils/html/model_reference_types_h.html",line:24,type:"type"};
this.def["rt_nrand_Upu32_Yd_f_pw_snf"] = {file: "../../_sharedutils/html/rt_nrand_Upu32_Yd_f_pw_snf_c.html",line:16,type:"fcn"};
this.def["rt_urand_Upu32_Yd_f_pw_snf"] = {file: "../../_sharedutils/html/rt_urand_Upu32_Yd_f_pw_snf_c.html",line:14,type:"fcn"};
this.def["int8_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:42,type:"type"};
this.def["uint8_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:43,type:"type"};
this.def["int16_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:44,type:"type"};
this.def["uint16_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:45,type:"type"};
this.def["int32_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:46,type:"type"};
this.def["uint32_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:47,type:"type"};
this.def["real32_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:48,type:"type"};
this.def["real64_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:49,type:"type"};
this.def["real_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:55,type:"type"};
this.def["time_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:56,type:"type"};
this.def["boolean_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:57,type:"type"};
this.def["int_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:58,type:"type"};
this.def["uint_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:59,type:"type"};
this.def["ulong_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:60,type:"type"};
this.def["char_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:61,type:"type"};
this.def["uchar_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:62,type:"type"};
this.def["byte_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:63,type:"type"};
this.def["pointer_T"] = {file: "../../_sharedutils/html/rtwtypes_h.html",line:81,type:"type"};
}
CodeDefine.instance = new CodeDefine();
var testHarnessInfo = {OwnerFileName: "", HarnessOwner: "", HarnessName: "", IsTestHarness: "0"};
var relPathToBuildDir = "../ert_main.c";
var fileSep = "\\";
var isPC = true;
function Html2SrcLink() {
	this.html2SrcPath = new Array;
	this.html2Root = new Array;
	this.html2SrcPath["Sim_NL_YZ_c.html"] = "../Sim_NL_YZ.c";
	this.html2Root["Sim_NL_YZ_c.html"] = "Sim_NL_YZ_c.html";
	this.html2SrcPath["Sim_NL_YZ_h.html"] = "../Sim_NL_YZ.h";
	this.html2Root["Sim_NL_YZ_h.html"] = "Sim_NL_YZ_h.html";
	this.html2SrcPath["model_reference_types_h.html"] = "../model_reference_types.h";
	this.html2Root["model_reference_types_h.html"] = "../../_sharedutils/html/model_reference_types_h.html";
	this.html2SrcPath["rt_nrand_Upu32_Yd_f_pw_snf_c.html"] = "../rt_nrand_Upu32_Yd_f_pw_snf.c";
	this.html2Root["rt_nrand_Upu32_Yd_f_pw_snf_c.html"] = "../../_sharedutils/html/rt_nrand_Upu32_Yd_f_pw_snf_c.html";
	this.html2SrcPath["rt_nrand_Upu32_Yd_f_pw_snf_h.html"] = "../rt_nrand_Upu32_Yd_f_pw_snf.h";
	this.html2Root["rt_nrand_Upu32_Yd_f_pw_snf_h.html"] = "../../_sharedutils/html/rt_nrand_Upu32_Yd_f_pw_snf_h.html";
	this.html2SrcPath["rt_urand_Upu32_Yd_f_pw_snf_c.html"] = "../rt_urand_Upu32_Yd_f_pw_snf.c";
	this.html2Root["rt_urand_Upu32_Yd_f_pw_snf_c.html"] = "../../_sharedutils/html/rt_urand_Upu32_Yd_f_pw_snf_c.html";
	this.html2SrcPath["rt_urand_Upu32_Yd_f_pw_snf_h.html"] = "../rt_urand_Upu32_Yd_f_pw_snf.h";
	this.html2Root["rt_urand_Upu32_Yd_f_pw_snf_h.html"] = "../../_sharedutils/html/rt_urand_Upu32_Yd_f_pw_snf_h.html";
	this.html2SrcPath["rtwtypes_h.html"] = "../rtwtypes.h";
	this.html2Root["rtwtypes_h.html"] = "../../_sharedutils/html/rtwtypes_h.html";
	this.getLink2Src = function (htmlFileName) {
		 if (this.html2SrcPath[htmlFileName])
			 return this.html2SrcPath[htmlFileName];
		 else
			 return null;
	}
	this.getLinkFromRoot = function (htmlFileName) {
		 if (this.html2Root[htmlFileName])
			 return this.html2Root[htmlFileName];
		 else
			 return null;
	}
}
Html2SrcLink.instance = new Html2SrcLink();
var fileList = [
"Sim_NL_YZ_c.html","Sim_NL_YZ_h.html","model_reference_types_h.html","rt_nrand_Upu32_Yd_f_pw_snf_c.html","rt_nrand_Upu32_Yd_f_pw_snf_h.html","rt_urand_Upu32_Yd_f_pw_snf_c.html","rt_urand_Upu32_Yd_f_pw_snf_h.html","rtwtypes_h.html"];