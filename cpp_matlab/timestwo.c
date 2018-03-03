#include "mex.h"

void timestwo(double y[], double x[])
{
	y[0] = 2.0*x[0];
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
	double *x, *y;
	int mrows, ncols;

	if(nrhs != 1)
	{
		mexErrMsgTxt("One input requried.");
	}
	else if(nlhs > 1)
	{
		mexErrMsgTxt("Too many output arguments");
	}

	mrows = mxGetM(prhs[0]);
	ncols = mxGetN(prhs[0]);
	if(!mxIsDouble(prhs[0]) || mxIsComplex(prhs[0]) || !(mrows == 1 && ncols == 1))
	{
		mexErrMsgTxt("Input must be a noncomplex scalar double.");
	}

	plhs[0] = mxCreateDoubleMatrix(mrows, ncols, mxREAL);

	x = mxGetPr(prhs[0]);
	y = mxGetPr(plhs[0]);

	timestwo(y,x);

}