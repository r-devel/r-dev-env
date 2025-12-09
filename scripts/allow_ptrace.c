#include <sys/prctl.h>
#include <unistd.h>
#include <stdio.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "usage: %s <path-to-R> [args...]\n", argv[0]);
        return 2;
    }
    /* allow ptrace for this process (persists across exec) */
    prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
    /* exec the provided R binary with the remaining args */
    execv(argv[1], &argv[1]);
    perror("execv");
    return 1;
}
