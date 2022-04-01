SELECT * FROM sql_project.`happiness 2020 data`;
SELECT * FROM sql_project.`happiness 2019 data`;

-- Top 10 countries with the highest score and bottom 10 countries with lowest scores
SELECT country_name, ROUND(ladder_score,2) AS Scores FROM sql_project.`happiness 2020 data`
ORDER BY Ladder_score DESC
LIMIT 10;

SELECT country_name, ROUND(ladder_score,2) AS Scores FROM sql_project.`happiness 2020 data`
ORDER BY Ladder_score ASC
LIMIT 10;

-- Average score of each variable by region
SELECT Regional_indicator, 
ROUND(AVG(Social_support),2) AS 'Social support',
ROUND(AVG(Healthy_life_expectancy),2) AS 'AVG Life expectancy',
ROUND(AVG(Freedom_to_make_life_choices),2) AS 'AVG Freedom',
ROUND(AVG(Generosity),2) AS 'AVG Generosity',
ROUND(AVG(Perceptions_of_corruption),2) AS 'AVG Perception of corruption',
ROUND(AVG(Logged_GDP_per_capita),2) AS 'AVG GDP per capita'
FROM sql_project.`happiness 2020 data` 
GROUP BY Regional_indicator;

-- Both tables joined together and filter for one specific country and look at change in data year on year
SELECT* FROM sql_project.`happiness 2019 data` table1
LEFT JOIN sql_project.`happiness 2020 data` table2
ON table1.country_name=table2.country_name
WHERE table2.country_name = 'Iceland';


-- Average score of each variable by region and year
SELECT table1.Regional_indicator, 
ROUND(AVG(table1.social_support),2) AS '2020 AVG social support', 
ROUND(AVG(table2.social_support),2) AS '2019 AVG social support',
ROUND(AVG(Table1.healthy_life_expectancy),2) AS '2020 AVG life expectancy' , 
ROUND(AVG(Table2.healthy_life_expectancy),2) AS '2019 AVG life expectancy',
ROUND(AVG(table1.Freedom_to_make_life_choices),2) AS '2020 AVG Freedom to make life choices', 
ROUND(AVG(table2.Freedom_to_make_life_choices),2) AS '2019 AVG Freedom to make life choices',
ROUND(AVG(table1.generosity),2) AS'2020 AVG Generosity', 
ROUND(AVG(table2.generosity),2) AS '2019 AVG generosity',
ROUND(AVG(table1.Perceptions_of_corruption),2) AS '2020 AVG Perceptions of corruption', 
ROUND(AVG(table2.Perceptions_of_corruption),2) AS '2019 AVG Perceptions of corruption' 
FROM sql_project.`happiness 2020 data` table1
INNER JOIN  sql_project.`happiness 2019 data` table2
ON table1.Country_name= table2.Country_name
GROUP BY 1
ORDER BY 2 DESC;

-- Countries that have a minimum and maximum score for each vaiable
SELECT 
Max(social_support) AS 'Max social support', 
MIN(social_support) AS 'Min social support',
Max(logged_GDP_per_capita) AS 'Max GDP per capita', 
MIN(logged_GDP_per_capita) AS 'MIN GDP per capita',
Max(Healthy_life_expectancy) AS 'Max life expectancy', 
MIN(Healthy_life_expectancy) AS 'Min life expectancy',
Max(Freedom_to_make_life_choices) AS 'Max freedom of choice', 
MIN(Freedom_to_make_life_choices) AS 'Min freedom of choice',
Max(Generosity) AS 'Max Generosity', Min(Generosity) AS 'Min Generosity',
Max(Perceptions_of_corruption) AS 'Max Perceptions of corruption', 
MIN(Perceptions_of_corruption) AS 'Min Perceptions of corruption'
FROM sql_project.`happiness 2020 data`;


-- countries that have a score above 7, how does this relate to each region.
SELECT Regional_indicator, count(distinct ladder_score) FROM sql_project.`happiness 2020 data`
WHERE ladder_score > 7 
GROUP BY Regional_indicator;
SELECT country_name,count(distinct ladder_score) From sql_project.`happiness 2020 data`
WHERE ladder_score > 7
GROUP BY ladder_score;

-- countries that have a score below 3 and how is relate to the region
SELECT Regional_indicator, count(distinct ladder_score) FROM sql_project.`happiness 2020 data`
WHERE ladder_score <3 
GROUP BY Regional_indicator;
SELECT country_name,count(distinct ladder_score) From sql_project.`happiness 2020 data`
WHERE ladder_score < 3
GROUP BY ladder_score;
