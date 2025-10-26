#include <stdio.h>
#include <cs50.h>

string check_cards(long number);

int main(void)
{
    long number;

    do
    {
        number = get_long("Number: ");
    }
    while (number <= 0);

    string card = check_cards(number);
    printf("%s\n", card);

    return 0;
}

string check_cards(long number)
{
    int sum = 0;
    int i = 0;
    int first_digit = 0;
    int second_digit = 0;
    long temp = number;

    while (temp > 0)
    {
        int digit = temp % 10;

        if (temp < 100 && temp >= 10)
        {
            first_digit = temp / 10;
            second_digit = temp % 10;
        }

        if (i % 2 == 0)
        {
            sum += digit;
        }
        else
        {
            int product = digit * 2;
            sum += (product / 10) + (product % 10);
        }

        temp = temp / 10;
        i++;
    }

    if (sum % 10 != 0)
    {
        return "INVALID";
    }

    if (i == 15 && (first_digit == 3 && (second_digit == 4 || second_digit == 7)))
    {
        return "AMEX";
    }
    else if (i == 16 && first_digit == 5 && (second_digit >= 1 && second_digit <= 5))
    {
        return "MASTERCARD";
    }
    else if ((i == 13 || i == 16) && first_digit == 4)
    {
        return "VISA";
    }
    else
    {
        return "INVALID";
    }
}
