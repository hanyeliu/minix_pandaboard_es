#ifndef _TYPE_H
#define _TYPE_H

typedef char int8_t;
typedef unsigned char uint8_t;
typedef int int16_t;
typedef unsigned int uint16_t;
typedef long int int32_t;
typedef unsigned long int uint32_t;
typedef long long int int64_t;
typedef unsigned long long int uint64_t;

typedef uint32_t  u32_t;
typedef unsigned int vir_clicks;        /*  virtual addr/length in clicks */
typedef unsigned long phys_bytes;       /* physical addr/length in bytes */
typedef unsigned int phys_clicks;       /* physical addr/length in clicks */
typedef int endpoint_t;                 /* process identifier */
typedef int32_t cp_grant_id_t;          /* A grant ID. */
typedef long unsigned int vir_bytes;    /* virtual addresses/lengths in bytes */

#endif /* TYPE_H */
