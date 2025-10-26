#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>

int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

string total_score(string input1, string input2);

int main(void)
{
    string result = " ";
    string player1;
    string player2;
    do
    {
        player1 = get_string("Player 1: ");
        player2 = get_string("Player 2: ");
    }
    while (strcmp(result, " ") != 0);

        result = total_score(player1, player2);
        printf("%s\n", result);

}

string total_score(string input1, string input2)
{
    int total_p1 = 0;
    int total_p2 = 0;
    int lenght1 = strlen(input1);
    int lenght2 = strlen(input2);


    for (int n = 0; n < lenght1; n++)
    {
        int indice1 = toupper(input1[n]) - 'A';
        if(toupper(input1[n]) >= 65 && toupper(input1[n]) <= 90)
        {
            total_p1 += POINTS[indice1];
        }
    }
    for (int n = 0; n < lenght2; n++)
    {
        int indice2 = toupper(input2[n]) - 'A';
        if(toupper(input2[n]) >= 65 && toupper(input2[n]) <= 90)
        {
            total_p2 += POINTS[indice2];
        }
    }
        if (total_p1 > total_p2)
        {
            return "Player 1 wins!";
        }
        else if (total_p1 < total_p2)
        {
            return "Player 2 wins!";
        }
        else
        {
            return "Tie!";
        }
    return "Tie!";
}
