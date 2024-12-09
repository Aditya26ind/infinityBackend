import { PrismaClient } from '@prisma/client';
import axios from 'axios';
import express, { Request, Response } from 'express';
import authorize from '../utils/authorize';

const playerRouter = express.Router();
const prisma = new PrismaClient();

const API_CONFIG = {
  headers: {
    'x-rapidapi-key': 'e9985c34f3mshd4801fc9264dc1dp1eda2ajsn553938ad57ef',
    'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
  }
};

// Get all players or search by name
playerRouter.get('/search/:playerName',authorize, (async (req: Request, res: Response) => {
  try {
    const playerName = req.params.playerName as string; 
    console.log(playerName);

    if (!playerName) return res.status(400).json({ message: 'Player name is required' });

    const existingPlayers = await prisma.player.findMany({ where: { name: { contains: playerName, mode: 'insensitive' } } });
    if (existingPlayers.length > 0) {
      console.log('Players found:', existingPlayers);
      return res.status(200).json(existingPlayers);
    }

    const response = await axios.get(
      "https://cricbuzz-cricket.p.rapidapi.com/stats/v1/player/search",
      {
        params: { plrN: playerName },
        headers: API_CONFIG.headers
      }
    );

    const playersData = response.data.player.map((p: { 
      id: number; 
      name: string; 
      teamName: string; 
      faceImageId: string 
    }) => ({
      uniqueId: Number(p.id),
      name: p.name,
      country: p.teamName,
      faceImageId: p.faceImageId
    }));

    const createdPlayers = await prisma.player.createMany({
      data: playersData,
      skipDuplicates: true
    });

    const fexistingPlayers = await prisma.player.findMany({ where: { name: { contains: playerName, mode: 'insensitive' } } });
    return res.status(201).json(fexistingPlayers);
  } catch (error) {
    console.error('Error in /players:', error);
    res.status(500).json({ message: 'Internal Server Error', error: String(error) });
  }
})as any);

// Get player batting stats
playerRouter.get('/batting/:uniqueId', authorize, (async (req: Request, res: Response) => {
  try {
    const uniqueId = parseInt(req.params.uniqueId);
    if (isNaN(uniqueId)) {
      return res.status(400).json({ message: 'Invalid player ID' });
    }

    const player = await prisma.player.findUnique({
      where: { uniqueId }
    });

    if (!player) {
      return res.status(404).json({ message: 'Player not found' });
    }

    const battingData = await prisma.battingStats.findMany({
      where: { playerId: player.id },
      include:{ player: true }
    });

    if (battingData.length > 0) {
      return res.status(200).json(battingData);
    }

    const response = await axios.get(
      `https://cricbuzz-cricket.p.rapidapi.com/stats/v1/player/${uniqueId}/batting`,
      { headers: API_CONFIG.headers }
    );

    const battingStats = response.data;
    console.log('API Response Headers:', battingStats.headers);
    console.log('API Response Values:', battingStats.values);

    if (!battingStats.headers || !battingStats.values) {
      return res.status(500).json({ message: 'Invalid API response format' });
    }
    console.log(battingStats.values[0])
    const formattedData = {
      playerId: player.id,
      format: battingStats.headers.slice(1),
      matches: battingStats.values[0].values.slice(1) || null,
      innings: battingStats.values[1].values.slice(1) || null,
      runs: battingStats.values[2].values.slice(1) || null,
      balls: battingStats.values[3].values.slice(1) || null,
      highest: battingStats.values[4].values.slice(1) || null,
      average: battingStats.values[5].values.slice(1) || null,
      strikeRate: battingStats.values[6].values.slice(1) || null,
      notOut: battingStats.values[7].values.slice(1) || null,
      fours: battingStats.values[8].values.slice(1) || null,
      sixes: battingStats.values[9].values.slice(1) || null,
      ducks: battingStats.values[10].values.slice(1) || null,
      fifties: battingStats.values[11].values.slice(1)|| null,
      hundreds: battingStats.values[12].values.slice(1) || null,
      twoHundreds: battingStats.values[13].values.slice(1) || null,
      threeHundreds: battingStats.values[14].values.slice(1) || null,
      fourHundreds: battingStats.values[15].values.slice(1) || null
    };

    const createdStat = await prisma.battingStats.create({
      data: formattedData, 
    });
    const battingDatas = await prisma.battingStats.findMany({
      where: { playerId: player.id }
    });

    return res.status(201).json(battingDatas);
  } catch (error) {
    console.error('Error in /player/batting:', error);
    res.status(500).json({ message: 'Internal Server Error', error: String(error) });
  }
}) as any);


// Get player bowling stats
playerRouter.get('/bowling/:uniqueId', authorize,(async (req: Request, res: Response) => {
  try {
    const uniqueId = parseInt(req.params.uniqueId);
    if (isNaN(uniqueId)) {
      return res.status(400).json({ message: 'Invalid player ID' });
    }

    const player = await prisma.player.findUnique({
      where: { uniqueId }
    });

    if (!player) {
      return res.status(404).json({ message: 'Player not found' });
    }
    const bowlingStats = await prisma.bowlingStats.findMany({
      where: { playerId: player.id },
      include:{ player: true }
    });

    if (bowlingStats.length > 0) {
      return res.status(200).json(bowlingStats);
    }
    const response = await axios.get(
      `https://cricbuzz-cricket.p.rapidapi.com/stats/v1/player/${uniqueId}/bowling`,
      { headers: API_CONFIG.headers }
    );

    const apiStats = response.data;
    const formattedData = {
      playerId: player.id,
      format: apiStats.headers.slice(1),
      matches: apiStats.values[0].values.slice(1) || null,
      innings: apiStats.values[1].values.slice(1) || null,
      balls: apiStats.values[2].values.slice(1) || null,
      runs: apiStats.values[3].values.slice(1) || null,
      maidens: apiStats.values[4].values.slice(1) || null,
      wickets: apiStats.values[5].values.slice(1) || null,
      average: apiStats.values[6].values.slice(1) || null,
      economy: apiStats.values[7].values.slice(1) || null,
      strikeRate: apiStats.values[8].values.slice(1) || null,
      fourWickets: apiStats.values[9].values.slice(1) || null,
      fiveWickets: apiStats.values[10].values.slice(1) || null,
      tenwickets: apiStats.values[11].values.slice(1) || null
    };

    const createdStat = await prisma.bowlingStats.create({
      data: formattedData
    });

    return res.status(201).json(createdStat);
  } catch (error) {
    console.error('Error in /player/bowling:', error);
    res.status(500).json({ message: 'Internal Server Error', error: String(error) });
  }
}) as any);

playerRouter.get('/information/:uniqueId',authorize, (async (req: Request, res: Response) => {
  try {
    const uniqueId = parseInt(req.params.uniqueId);
    if (isNaN(uniqueId)) {
      return res.status(400).json({ message: 'Invalid player ID' });
    }

    const player = await prisma.player.findUnique({
      where: { uniqueId }
    });
    console.log(player);
    if (!player) {
      return res.status(404).json({ message: 'Player not found' });
    }

    const information = await prisma.information.findUnique({
      where: { playerId: player.id },
      include:{ player: true }
    });

    if(!information) {
      const response = await axios.get(
        `https://cricbuzz-cricket.p.rapidapi.com/stats/v1/player/${uniqueId}`,
        { headers: API_CONFIG.headers }
      );

      const apiInformation = response.data; await prisma.information.create(
        { data: { 
          bat: apiInformation.bat, bowl: apiInformation.bowl,
           name: apiInformation.name, nickName: apiInformation.nickName, 
           height: apiInformation.height, role: apiInformation.role, 
           birthPlace: apiInformation.birthPlace, intlTeam: apiInformation.intlTeam, 
           teams: apiInformation.teams, DoB: apiInformation.DoB, image: apiInformation.image, 
           bio: apiInformation.bio, rankings: JSON.stringify(apiInformation.rankings), playerId: player.id
         } });
         const information = await prisma.information.findUnique({
          where: { playerId: player.id }
        });
        return res.status(200).json(information);
  }
  return res.status(200).json(information);
  } catch (error) {
    console.error('Error in /player/information:', error);
    res.status(500).json({ message: 'Internal Server Error', error: String(error) });
  }
}) as any);

export default playerRouter;