#ifndef MX_PYTHON_H
#define MX_PYTHON_H

#ifdef USE_PYTHON

void MUXPy_Init(void);
void runPythonHook(char *hook);
void updatePython(void);

#endif

#endif //MX_PYTHON_H
