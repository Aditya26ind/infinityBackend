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

export const getMilestonedata = async (milestoneName: string, id: number) => {
    const model = milestoneModels[milestoneName as keyof typeof milestoneModels];
    console.log(milestoneName, id);
    
    if (!model) {
        throw new Error(`Invalid milestone name: ${milestoneName}`);
    }

    console.log(await (model as any).findFirst({
        where: { recordId: id }
    }))
    return await (model as any).findFirst({
        where: { recordId: id }
    });
}