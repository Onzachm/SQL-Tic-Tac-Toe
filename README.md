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

4. To start a new game, call the stored procedure


