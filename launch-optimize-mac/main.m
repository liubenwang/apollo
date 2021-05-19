//
//  main.m
//  launch-optimize-mac
//
//  Created by benwang on 2021/4/22.
//

#include <stdio.h>
#include <stdlib.h>

const char* str1 = "Hello.world";
const char* str2 = "Hello.benwang";

static void static_say() {
    printf("static hello\n");
}

void say() {
    printf("hello\n");
}

int main(int argc, const char * argv[]) {

    printf("%s", str1);

    char *tiny = malloc(sizeof(int));
    free(tiny);

    say();
    static_say();

    return 0;
}
