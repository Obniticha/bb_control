function CodeMetrics() {
	 this.metricsArray = {};
	 this.metricsArray.var = new Array();
	 this.metricsArray.fcn = new Array();
	 this.metricsArray.fcn["Sim_PD_XY"] = {file: "D:\\BallBot\\Controller\\bb_control\\slprj\\ert\\Sim_PD_XY\\Sim_PD_XY.c",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["Sim_PD_XY_Deriv"] = {file: "D:\\BallBot\\Controller\\bb_control\\slprj\\ert\\Sim_PD_XY\\Sim_PD_XY.c",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["Sim_PD_XY_Init"] = {file: "D:\\BallBot\\Controller\\bb_control\\slprj\\ert\\Sim_PD_XY\\Sim_PD_XY.c",
	stack: 0,
	stackTotal: 32};
	 this.metricsArray.fcn["Sim_PD_XY_Update"] = {file: "D:\\BallBot\\Controller\\bb_control\\slprj\\ert\\Sim_PD_XY\\Sim_PD_XY.c",
	stack: 0,
	stackTotal: 32};
	 this.metricsArray.fcn["Sim_PD_XY_initialize"] = {file: "D:\\BallBot\\Controller\\bb_control\\slprj\\ert\\Sim_PD_XY\\Sim_PD_XY.c",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["log"] = {file: "C:\\Program Files\\MATLAB\\R2016a\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["rt_nrand_Upu32_Yd_f_pw_snf"] = {file: "D:\\BallBot\\Controller\\bb_control\\slprj\\ert\\_sharedutils\\rt_nrand_Upu32_Yd_f_pw_snf.c",
	stack: 24,
	stackTotal: 32};
	 this.metricsArray.fcn["rt_urand_Upu32_Yd_f_pw_snf"] = {file: "D:\\BallBot\\Controller\\bb_control\\slprj\\ert\\_sharedutils\\rt_urand_Upu32_Yd_f_pw_snf.c",
	stack: 8,
	stackTotal: 8};
	 this.metricsArray.fcn["sqrt"] = {file: "C:\\Program Files\\MATLAB\\R2016a\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.getMetrics = function(token) { 
		 var data;
		 data = this.metricsArray.var[token];
		 if (!data) {
			 data = this.metricsArray.fcn[token];
			 if (data) data.type = "fcn";
		 } else { 
			 data.type = "var";
		 }
	 return data;}
}
	 CodeMetrics.instance = new CodeMetrics();