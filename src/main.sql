
SELECT * 
FROM PortfolioProject1..CovidDeaths;

-- The number of new case and new deaths by country by day ordered by country and date. 

SELECT location, date, new_cases, new_deaths 
FROM PortfolioProject1..CovidDeaths
ORDER BY 1, 2;

-- Looking at the total case and the total deaths by continent

SELECT continent, SUM(new_cases) AS  TotalCase, SUM(CAST(new_deaths AS int)) AS TotalDeaths
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 2;

-- Looking at the rate of mortality by continent

SELECT continent, MAX(total_cases) AS  TotalCase, MAX(CAST(total_deaths AS int)) AS TotalDeath, (MAX(CAST(total_deaths AS bigint)) * 100) / NULLIF(MAX(total_cases), 0) AS MortalityRate
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 4 DESC;

-- Looking at the rate of mortality by country

SELECT location, MAX(total_cases) AS  TotalCase, MAX(CAST(total_deaths AS int)) AS TotalDeath, (MAX(CAST(total_deaths AS bigint)) * 100) / NULLIF(MAX(total_cases), 0) AS MortalityRate
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY 4 DESC;


-- Looking at the rate of mortality of the African country
SELECT location, MAX(total_cases) AS  TotalCase, MAX(CAST(total_deaths AS int)) AS TotalDeath, (MAX(CAST(total_deaths AS bigint)) * 100) / NULLIF(MAX(total_cases), 0) AS MortalityRate
FROM PortfolioProject1..CovidDeaths
WHERE continent = 'Africa'
GROUP BY location
ORDER BY 4 DESC;
-- Looking at the country with highest death count 

SELECT location, MAX(CAST(total_deaths AS int)) AS TotalDeath
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL 
GROUP BY location
ORDER BY 2 DESC;

-- Looking at the country with the highest death count per population 

SELECT location, population, MAX(CAST(total_deaths AS int)) AS Total_Deaths_Count, (MAX(CAST(total_deaths AS int)) * 100 / population) AS Percentage_population_dead
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL 
GROUP BY location, population
ORDER BY Percentage_population_dead DESC;

-- Showing the country with the lowest death count
SELECT location, MIN(CAST(total_deaths AS int)) AS TotalDeath
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL 
GROUP BY location
ORDER BY 2 DESC;

-- Showing the day with the highest death count 

SELECT TOP(1) date, MAX(CAST(new_deaths AS int)) AS DailyHighestDeath
FROM PortfolioProject1..CovidDeaths
GROUP BY date
ORDER BY DailyHighestDeath  DESC;

-- Showing the day with the lowest death count
SELECT TOP(1) date, MIN(CAST(new_deaths AS int)) AS DailyLowestDeath
FROM PortfolioProject1..CovidDeaths
GROUP BY date
ORDER BY DailyLowestDeath  DESC;


-- Showing the continent with the highest death count

SELECT location, MAX(CAST(total_deaths AS int)) AS TotalDeath
FROM PortfolioProject1..CovidDeaths
WHERE continent IS  NULL
GROUP BY location
ORDER BY TotalDeath DESC;

-- Global numbers the cases and the death count

SELECT MAX(total_cases) AS TotalCase, MAX(CAST(total_deaths AS int)) AS TotalDeaths, MAX(CAST(total_deaths AS int)) / MAX(total_cases) * 100 AS DeathPercentage
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1;


-- Looking at the countries with highest infection rate 

SELECT location, population, MAX(total_cases) AS Highest_Infection_Count, (MAX(total_cases) * 100 / population) AS InfectionRate
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY InfectionRate DESC;

-- Looking at the country with highest cases of covid

SELECT location, MAX(total_cases) AS highest_infection_count
FROM PortfolioProject1..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY highest_infection_count DESC;

-- Looking at the African country with the highest cases of covid

SELECT location, MAX(total_cases) AS highest_infection_count
FROM PortfolioProject1..CovidDeaths
WHERE continent = 'Africa'
GROUP BY location
ORDER BY highest_infection_count DESC;

-- Looking at the total cases of Togo
SELECT location, MAX(total_cases) AS Highest_Infection_count
FROM PortfolioProject1..CovidDeaths
WHERE location IN ('Togo', 'Guinea')
GROUP BY location
ORDER BY Highest_Infection_count DESC;



-- We perform an INNER JOIN on the two tables two know more about the data in our two tables

SELECT *
FROM PortfolioProject1..CovidDeaths AS dea
JOIN PortfolioProject1..CovidVaccinations AS vac
	ON dea.location = vac.location
	  AND dea.date = vac.date;

-- Looking at the population vaccinated

SELECT dea.location, dea.population, MAX(CONVERT(int, vac.total_vaccinations)) AS Total_Vaccinations, (MAX(CONVERT(bigint, vac.total_vaccinations)) * 100 / dea.population) AS percentage_vaccinated
FROM PortfolioProject1..CovidDeaths AS dea
INNER JOIN PortfolioProject1..CovidVaccinations AS vac
	ON dea.location = vac.location
	  AND  dea.date = vac.date
WHERE dea.continent IS NOT NULL
GROUP BY dea.location, dea.population
ORDER BY percentage_vaccinated DESC;



-- Creation of a view

DROP VIEW IF EXISTS PopulationVaccinated;
CREATE VIEW  population_vaccinated AS  (
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject1..CovidDeaths AS dea
INNER JOIN PortfolioProject1..CovidVaccinations AS vac
	ON dea.location = vac.location
	  AND dea.date = vac.date
WHERE dea.continent IS NOT NULL )


SELECT * FROM population_vaccinated;
