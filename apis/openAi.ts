import { PrismaClient } from "@prisma/client";
import express, { Request, Response } from "express";
import OpenAI from "openai";
import authorize from "../utils/authorize";
import {CustomRequest}  from '../utils/authorize';


const prisma = new PrismaClient();
const openAiRouter = express.Router();
const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY
});

openAiRouter.post('/generate',authorize, (async (req: Request, res: Response) => {
    try {
        if (!req.body.prompt) {
            return res.status(400).json({ 
                success: false, 
                message: 'Prompt is required' 
            });
        }

        const response = await openai.chat.completions.create({
            model: "gpt-4",
            messages: [
                {
                    role: "system",
                    content: "You are a cricket expert. Provide accurate cricket statistics, analysis, and insights.And output should strictly be in this json format, eg. {source:source , content:content, metaData:metaData}"
                },
                {
                    role: "user",
                    content: req.body.prompt
                }
            ],
            temperature: 0.7,
            max_tokens: 500
        });

        return res.status(200).json({
            success: true,
            data: response.choices[0].message
        });

    } catch (error: any) {
        console.error('Error:', error);
        return res.status(500).json({
            success: false,
            message: 'Error generating response'
        });
    }
})as any);

openAiRouter.post('/save',authorize, (async (req:CustomRequest, res:Response) => {
    try {
        if (!req.body.data) {
            return res.status(400).json({ success: false, message: 'Data is required' });
        }

        const { source, content, metaData } = req.body.data;

        if (!source || !content || !metaData) {
            return res.status(400).json({ success: false, message: 'Source, content, and metaData are required' });
        }

        await prisma.dashboard.create({
            data: {
                source:source,
                content:content,
                metaData:metaData,
                userId: req.user.id
            }
        });

        return res.status(200).json({ success: true, message: 'Data saved successfully' });
    } catch (error: any) {
        console.error('Error:', error);
        return res.status(500).json({ success: false, message: 'Error saving data' });
    }
})as any);


export default openAiRouter;