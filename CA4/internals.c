#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int OBJECT = 0;
const int INT = 1;
const int STRING = 2; 


struct Object {
  long long type;
  void** vtable;
  long long objSize;
};

struct String { 
  long long type;
  void** vtable;
  long long objSize;
  const char* c;
};


struct Object* Obj_new();
struct Object* Obj_abort(struct Object * self);
struct String* Obj_type_name(struct Object * self);
long long* Obj_copy(struct Object * self);

struct String* String_new();
long long String_length(struct String* self);
struct String* String_concat(struct String* self, struct String* s);
struct String* String_substr(struct String* self, int i, int l);

int in_int()
{
    long i;
    char* c = (char*)calloc(4096, 1);
    fgets(c, 4096, stdin);
    // Return 0 on bad input
    if (sscanf(c, "%ld", &i) != 1)
      return 0;
    if (i > 2147483647 || i < -2147483648)
      return 0;
    return i;
}

void out_int(int i)
{
    printf("%d", i);
}

char* in_string()
{
    char* c = (char*)calloc(4096, 1);
    fgets(c, 4096, stdin);
    return c;
}

void out_string(char* c)
{
    printf("%s", c);
}


struct Object* Obj_new() {
  struct Object* o = (struct Object*)calloc(1,sizeof(struct Object));
  o->type = OBJECT;
  o->vtable = NULL;
  o->objSize = 0;
}

struct Object* Obj_abort(struct Object * self) {
  out_string("abort\n");
  exit(0);
  return self;
}

struct String* Obj_type_name(struct Object * self) {
  struct String* s = String_new();
  s->c = self->vtable[0];
  return s;
}

// long long* to get around type checking
long long* Obj_copy(struct Object * self) {
  int i;
  long long* res = calloc(2+self->objSize, 8);
  res[0] = self->type;
  res[1] = (long long) self->vtable;
  res[2] = self->objSize;
  for (i = 0; i < self->objSize; i++) {
    res[3+i] = ((long long*) self)[3+i];
  }
  return res;
}


struct String* String_new() {

  struct String* s =(struct String*)calloc(1, sizeof(struct String));
  s->type = STRING;
  s->vtable = NULL;
  s->objSize = 1;
  s->c = "";
  return s;
}

long long String_length(struct String* self) {
  return strlen(self->c);
}

struct String* String_concat(struct String* self, struct String* s) {
  int len = strlen(self->c) + strlen(s->c);
  char* dest = calloc(len+1, sizeof(char));
  strcpy(dest, self->c);
  strcat(dest, s->c);
  struct String* res = String_new();
  res->c = dest;
  return res;
}
struct String* String_substr(struct String* self, int i, int l) {
  int len = strlen(self->c);
  int j;
  if (i >= len || i+l > len)
    out_string("ERROR: String index out of bounds"); 
  struct String* res = String_new();
  char* resStr = calloc(l+1, sizeof(char));
  for (j = 0; j<l; j++)
    resStr[j] = self->c[j+i];
  resStr[l] = '\0';
  res->c = resStr;
  return res;
}


int main(int argc, char** argv)
{
    int i = in_int();
    out_int(i);
    //printf("\n");
    char* c = in_string();
    out_string(c);
    struct Object* o = Obj_new();
    return 0;
}
