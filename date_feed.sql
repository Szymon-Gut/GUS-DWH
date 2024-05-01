DECLARE @startDate DATE = '2000-01-01';
DECLARE @endDate DATE = '2200-12-31';
DECLARE @currentDate DATE = @startDate;

-- Tworzenie tabeli tymczasowej
CREATE TABLE #tempDates
(
    calendar_date DATE
);

-- Generowanie dat i zapisywanie ich do tabeli tymczasowej
WHILE @currentDate <= @endDate
BEGIN
    INSERT INTO #tempDates (calendar_date)
    VALUES (@currentDate);

    SET @currentDate = DATEADD(DAY, 1, @currentDate);
END

-- Wstawianie danych z tabeli tymczasowej do DimDate
INSERT INTO DimDate (date_id, calendar_date, week_of_year, quarter, year, month, day_of_week)
SELECT 
    YEAR(calendar_date) * 10000 + MONTH(calendar_date) * 100 + DAY(calendar_date) AS date_id,
    calendar_date,
    DATEPART(ISO_WEEK, calendar_date) AS week_of_year,
    DATEPART(QUARTER, calendar_date) AS quarter,
    YEAR(calendar_date) AS year,
    CASE DATENAME(MONTH, calendar_date)
        WHEN 'January' THEN 'Styczeñ'
        WHEN 'February' THEN 'Luty'
        WHEN 'March' THEN 'Marzec'
        WHEN 'April' THEN 'Kwiecieñ'
        WHEN 'May' THEN 'Maj'
        WHEN 'June' THEN 'Czerwiec'
        WHEN 'July' THEN 'Lipiec'
        WHEN 'August' THEN 'Sierpieñ'
        WHEN 'September' THEN 'Wrzesieñ'
        WHEN 'October' THEN 'PaŸdziernik'
        WHEN 'November' THEN 'Listopad'
        WHEN 'December' THEN 'Grudzieñ'
    END AS month,
    CASE DATENAME(WEEKDAY, calendar_date)
        WHEN 'Sunday' THEN 'Niedziela'
        WHEN 'Monday' THEN 'Poniedzia³ek'
        WHEN 'Tuesday' THEN 'Wtorek'
        WHEN 'Wednesday' THEN 'Œroda'
        WHEN 'Thursday' THEN 'Czwartek'
        WHEN 'Friday' THEN 'Pi¹tek'
        WHEN 'Saturday' THEN 'Sobota'
    END AS day_of_week
FROM #tempDates;

-- Usuwanie tabeli tymczasowej
DROP TABLE #tempDates;