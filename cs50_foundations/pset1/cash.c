#include <stdio.h>
#include <cs50.h>

int give_coins(int change); 

int main(void)
{
    int change;
    do
    {
        change = get_int("Change owed: ");
    }
    while (change < 0);#include <stdio.h>
#include <cs50.h>

int give_coins(int change);

int main(void)
{
    int change;
    do
    {
        change = get_int("Change owed: ");
    }
    while (change < 0);

    int all_coins = give_coins(change);
    printf("%i\n", all_coins);
}

int give_coins (int change)
{
    int quarter = 25;
    int dimes = 10;
    int nickels = 5;
    int pennies = 1;
    int coins = 0;

    while (change > 0)
    {
        if (change >= quarter)
        {
            change -= quarter;
        }
        else if (change >= dimes)
        {
            change -= dimes;
        }t
        else if (change >= nickels)
        {
            change -= nickels;
        }
        else
        {
            change -= pennies;
        }
        coins++;
    }
    return(coins);
}


    int total_coins = give_coins(change);
    printf("%i\n", total_coins);
}

int give_coins(int change)
{
    int quarter = 25;
    int dimes = 10;
    int nickels = 5;
    int pennies = 1;
    int coins = 0;

    while (change > 0)
    {
        if (change >= quarter)
        {
            change -= quarter;
        }
        else if (change >= dimes)
        {
            change -= dimes;
        }
        else if (change >= nickels)
        {
            change -= nickels;
        }
        else
        {
            change -= pennies;
        }
        coins++;
    }

    return coins; 
}
