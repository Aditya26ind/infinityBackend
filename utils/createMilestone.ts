import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const milestoneModels = {
    mostRuns: prisma.mostRuns,
    highestScore: prisma.highestScore,
    highestAvg: prisma.highestAverage,
    highestSr: prisma.highestStrikeRate,
    mostSixes: prisma.mostSixes,
    mostFours: prisma.mostFours,
    mostFifties: prisma.mostFifties,
    mostHundreds: prisma.mostHundreds,
    mostNineties: prisma.mostNineties,
    mostWickets: prisma.mostWickets,
    lowestAvg: prisma.lowestAverage,
    bestBowlingInnings: prisma.bestBowlingInnings,
    lowestEcon: prisma.lowestEconomy,
    lowestSr: prisma.lowestStrikeRate,
    mostFiveWickets: prisma.mostFiveWickets
};

export const createMilestoneData = async (milestoneName: string, data: any,id:number) => {
    const model = milestoneModels[milestoneName as keyof typeof milestoneModels];
    
    if (!model) {
        throw new Error(`Invalid milestone name: ${milestoneName}`);
    }

    const recordId = id
    const columnNames = Object.keys((model as any).fields)
    
    const requiredColumns = columnNames.slice(1);

    const mappedData:any[] = [] 

    data.push(recordId)

    console.log(data)

    if (requiredColumns.length == data.length) {
        for (let i = 0; i < requiredColumns.length; i++) {
            mappedData.push({
                [requiredColumns[i]]: data[i]
            });

        }
        console.log(mappedData)
    }
    let mergedDict: { [key: string]: any } = {}; 
    mappedData.forEach(dict => { mergedDict = { ...mergedDict, ...dict }; });
    console.log(mergedDict);
    mergedDict['uniqueId']=parseInt(mergedDict['uniqueId'])
    const newRecord = await (model as any).create(
        {
            data: mergedDict
        } 
    );
    return newRecord;
};