CREATE PROCEDURE usp_PlayTicTacToe
    @Row INT,
    @Col INT,
    @PlayerMark CHAR(1)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Winner CHAR(1) = ' ';

    -- Check if the specified cell is already taken
    IF EXISTS (
        SELECT 1
        FROM TicTacToeBoard
        WHERE RowIndex = @Row AND ColIndex = @Col
    )
    BEGIN
        PRINT 'Cell is already occupied. Try another cell.';
        RETURN;
    END;

    -- Insert the player's mark into the specified cell
    INSERT INTO TicTacToeBoard (RowIndex, ColIndex, Mark)
    VALUES (@Row, @Col, @PlayerMark);

    -- Check if the player wins horizontally
    SELECT @Winner = Mark
    FROM TicTacToeBoard
    WHERE RowIndex = @Row
    GROUP BY Mark
    HAVING COUNT(*) = 3;

    IF @Winner IS NOT NULL
    BEGIN
        PRINT 'Player ' + @PlayerMark + ' wins!';
        EXEC usp_ResetTicTacToeBoard; -- Reset the game board after a win
        RETURN;
    END;

    -- Check if the player wins vertically
    SELECT @Winner = Mark
    FROM TicTacToeBoard
    WHERE ColIndex = @Col
    GROUP BY Mark
    HAVING COUNT(*) = 3;

    IF @Winner IS NOT NULL
    BEGIN
        PRINT 'Player ' + @PlayerMark + ' wins!';
        EXEC usp_ResetTicTacToeBoard; -- Reset the game board after a win
        RETURN;
    END;

    -- Check if the player wins diagonally (top-left to bottom-right)
    IF @Row = @Col
    BEGIN
        SELECT @Winner = Mark
        FROM TicTacToeBoard
        WHERE RowIndex = ColIndex
        GROUP BY Mark
        HAVING COUNT(*) = 3;

        IF @Winner IS NOT NULL
        BEGIN
            PRINT 'Player ' + @PlayerMark + ' wins!';
            EXEC usp_ResetTicTacToeBoard; -- Reset the game board after a win
            RETURN;
        END;
    END;

    -- Check if the player wins diagonally (top-right to bottom-left)
    IF @Row + @Col = 2
    BEGIN
        SELECT @Winner = Mark
        FROM TicTacToeBoard
        WHERE RowIndex = 2 - ColIndex
        GROUP BY Mark
        HAVING COUNT(*) = 3;

        IF @Winner IS NOT NULL
        BEGIN
            PRINT 'Player ' + @PlayerMark + ' wins!';
            EXEC usp_ResetTicTacToeBoard; -- Reset the game board after a win
            RETURN;
        END;
    END;

    -- Check if the game ends in a draw
    IF NOT EXISTS (SELECT 1 FROM TicTacToeBoard WHERE Mark IS NULL)
    BEGIN
        PRINT 'It''s a draw!';
        EXEC usp_ResetTicTacToeBoard; -- Reset the game board after a draw
        RETURN;
    END;

    -- If no winner and the game is not a draw, switch to the other player's turn
    IF @PlayerMark = 'X'
        EXEC usp_PlayTicTacToe @Row, @Col, 'O';
    ELSE
        EXEC usp_PlayTicTacToe @Row, @Col, 'X';
END;
