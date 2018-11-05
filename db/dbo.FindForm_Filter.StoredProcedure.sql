USE [KumuApp]
GO
/****** Object:  StoredProcedure [dbo].[FindForm_Filter]    Script Date: 11/4/2018 2:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Nishiguchi
-- Create date: 11/3/2018
-- Description:	Using filters, gets basic information from a form to display on the main page
-- =============================================
CREATE PROCEDURE [dbo].[FindForm_Filter]
@FilterIsland int,
@FilterAge nvarchar(50),
@FilterPlant nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT ft.FormID, ft.PlantTaxaName, PlantType, pmt.PlantCommonName, pmt.PlantFedStatus, ft.LocationNotes
	FROM FormTbl ft
	INNER JOIN PlantMasterTbl pmt
	ON
		pmt.PlantTaxaName = ft.PlantTaxaName
	WHERE
		(@FilterPlant = '' OR pmt.PlantTaxaName = @FilterPlant OR pmt.PlantCommonName = @FilterPlant) AND
		(@FilterAge = 'any' OR ft.Age = @FilterAge) AND
		(@FilterIsland = -1 OR ft.IslandID = @FilterIsland)
END
GO
