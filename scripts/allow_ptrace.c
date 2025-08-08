#include <sys/prctl.h>

__attribute__((constructor))
static void allow_ptrace(void) {
    prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
}