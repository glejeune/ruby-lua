#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stdlib.h>

char* concatenate(int n, ...) {
  int i;
  const char* v;
  va_list vl;
  va_start(vl, n);
  char *result = NULL;
  for(i=0; i<n; i++) {
    v = va_arg(vl, const char*);

    if(result) {
      char *tmp = strdup(result);  
      free(result);
      result = (char*)malloc(sizeof(char)*(strlen(tmp)+strlen(v)+1));
      memset(result, 0, strlen(tmp)+strlen(v)+1);
      sprintf(result, "%s%s", tmp, v);
      free(tmp);
    } else {
      result = (char*)malloc(sizeof(char)*(strlen(v)+1));
      memset(result, 0, strlen(v)+1);
      memcpy(result, v, strlen(v));
    }
  }
  return result;
}

