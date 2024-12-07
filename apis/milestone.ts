import { PrismaClient } from "@prisma/client";
import express, { Request, Response } from "express";
import dotenv from 'dotenv';
import axios from "axios";
import authorize from "../utils/authorize";
import { getMilestonedata } from "../utils/getMilestone";
import { createMilestoneData } from "../utils/createMilestone";



dotenv.config();
const prisma = new PrismaClient();
const milestoneRouter = express.Router();

milestoneRouter.get('/types', authorize,(async (req: Request, res: Response) => {
    const data = {
        recordTypes: {
            batting: [
                "mostRuns",
                "highestScore",
                "highestAvg",
                "highestSr",
                "mostSixes",
                "mostFours",
                "mostFifties",
                "mostHundreds",
                "mostNineties"
            ],
            bowling: [
                "mostWickets",
                "lowestAvg",
                "bestBowlingInnings",
                "lowestEcon",
                "lowestSr",
                "mostFiveWickets"
            ]
        }
    };

    await prisma.recordType.createMany({
        data: [
            { name: 'batting' },
            { name: 'bowling' }
        ]
    });

    return res.status(200).json(data);
}) as any);


milestoneRouter.post('/record', authorize,(async (req: Request, res: Response) => {
    try {
        const { recordType, milestoneName } = req.body;
        console.log(recordType,milestoneName)

        if (!recordType || !milestoneName) {
            return res.status(404).json({ error: 'recordType and milestoneName required' });
        }

        const recordTypeFilter = await prisma.recordType.findFirst({ 
            where: { name: recordType } 
        });

        if (!recordTypeFilter) {
            return res.status(404).json({ error: 'Record type not found' });
        }
        console.log("recordFileter",recordTypeFilter)

        const milestoneDataFetched  = await getMilestonedata(milestoneName,recordTypeFilter.id)
        console.log(milestoneDataFetched);

        if (!milestoneDataFetched) {
            try {
                const  response  = await axios.get("https://cricbuzz-cricket.p.rapidapi.com/stats/v1/topstats/0", {
                    params: { statsType: milestoneName },
                    headers: { 
                        'x-rapidapi-key': process.env.RAPIDAPI_KEY, 
                        'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com' 
                    }
                });

                console.log(response.data)


                const data = response.data.values[0].values
                console.log(recordTypeFilter.id);
                const create = await createMilestoneData(milestoneName,data,recordTypeFilter.id);
                const fetched = await getMilestonedata(milestoneName,recordTypeFilter.id)
                return res.status(200).json(fetched)
            
                
            } catch (externalApiError) {
                console.error('External API Error:', externalApiError);
                return res.status(500).json({ error: 'Failed to fetch data from external API' });
            }
        }

        return res.status(200).json(milestoneDataFetched);
    } catch (error) {
        console.error('Server Error:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}) as any);



export default milestoneRouter;