/** NEW QUERY **/
-- Ensure the Matches table exists
IF OBJECT_ID('Matches', 'U') IS NOT NULL DROP TABLE Matches;
CREATE TABLE Matches (
    ServiceID INT,
    ContainerID INT
);

-- Declare variables to hold the IDs and quantities
DECLARE @ServiceID INT;
DECLARE @ContainerID INT;
DECLARE @ServiceQuantity INT;
DECLARE @ContainerQuantity INT;

-- Loop through each Service record that has a matching Container
WHILE EXISTS (
    SELECT 1
    FROM Service s
    INNER JOIN Container c ON s.CustomerID = c.CustomerID
    WHERE c.Quantity <= s.Quantity
      AND c.Frequency = s.Frequency
      AND NOT EXISTS (
          SELECT 1 FROM Matches m WHERE m.ContainerID = c.ContainerID
      )
)
BEGIN
    -- Select the top matching Service and Container records
    SELECT TOP(1)
        @ServiceID = s.ServiceID,
        @ContainerID = c.ContainerID,
        @ServiceQuantity = s.Quantity,
        @ContainerQuantity = c.Quantity
    FROM Service s
    INNER JOIN Container c ON s.CustomerID = c.CustomerID
    WHERE c.Quantity <= s.Quantity
      AND c.Frequency = s.Frequency
      AND NOT EXISTS (
          SELECT 1 FROM Matches m WHERE m.ContainerID = c.ContainerID
      )
    ORDER BY s.ServiceID, c.ContainerID; -- Order if necessary

    -- Insert the match into the Matches table
    INSERT INTO Matches (ServiceID, ContainerID)
    VALUES (@ServiceID, @ContainerID);

    -- Update the Service table
    UPDATE Service
    SET Quantity = Quantity - @ContainerQuantity
    WHERE ServiceID = @ServiceID;

    -- Optionally, you may want to remove the Container if it's fully used up
    -- DELETE FROM Container WHERE ContainerID = @ContainerID;
END;

-- Final result or further processing
SELECT * FROM Matches;
