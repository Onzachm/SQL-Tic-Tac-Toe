#SQL-Tic-Tac-Toe

This repository contains a simple implementation of the Tic-Tac-Toe game as a stored procedure in MS-SQL. The game is played on a 3x3 grid, and players take turns placing their marks ('X' or 'O') until someone wins or the game ends in a draw. Additionally, there is a procedure to reset the game board for a new game.

## Requirements

- MS-SQL Server (MS-SQL 2008 or later)

## Usage

1. Clone the repository to your local machine or download the ZIP archive.

2. Connect to your MS-SQL Server using a management tool (e.g., SQL Server Management Studio).

3. Open the file `TicTacToe.sql` and execute its contents to create the required table and stored procedures in your database.

4. To start a new game, call the stored procedure `usp_ResetTicTacToeBoard`:

```sql
EXEC usp_ResetTicTacToeBoard;
```

5. To play the game, call the stored procedure `usp_PlayTicTacToe` with the desired row index, column index, and player mark ('X' or 'O') as parameters:

```sql
EXEC usp_PlayTicTacToe @Row, @Col, @PlayerMark;
```
Note: The stored procedure `usp_PlayTicTacToe` will handle the game logic and check for winning conditions. If there is a winner or the game ends in a draw, it will automatically reset the game board for a new round.

## Examples

* Start a new game:

```sql
EXEC usp_ResetTicTacToeBoard;
```

* Make a move (player 'X' places their mark in the top-left cell):

```sql
EXEC usp_PlayTicTacToe 0, 0, 'X';
```

* Make another move (player 'O' places their mark in the center cell):

```sql
EXEC usp_PlayTicTacToe 1, 1, 'O';
```

## Disclaimer

This implementation was a proof of concept I used to learn more about SQL stored procedures and programming in T-SQL. It may not be suitable for production use, and it lacks extensive error handling and input validation. Use it at your own risk.

It's a fevered dream I came up with when someone told me that "SQL is a turing complete language." If it's turing complete it means I can make games in it right? If you encounter any issues or have suggestions for improvements, that's just the nature of this beast. I am not sure if I will be able to (or am willing) to help work on this one any more.

