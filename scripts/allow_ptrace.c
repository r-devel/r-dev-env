#include <sys/prctl.h>
#include <stdio.h>

__attribute__((constructor)) void allow_ptrace() {
    prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
    fprintf(stderr, "allow_ptrace: called\n");
}
