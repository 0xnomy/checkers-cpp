#include <iostream>
#include <stdlib.h>
#include <windows.h>
#include <time.h>

using namespace std;
void delay(int mseconds)
{
    clock_t goal = mseconds + clock();
    while (goal > clock())
        ;
}

class Piece
{
private:
    int i, j, X, Y, dirr, Playy, Opponent, temp, rate;

public:
    bool isKing(int X, int Y, char Playy, char Board[8][8])
    {
        if (X == 0)
        {
            return true;
        }
        else if (X == 7)
        {
            return true;
        }
        return false;
    }

    Piece()
    {
        temp = 0;
        rate = 0;
    }
    void Display(char Board[8][8])
    {
        system("cls");
        int i;
        for (i = 0; i < 8; i++)
        {
            cout << "  +---+---+---+---+---+---+---+---+" << endl;
            cout << i + 1 << " | " << Board[i][0] << " | " << Board[i][1] << " | " << Board[i][2] << " | " << Board[i][3] << " | " << Board[i][4] << " | " << Board[i][5] << " | " << Board[i][6] << " | " << Board[i][7] << " |" << endl;
        }
        cout << "  +---+---+---+---+---+---+---+---+" << endl;
        cout << "    A   B   C   D   E   F   G   H  " << endl;
    }
    void gotoxy(int m, int n)
    {
        COORD c;
        c.X = m;
        c.Y = n;
        SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), c);
    }
};

int main()
{
Intro:
    system("cls");
    Piece game;
    int i, j, X, Y, dirr, Playy, Opponent, temp, rate;
    char Board[8][8], A = 'W', B = 'B', position[2];
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 8; j++)
            Board[i][j] = ' ';
    }
    cout << "\t\t\t"
         << " WELCOME TO THE CHECKERS GAME " << endl;
    cout << "\t\t\t"
         << " ----------------------------" << endl
         << endl;
    cout << "There is just one simple rule:" << endl
         << endl;
    cout << "Playy with the most pieces in the end wins the game!" << endl
         << endl;
    cout << " _____Your Symbol is W and the Opponent's Symbol is B_____ " << endl
         << endl;
    delay(5000);
    A = 'W', B = 'B';
    char tICK = A;
    char Tick = B;
    delay(500);

    Board[0][0] = 'B', Board[0][2] = 'B', Board[0][4] = 'B', Board[0][6] = 'B', Board[1][1] = 'B', Board[1][3] = 'B', Board[1][5] = 'B', Board[1][7] = 'B', Board[2][0] = 'B', Board[2][2] = 'B', Board[2][4] = 'B', Board[2][6] = 'B';

    Board[5][1] = 'W', Board[5][3] = 'W', Board[5][5] = 'W', Board[5][7] = 'W', Board[6][0] = 'W', Board[6][2] = 'W', Board[6][4] = 'W', Board[6][6] = 'W', Board[7][1] = 'W', Board[7][3] = 'W', Board[7][5] = 'W', Board[7][7] = 'W';

start:
    game.Display(Board);
    cout << "It's (" << A << ") Turn..";
    delay(1000);
    cout << endl
         << "Enter Position: ( A1, G6, C3 etc. ) ";
    scanf("%s", position);
    cout << endl;
    if (position[0] == 'z' && position[1] == 'z')
        goto end;
    if (position[0] == 'A')
        X = 0;
    else if (position[0] == 'B')
        X = 1;
    else if (position[0] == 'C')
        X = 2;
    else if (position[0] == 'D')
        X = 3;
    else if (position[0] == 'E')
        X = 4;
    else if (position[0] == 'F')
        X = 5;
    else if (position[0] == 'G')
        X = 6;
    else if (position[0] == 'H')
        X = 7;
    else
    {
        cout << "Enter Again...";
        delay(500);
        goto start;
    }
    if (position[1] == '1')
        Y = 0;
    else if (position[1] == '2')
        Y = 1;
    else if (position[1] == '3')
        Y = 2;
    else if (position[1] == '4')
        Y = 3;
    else if (position[1] == '5')
        Y = 4;
    else if (position[1] == '6')
        Y = 5;
    else if (position[1] == '7')
        Y = 6;
    else if (position[1] == '8')
        Y = 7;
    else
    {
        cout << "Enter Again...";
        delay(500);
        goto start;
    }
    if (Board[Y][X] != A)
    {
        cout << "Enter Again...";
        delay(500);
        goto start;
    }
    if (game.isKing(X, Y, A, Board) == true)
    {
        cout << "Which dirr do you want your piece to move? " << endl;
        cout << "1 (Upper-Left) , 2 (Upper-Right) " << endl;
        cout << "3 (Lower-Left) , 4 (Lower-Right) ";
        cin >> dirr;
        A = tICK;
        B = Tick;
        if (dirr == 1)
        {
            if (X == 0 || Y == 0)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y - 1][X - 1] == A)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y - 1][X - 1] == ' ')
            {
                Board[Y][X] = ' ';
                Board[--Y][--X] = A;
                goto done1;
            }
            if (Board[Y - 1][X - 1] == B)
            {
                if (X <= 1)
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                if (Board[Y - 2][X - 2] != ' ')
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                else
                {
                    Board[Y][X] = ' ';
                    Board[Y - 1][X - 1] = ' ';
                    Y -= 2;
                    X -= 2;
                    Board[Y][X] = A;
                    goto done1;
                }
            }
        }
        if (dirr == 2)
        {
            if (X == 7 || Y == 0)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y - 1][X + 1] == A)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y - 1][X + 1] == ' ')
            {
                Board[Y][X] = ' ';
                Board[--Y][++X] = A;
                goto done1;
            }
            if (Board[Y - 1][X + 1] == B)
            {
                if (X >= 6)
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                if (Board[Y - 2][X + 2] != ' ')
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                else
                {
                    Board[Y][X] = ' ';
                    Board[Y - 1][X + 1] = ' ';
                    Y -= 2;
                    X += 2;
                    Board[Y][X] = A;
                    goto done1;
                }
            }
        }

        if (dirr == 3)
        {
            if (X == 0 || Y == 7)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y + 1][X - 1] == A)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y + 1][X - 1] == ' ')
            {
                Board[Y][X] = ' ';
                Board[++Y][--X] = A;
                goto done1;
            }
            if (Board[Y + 1][X - 1] == B)
            {
                if (X <= 1)
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                if (Board[Y + 2][X - 2] != ' ')
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                else
                {
                    Board[Y][X] = ' ';
                    Board[Y + 1][X - 1] = ' ';
                    Y += 2;
                    X -= 2;
                    Board[Y][X] = A;
                    goto done1;
                }
            }
        }
        if (dirr == 4)
        {
            if (X == 7 || Y == 7)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y + 1][X + 1] == A)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y + 1][X + 1] == ' ')
            {
                Board[Y][X] = ' ';
                Board[++Y][++X] = A;
                goto done1;
            }
            if (Board[Y + 1][X + 1] == B)
            {
                if (X >= 6)
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                if (Board[Y + 2][X + 2] != ' ')
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                else
                {
                    Board[Y][X] = ' ';
                    Board[Y + 1][X + 1] = ' ';
                    Y += 2;
                    X += 2;
                    Board[Y][X] = A;
                    goto done1;
                }
            }
        }
    }
    else
    {
        cout << "Which dirr do you want your piece to move? " << endl;
        cout << "1 (Upper-Left) , 2 (Upper-Right) " << endl;
        cin >> dirr;
        A = tICK;
        B = Tick;
        if (dirr == 1)
        {
            if (X == 0 || Y == 0)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y - 1][X - 1] == A)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y - 1][X - 1] == ' ')
            {
                Board[Y][X] = ' ';
                Board[--Y][--X] = A;
                goto done1;
            }
            if (Board[Y - 1][X - 1] == B)
            {
                if (X <= 1)
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                if (Board[Y - 2][X - 2] != ' ')
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                else
                {
                    Board[Y][X] = ' ';
                    Board[Y - 1][X - 1] = ' ';
                    Y -= 2;
                    X -= 2;
                    Board[Y][X] = A;
                    goto done1;
                }
            }
        }
        if (dirr == 2)
        {
            if (X == 7 || Y == 0)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y - 1][X + 1] == A)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y - 1][X + 1] == ' ')
            {
                Board[Y][X] = ' ';
                Board[--Y][++X] = A;
                goto done1;
            }
            if (Board[Y - 1][X + 1] == B)
            {
                if (X >= 6)
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                if (Board[Y - 2][X + 2] != ' ')
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                else
                {
                    Board[Y][X] = ' ';
                    Board[Y - 1][X + 1] = ' ';
                    Y -= 2;
                    X += 2;
                    Board[Y][X] = A;
                    goto done1;
                }
            }
        }

        if (dirr == 3)
        {
            if (X == 0 || Y == 7)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y + 1][X - 1] == A)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y + 1][X - 1] == ' ')
            {
                Board[Y][X] = ' ';
                Board[++Y][--X] = A;
                goto done1;
            }
            if (Board[Y + 1][X - 1] == B)
            {
                if (X <= 1)
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                if (Board[Y + 2][X - 2] != ' ')
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                else
                {
                    Board[Y][X] = ' ';
                    Board[Y + 1][X - 1] = ' ';
                    Y += 2;
                    X -= 2;
                    Board[Y][X] = A;
                    goto done1;
                }
            }
        }
        if (dirr == 4)
        {
            if (X == 7 || Y == 7)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y + 1][X + 1] == A)
            {
                cout << "Piece can't move....";
                delay(500);
                goto start;
            }
            if (Board[Y + 1][X + 1] == ' ')
            {
                Board[Y][X] = ' ';
                Board[++Y][++X] = A;
                goto done1;
            }
            if (Board[Y + 1][X + 1] == B)
            {
                if (X >= 6)
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                if (Board[Y + 2][X + 2] != ' ')
                {
                    cout << "Piece can't move....";
                    delay(500);
                    goto start;
                }
                else
                {
                    Board[Y][X] = ' ';
                    Board[Y + 1][X + 1] = ' ';
                    Y += 2;
                    X += 2;
                    Board[Y][X] = A;
                    goto done1;
                }
            }
        }
    }

done1:
    game.Display(Board);
    delay(500);
    Playy = 0;
    Opponent = 0;
    A = tICK;
    B = Tick;
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 8; j++)
        {
            if (Board[i][j] == A)
                Playy++;
        }
    }
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 8; j++)
        {
            if (Board[i][j] == B)
                Opponent++;
        }
    }
    if (Playy == 0 || Opponent == 0)
        goto end;
    cout << endl
         << "Opponent's (" << B << ") Turn........";
    delay(1000);
Again:
    if (rate == 15)
    {
        cout << endl
             << "Opponent got confused :-P";
        rate = 0;
        delay(1000);
        goto start;
    }
    if (temp == 15)
    {
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 8; j++)
            {
                if (Board[i][j] == B)
                    ;
                {
                    Y = i;
                    X = j;
                }
            }
        }
        temp = 0;
        rate++;
    }
    else
    {
        Y = rand() % 8;
        X = rand() % 8;
    }
    if (Board[Y][X] != B)
        goto Again;
    dirr = rand() % (4) + 1;
    if (Board[Y - 1][X - 1] == A && X > 1 && Y > 1)
        dirr = 1;
    if (Board[Y - 1][X + 1] == A && X < 6 && Y > 1)
        dirr = 2;
    if (Board[Y + 1][X - 1] == A && X > 1 && Y < 6)
        dirr = 3;
    if (Board[Y + 1][X + 1] == A && X < 6 && Y < 6)
        dirr = 4;

    A = tICK;
    B = Tick;
    if (dirr == 1)
    {
        if (X == 0 || Y == 0)
        {
            temp++;
            goto Again;
        }
        if (Board[Y - 1][X - 1] == B)
        {
            temp++;
            goto Again;
        }
        if (Board[Y - 1][X - 1] == ' ')
        {
            Board[Y][X] = ' ';
            Board[--Y][--X] = B;
            goto done2;
        }
        if (Board[Y - 1][X - 1] == A)
        {
            if (X >= 1)
            {
                temp++;
                goto Again;
            }
            if (Board[Y - 2][X - 2] != ' ')
            {
                temp++;
                goto Again;
            }
            else
            {
                Board[Y][X] = ' ';
                Board[Y - 1][X - 1] = ' ';
                Y -= 2;
                X -= 2;
                Board[Y][X] = B;
                goto done2;
            }
        }
    }

    if (dirr == 2)
    {
        if (X == 7 || Y == 0)
        {
            temp++;
            goto Again;
        }
        if (Board[Y - 1][X + 1] == B)
        {
            temp++;
            goto Again;
        }
        if (Board[Y - 1][X + 1] == ' ')
        {
            Board[Y][X] = ' ';
            Board[--Y][++X] = B;
            goto done2;
        }
        if (Board[Y - 1][X + 1] == A)
        {
            if (X >= 6)
            {
                temp++;
                goto Again;
            }
            if (Board[Y - 2][X + 2] != ' ')
            {
                temp++;
                goto Again;
            }
            else
            {
                Board[Y][X] = ' ';
                Board[Y - 1][X + 1] = ' ';
                Y -= 2;
                X += 2;
                Board[Y][X] = B;
                goto done2;
            }
        }
    }

    if (dirr == 3)
    {
        if (X == 0 || Y == 7)
        {
            temp++;
            goto Again;
        }
        if (Board[Y + 1][X - 1] == B)
        {
            temp++;
            goto Again;
        }
        if (Board[Y + 1][X - 1] == ' ')
        {
            Board[Y][X] = ' ';
            Board[++Y][--X] = B;
            goto done2;
        }
        if (Board[Y + 1][X - 1] == A)
        {
            if (X >= 1)
            {
                temp++;
                goto Again;
            }
            if (Board[Y + 2][X - 2] != ' ')
            {
                temp++;
                goto Again;
            }
            else
            {
                Board[Y][X] = ' ';
                Board[Y + 1][X - 1] = ' ';
                Y += 2;
                X -= 2;
                Board[Y][X] = B;
                goto done2;
            }
        }
    }
    if (dirr == 4)
    {
        if (X == 7 || Y == 7)
        {
            temp++;
            goto Again;
        }
        if (Board[Y + 1][X + 1] == B)
        {
            temp++;
            goto Again;
        }
        if (Board[Y + 1][X + 1] == ' ')
        {
            Board[Y][X] = ' ';
            Board[++Y][++X] = B;
            goto done2;
        }
        if (Board[Y + 1][X + 1] == A)
        {
            if (X >= 6)
            {
                temp++;
                goto Again;
            }
            if (Board[Y + 2][X + 2] != ' ')
            {
                temp++;
                goto Again;
            }
            else
            {
                Board[Y][X] = ' ';
                Board[Y + 1][X + 1] = ' ';
                Y += 2;
                X += 2;
                Board[Y][X] = B;
                goto done2;
            }
        }
    }

done2:
    game.Display(Board);
    delay(1000);
    Playy = 0;
    Opponent = 0;
    A = tICK;
    B = Tick;
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 8; j++)
        {
            if (Board[i][j] == A)
                Playy++;
        }
    }
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 8; j++)
        {
            if (Board[i][j] == B)
                Opponent++;
        }
    }
    if (Playy == 0 || Opponent == 0)
        goto end;
    else
        goto start;
end:
    system("cls");
    if (Playy > Opponent)
    {
        delay(2000);
        game.gotoxy(30, 10);
        cout << "Win";
    }
    if (Playy < Opponent)
    {
        delay(2000);
        game.gotoxy(30, 10);
        cout << "Win";
    }
    if (Playy == Opponent)
    {
        delay(2000);
        game.gotoxy(30, 10);
        cout << "IT'S A DRAW";
    }
    system("pause");
}
