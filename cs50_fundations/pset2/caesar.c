#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    for (int i = 0, n = strlen(argv[1]); i < n; i++)
    {
        if (!isdigit((unsigned char) argv[1][i]))
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }

    int k = atoi(argv[1]) % 26;

    string p = get_string("plaintext:  ");

    printf("ciphertext: ");

    for (int i = 0, n = strlen(p); i < n; i++)
    {
        char c = p[i];

        if (isupper((unsigned char) c))
        {
            char enc = 'A' + ( (c - 'A' + k) % 26 );
            printf("%c", enc);
        }
        else if (islower((unsigned char) c))
        {
            char enc = 'a' + ( (c - 'a' + k) % 26 );
            printf("%c", enc);
        }
        else
        {
            printf("%c", c);
        }
    }

    printf("\n");
    return 0;
}
