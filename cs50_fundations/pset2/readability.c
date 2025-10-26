#include <ctype.h>
#include <cs50.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

void count_letters(string text);
void count_words(string words);
void count_phrases(string phrases);
string calculate_grade(int words, int letters, int phrases);



bool flag = false;
int total_letters = 0;
int total_words = 0;
int total_phrases = 0;
string text;

int main(void)
{
    do
    {
        text = get_string("Text: ");
        flag = true;
    }
    while (flag == false);

    count_letters(text);
    count_words(text);
    count_phrases(text);
    string result = calculate_grade(total_words, total_letters, total_phrases);
    printf("%s\n", result);
}

void count_letters(string big)
{
    int lenght = strlen(big);
    for (int i = 0; i < lenght; i++)
    {
        if(big[i] != ' ' && toupper(big[i]) >= 65 && toupper(big[i]) <= 90)
        {
            total_letters++;
        }
    }
}


void count_words(string words)
{
    int lenght = strlen(words);
    for (int i = 0; i < lenght; i++)
    {
        if(words[i] == ' ')
        {
            total_words++;
        }
    }
        if(words[0] == ' ')
        {
            total_words -= 1;
        }
        if(words[lenght - 1] == ' ')
        {
            total_words -= 1;
        }
        total_words += 1;
}


void count_phrases(string phrases)
{
    // must be grater than 1 word
    int lenght = strlen(phrases);
    for (int i = 0; i < lenght; i++)
    {
        if(phrases[i] == '!' || phrases[i] == '.' || phrases[i] == '?')
        {
            total_phrases++;
        }
    }
}



string calculate_grade(int words, int letters, int phrases)
{
    float L = 100.0f * (float) letters / (float) words;
    float S = 100.0f * (float) phrases / (float) words;
    float index = 0.0588f * L - 0.296f * S - 15.8f;

    int grade = (int) round(index);

    if (grade < 1)
    {
        return "Before Grade 1";
    }
    else if (grade >= 16)
    {
        return "Grade 16+";
    }
    else
    {
        static char buffer[20]; // precisa ser estático porque retorna ponteiro
        sprintf(buffer, "Grade %i", grade);
        return buffer;
    }
}



