#ifndef __BENCHMARKSHELPER_H__
#define __BENCHMARKSHELPER_H__
double round(double a);
double fmin(double a, double b);
double fmax(double a, double b);
void unif(double* r, int N, int inseed);
void gauss(double * g, int N, int seed);
void computeXopt(int seed, int _DIM);
void monotoneTFosc(double* f);
void freeStarStar(double** M, int m);
double** reshape(double** B, double* vector, int m, int n);
double** computeRotation(double ** B, int seed, int DIM);
double myrand();
double randn();
double FGauss(double Ftrue, double beta);
double FUniform(double Ftrue, double alpha, double beta);
double FCauchy(double Ftrue, double alpha, double p);
int compare_doubles (const void *a, const void *b);
void initbenchmarkshelper();
void finibenchmarkshelper();
double computeFopt(int _funcId, int _trialId);
void setNoiseSeed(unsigned int _seed, unsigned int _seedn);

/* Checks if sDir exists, 
   creates it if not
   checks if is writable thereafter
   Fatal ERROR if anything fails
*/
void dirOK(char *sDir);

/* create complete pathName from filename and dirname 
   is SYSTEM dependent (should be some #ifdef WINDOWS etc ...)
   fullFileName should already be allocated, at least 1024 bytes long
*/
void createFullFileName(char *fullFileName, char *dirName, char *fileName);

/* checks the existence of a file */
int existFile(char * fileName);

/* opens a file after checking it is there */
FILE * bbobOpenFile(char * fileName);

#endif
