#include<stdio.h>
#include <stdlib.h>


int main ( ) {
    bool a = true;
    if(getenv("stdout")){
        printf("use stdout\n");
    }else{
        printf("not use stdout\n");
    }
    printf( "hello " );
    fprintf( stderr, "HELP!" );
    printf( " world\n" );
    return 0;
}

//https://stackoverflow.com/questions/39002052/how-i-can-print-to-stderr-in-c