#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool valid_key(string k, char map_upper[26], char map_lower[26]);

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./substitution KEY\n");
        return 1;
    }

    char map_upper[26];  
    char map_lower[26];  

    if (!valid_key(argv[1], map_upper, map_lower))
    {
        return 1;
    }

    string p = get_string("plaintext:  ");

    printf("ciphertext: ");

    for (int i = 0, n = strlen(p); i < n; i++)
    {
        unsigned char c = (unsigned char) p[i];

        if (isupper(c))
        {
            int idx = c - 'A';
            printf("%c", map_upper[idx]);
        }
        else if (islower(c))
        {
            int idx = c - 'a';
            printf("%c", map_lower[idx]);
        }
        else
        {
            printf("%c", c);
        }
    }

    printf("\n");
    return 0;
}

bool valid_key(string k, char map_upper[26], char map_lower[26])
{
    int n = strlen(k);

    if (n != 26)
    {
        printf("Key must contain 26 characters.\n");
        return false;
    }

    bool seen[26] = { false };

    for (int i = 0; i < 26; i++)
    {
        unsigned char ch = (unsigned char) k[i];

        if (!isalpha(ch))
        {
            printf("Key must only contain alphabetic characters.\n");
            return false;
        }

        int idx = toupper(ch) - 'A';
        if (seen[idx])
        {
            printf("Key must not contain repeated characters.\n");
            return false;
        }
        seen[idx] = true;

        map_upper[i] = (char) toupper(ch); 
        map_lower[i] = (char) tolower(ch); 
    }

    return true;
}
