#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int OBJECT_TAG = 0;
const int INT_TAG = 1;
const int STRING_TAG = 2;
const int IO_TAG = 3;
const int BOOL_TAG = 4;

typedef struct {
    long long type;
    void** vtable;
    long long objSize;
} Object;

typedef struct {
    long long type;
    void** vtable;
    long long objSize;
    long long value;
} Int;

typedef struct {
    long long type;
    void** vtable;
    long long objSize;
    const char* c;
} String;

typedef struct {
    long long type;
    void** vtable;
    long long objSize;
} IO;

typedef struct {
    long long type;
    void** vtable;
    long long objSize;
    long long value;
} Bool;

Object* Obj_new();
Object* Obj_abort(Object * self);
String* Obj_type_name(Object * self);
long long* Obj_copy(Object * self);

String* String_new();
Int* String_length(String* self);
String* String_concat(String* self, String* s);
String* String_substr(String* self, Int* i, Int* l);

Int* Int_new();

Bool* Bool_new();

IO* IO_new();
Int* IO_in_int(IO* self);
IO* IO_out_int(IO* self, Int* i);
String* IO_in_string(IO* self);
IO* IO_out_string(IO* self, String* s);

//unboxed definitions
long long in_int();
void out_int(long long i);
char* in_string();
void out_string(const char* c);

void out_error(const char* format, long long lineno);

IO* IO_new()
{
    IO* io = (IO*)calloc(1,sizeof(IO));
    io->type = IO_TAG;
    io->vtable = NULL;
    io->objSize = 0;
    return io;
}

Int* IO_in_int(IO* self)
{
    Int* retval = Int_new();
    retval->value = in_int();
    return retval;
}

long long in_int()
{
    long long i;
    char* c = (char*)calloc(4096, 1);
    fgets(c, 4096, stdin);
    // Return 0 on bad input
    if (sscanf(c, "%lld", &i) == EOF)
        return 0;
    if (i > 2147483647ll || i < -2147483648ll)
        return 0;
    free(c);
    return i;
}

IO* IO_out_int(IO* self, Int* i)
{
    out_int(i->value);
    return self;
}

void out_int(long long i)
{
    printf("%d", i);
}

String* IO_in_string(IO* self)
{
    String* retval = String_new();
    retval->c = in_string();
    return retval;
}

char* in_string()
{
    //TODO read in arbitrarily long string
    char* buffer = (char*)calloc(4096, 1);
    char* ret = fgets(buffer, 4096, stdin);
    if (ret == NULL) {
        return "";  //eof reached before any input read
    }
    //TODO handle reading NUL (which requires returning empty string)
    //  using fgets is not much help, perhaps we should use fgetc
    int len = strlen(buffer);
    if (buffer[len-1] == '\n') {
        buffer[len-1] = '\0';   //eliminate trailing newline
    }
    return buffer;
}

IO* IO_out_string(IO* self, String* s)
{
    out_string(s->c);
    return self;
}

void out_string(const char* c)
{
    //before printing, convert escape sequences \t, \n
    int len = strlen(c);
    char* cpy = (char*)calloc(len+1, sizeof(char));
    strcpy(cpy, c);
    cpy[len] = '\0';
    int i;
    int num = 0;    //number of replacements made
    for (i = 0; i < len-1; i++) {
        char replace = '\0';    //placeholder
        if (cpy[i] == '\\' && cpy[i+1] == 't') {
            replace = '\t';
        } else if (cpy[i] == '\\' && cpy[i+1] == 'n') {
            replace = '\n';
        } else if (cpy[i] == '\\') {
            i++;    //skip over next letter (e.g. another '\\') as it has been escaped
        }
        //if replacement is to be made, shift left remaining characters
        if (replace != '\0') {
            int j;
            for (j = i+1; j < len-num; j++) {
                cpy[j] = cpy[j+1];
            }
            cpy[i] = replace;   //make replacement
            num++;
        }
    }
    printf("%s", cpy);
    free(cpy);
}

void out_error(const char* format, long long lineno)
{
    printf(format, lineno);
    exit(1);
}

Object* Obj_new() {
    Object* o = (Object*)calloc(1,sizeof(Object));
    o->type = OBJECT_TAG;
    o->vtable = NULL;
    o->objSize = 0;
    return o;
}

Object* Obj_abort(Object * self) {
    out_string("abort\n");
    exit(0);
    return self;
}

String* Obj_type_name(Object * self) {
    String* s = String_new();
    s->c = self->vtable[0];
    return s;
}

// long long* to get around type checking
long long* Obj_copy(Object * self) {
    int i;
    long long* res = calloc(3 + self->objSize, 8);
    res[0] = self->type;
    res[1] = (long long) self->vtable;
    res[2] = self->objSize;
    for (i = 0; i < self->objSize; i++) {
        res[3+i] = ((long long*) self)[3+i];
    }
    return res;
}

String* String_new() {
    String* s =(String*)calloc(1, sizeof(String));
    s->type = STRING_TAG;
    s->vtable = NULL;
    s->objSize = 1;
    s->c = "";  //default val = empty string
    return s;
}

Int* String_length(String* self) {
    Int* retval = Int_new();
    retval->value = strlen(self->c);
    return retval;
}

String* String_concat(String* self, String* s) {
    int len = strlen(self->c) + strlen(s->c);
    char* dest = calloc(len+1, sizeof(char));
    strcpy(dest, self->c);
    strcat(dest, s->c);
    String* res = String_new();
    res->c = dest;
    return res;
}

String* String_substr(String* self, Int* ibox, Int* lbox) {
    int len = strlen(self->c);
    long long i = ibox->value;
    long long l = lbox->value;
    if (i >= len || i + l > len || i < 0) {
        out_error("ERROR: %lld: Exception: String index out of bounds", 0ll);
        //program halts
    }
    String* res = String_new();
    char* resStr = calloc(l+1, sizeof(char));
    int j;
    for (j = 0; j < l; j++) {
        resStr[j] = self->c[j+i];
    }
    resStr[l] = '\0';
    res->c = resStr;
    return res;
}

Int* Int_new()
{
    Int* i = (Int*)calloc(1,sizeof(Int));
    i->type = INT_TAG;
    i->vtable = NULL;
    i->objSize = 0;
    i->value = 0;   //default val = 0
    return i;
}

Bool* Bool_new()
{
    Bool* b = (Bool*)calloc(1,sizeof(Bool));
    b->type = BOOL_TAG;
    b->vtable = NULL;
    b->objSize = 0;
    b->value = 0;   //default val = false
    return b;
}

int main(int argc, char** argv)
{
    //int i = in_int();
    //out_int(i);
    //char* c = in_string();
    //out_string(c);

    IO* io = IO_new();
    String* s = IO_in_string(io);
    Int* start = IO_in_int(io);
    Int* len = IO_in_int(io);
    String* substr = String_substr(s, start, len);
    IO_out_string(io, substr);

    //Object* o = Obj_new();
    return 0;
}
