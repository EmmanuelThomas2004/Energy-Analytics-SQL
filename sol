SELECT Region, SUM(EnergyGenerated_MWh) AS TotalGenerated_MWh,
       SUM(EnergyConsumed_MWh) AS TotalConsumed_MWh
FROM EnergyData
GROUP BY Region;

SELECT EnergySource, AVG(EnergyGenerated_MWh) AS AvgGeneration_MWh
FROM EnergyData
GROUP BY EnergySource
ORDER BY AvgGeneration_MWh DESC
LIMIT 1;

SELECT RecordID, Region, EnergySource,
       EnergyGenerated_MWh - EnergyConsumed_MWh AS EnergySurplus_MWh
FROM EnergyData;

SELECT Region, AVG(RenewableShare) AS AvgRenewableShare,
       RANK() OVER (ORDER BY AVG(RenewableShare) DESC) AS RenewableRank
FROM EnergyData
GROUP BY Region;

SELECT Region, EnergySource,
       ROUND(EnergyCost / NULLIF(EnergyGenerated_MWh, 0), 2) AS CostPerMWh
FROM EnergyData
ORDER BY CostPerMWh DESC;
