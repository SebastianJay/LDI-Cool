#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

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
    char* c;
    long long length;
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

extern void** IO_vtable;
extern void** Object_vtable;
extern void** String_vtable;
extern void** Int_vtable;
extern void** Bool_vtable;

Object* Object_new();
Object* Object_abort(Object * self);
String* Object_type_name(Object * self);
long long* Object_copy(Object * self);
long long Object_cmp(Object* self, Object* other);

String* String_new();
long long String_length(String* self);
String* String_concat(String* self, String* s);
String* String_substr(String* self, long long i, long long l);
long long String_cmp(String* self, String* other);

Int* Int_new();

Bool* Bool_new();

IO* IO_new();
long long IO_in_int(IO* self);
IO* IO_out_int(IO* self, long long i);
String* IO_in_string(IO* self);
IO* IO_out_string(IO* self, String* s);

//unboxed definitions
long long in_int();
void out_int(long long i);
char* in_string();
void out_string(const char* c);

void out_error(const char* format, long long lineno);

void* getmem(long long size);

IO* IO_new()
{
    IO* io = (IO*)getmem(sizeof(IO));
    io->type = IO_TAG;
    io->vtable = IO_vtable;
    io->objSize = 0;
    return io;
}

long long IO_in_int(IO* self)
{
    long long i;
    char buffer[128];
    int retcode;
    i = (long long)fgets(buffer, 128, stdin);
    if (i == 0) return 0;
    i=0;
    while (buffer[i] != '\0') i++;
    if (buffer[i-1] != '\n') {
        while (1) {
            int c = fgetc(stdin);
            if (c == EOF)
                return 0;
            if (c == '\n' || c == '\0') {
                retcode = sscanf(buffer, "%lld", &i);
                if (retcode == EOF || retcode == 0) {
                    return 0;
                }
                else return i;
            }
        }
        return 0;
    }

    retcode = sscanf(buffer, "%lld", &i);
    if (retcode == EOF || retcode == 0 || i < -2147483648 || i > 2147483647) {
        return 0;
    } 
    else return i;
}

IO* IO_out_int(IO* self, long long i)
{
    printf("%d",(int)i);
    return self;
}


String* IO_in_string(IO* self)
{
    String* retval = String_new();
    retval->c = in_string(&retval->length);
    return retval;
}

char* in_string(int *len)
{
    int numread = 0;
    int lenbuffer = 128;
    char* buffer = (char*)getmem(lenbuffer);
    while (1) {
        //get a new character from stream
        int c = fgetc(stdin);
        if (c == EOF) {
            //if reached end of file, return current buffer
            if (numread == 0) {
                *len = 0;
                return "";
            } else {
                *len = numread;
                return buffer;
            }
        } else if (c == '\0') {
            //if read NUL, consume rest of line but return empty string
            while (1) {
                c = fgetc(stdin);
                if (c == EOF || c == '\n') {
                    break;
                }
            }
            *len = 0; 
            return "";
        } else if (c == '\n') {
            //if read newline, stop reading and return buffer
            buffer[numread] = '\0';
            //remove carriage return if it is present
            if (numread > 0 && buffer[numread-1] == '\r') {
                buffer[numread-1] = '\0';
                numread -=1;
            }
            *len = numread;
            return buffer;
        }
        //otherwise append character
        buffer[numread++] = (char)c;
        //if current buffer is filled, allocate larger buffer
        if (numread == lenbuffer - 1) {
            // Reserve more memory, shuold still be contiguous
            getmem(lenbuffer);
        }
    }
}

IO* IO_out_string(IO* self, String* s)
{
    //before printing, convert escape sequences \t, \n
    int len = s->length;
    char* cpy = (char*)getmem(len+1);
    int i,j=0;
    for (i = 0; i < len; i++) {
        if (i < len-1 && s->c[i] == '\\') {
            if (s->c[i+1] == 'n') {
                cpy[j++] = '\n';
                i++;
            }
            else if (s->c[i+1] == 't') {
                cpy[j++] = '\t';
                i++;
            }
            else {
                cpy[j++] = s->c[i];
            }
        }
        else {
            cpy[j++] = s->c[i];
        }

    }
    cpy[j] = '\0';
    printf("%s", cpy);

    return self;
}

void out_error(const char* format, long long lineno)
{
    printf(format, lineno);
    exit(1);
}

Object* Object_new() {
    Object* o = (Object*)getmem(sizeof(Object));
    o->type = OBJECT_TAG;
    o->vtable = Object_vtable;
    o->objSize = 0;
    return o;
}

Object* Object_abort(Object * self) {
    printf("abort\n");
    exit(0);
    return self;
}

String* Object_type_name(Object * self) {
    return self->vtable[0];
}

// long long* to get around type checking
long long* Object_copy(Object * self) {
    int i;
    long long* res = getmem((3 + self->objSize) * 8);
    res[0] = self->type;
    res[1] = (long long) self->vtable;
    res[2] = self->objSize;
    for (i = 0; i < self->objSize; i++) {
        res[3+i] = ((long long*) self)[3+i];
    }
    return res;
}

long long Object_cmp(Object *self, Object *other) {
    if (self == NULL || other == NULL) {
        return self == other ? 0 : 1;
    }
    if (self->type != other->type) {
        return 1;
    }
    if (self->type == INT_TAG || self->type == BOOL_TAG) {
        return ((Int*)self)->value - ((Int*)other)->value;
    }
    if (self->type == STRING_TAG) {
        return String_cmp((String*)self, (String*)other);
    }
    return self == other ? 0 : 1;
}

String* String_new() {
    String* s =(String*)getmem(sizeof(String));
    s->type = STRING_TAG;
    s->vtable = String_vtable;
    s->objSize = 2;
    s->c = "";  //default val = empty string
    s->length = 0;
    return s;
}

long long String_length(String* self) {
    return self->length;
}

String* String_concat(String* self, String* s) {
    int len = self->length + s->length;
    int i;
    String* res = String_new();
    res->c = getmem(len+1);
    res->length = len;
    for (i = 0; i < self->length; i++) {
        res->c[i] = self->c[i];
    }
    for (; i < len; i++) {
        res->c[i] = s->c[i-self->length];
    }
    res->c[i] = '\0';
    return res;
}

String* String_substr(String* self, long long i, long long l) {
    int len = self->length;
    if (i < 0 || l < 0 || i + l > len) {
        out_error("ERROR: %lld: Exception: String index out of bounds", 0ll);
        //program halts
    }
    String* res = String_new();
    res->c = (self->c)+i; 
    res->length = l;
    return res;
}
long long String_cmp(String* self, String* other) {
    int i;
    int bd = self->length < other->length ? self->length : other->length;
    while (i < bd && self->c[i] == other->c[i]) {
        i++;
    }
    if (i == bd) {
        if (self->length == other->length)
            return 0;
        return self->length < other->length ? -1 : 1;
    }
    return self->c[i] < other->c[i] ? -1 : 1;    
}

Int* Int_new()
{
    Int* i = (Int*)getmem(sizeof(Int));
    i->type = INT_TAG;
    i->vtable = Int_vtable;
    i->objSize = 1;
    i->value = 0;   //default val = 0
    return i;
}

Bool* Bool_new()
{
    Bool* b = (Bool*)getmem(sizeof(Bool));
    b->type = BOOL_TAG;
    b->vtable = Bool_vtable;
    b->objSize = 1;
    b->value = 0;   //default val = false
    return b;
}

const int HEAP_SIZE = 4194304;
void* HEAP_NEXT = 0;
void* HEAP_END  = 0;
void* getmem(long long size) {
    void* res = HEAP_NEXT;
    HEAP_NEXT += size;
    if (HEAP_NEXT >= HEAP_END) {
        HEAP_END = sbrk(HEAP_SIZE) + HEAP_SIZE;
    }
    return res;
}
extern void _main();
int main(int argc, char** argv)
{
    /*
    int i = 0;
    IO* io = IO_new();
    for (; i < 130; i++) {
        printf("%d", i);
        String* s = IO_in_string(io);
        IO_out_string(io, s);
        IO_out_int(io, String_length(s));
        printf("\n");

    }
    */
    ///test in and out string and int
    /*
    char* i = in_string();
    out_string(i);
    i = in_string();
    out_string(i);
    i = in_string();
    out_string(i);
    printf("\n");
    if (i == "") {
        printf("empty string received");
    }
    */

    /*
    long long j = in_int();
    out_int(j);
    j = in_int();
    out_int(j);
    j = in_int();
    out_int(j);
    */

    //char* c = in_string();
    //out_string(c);

    ///test printf on long ints
    //long long ll = 2147483648ll;
    //printf("%d", ll);

    ///test string read in and length
    //IO* io = IO_new();
    //String* s = IO_in_string(io);
    //IO_out_string(io, s);
    //IO_out_int(io, String_length(s));

    ///test substring
    //Int* start = IO_in_int(io);
    //Int* len = IO_in_int(io);
    //String* substr = String_substr(s, start, len);
    //IO_out_string(io, substr);
    HEAP_NEXT = sbrk(HEAP_SIZE);
    HEAP_END = HEAP_NEXT + HEAP_SIZE;
    _main(); 
    return 0;
}
