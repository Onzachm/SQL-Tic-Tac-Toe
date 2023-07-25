CREATE PROCEDURE usp_ResetTicTacToeBoard
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete all records from the TicTacToeBoard table to reset the game
    DELETE FROM TicTacToeBoard;

    PRINT 'Tic-Tac-Toe board has been reset.';
END;
