#ifndef SQFVM_RUNTIME_VERSION_H_
#define SQFVM_RUNTIME_VERSION_H_

#ifndef CONCAT_
#define CONCAT_(L, R) L ## R
#endif // !CONCAT_
#ifndef CONCAT
#define CONCAT(L, R) CONCAT_(L, R)
#endif // !CONCAT
#ifndef STR_
#define STR_(IN) # IN
#endif // !STR_
#ifndef STR
#define STR(IN) STR_(IN)
#endif // !STR

#define SQFVM_RUNTIME_VERSION_MAJOR 2
#define SQFVM_RUNTIME_VERSION_MINOR 1
#define SQFVM_RUNTIME_VERSION_REVISION 0
#define SQFVM_RUNTIME_VERSION STR(SQFVM_RUNTIME_VERSION_MAJOR) "." STR(SQFVM_RUNTIME_VERSION_MINOR) "." STR(SQFVM_RUNTIME_VERSION_REVISION)
#define SQFVM_RUNTIME_VERSION_FULL SQFVM_RUNTIME_VERSION " - " __DATE__ " " __TIME__


#endif // !SQFVM_RUNTIME_VERSION_H_
