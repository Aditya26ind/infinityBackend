import { PrismaClient } from '@prisma/client';
import express, { Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';

const prisma = new PrismaClient();
const apiRouter = express.Router();

apiRouter.post('/login', (async (req: Request, res: Response) => {
  const { username, password } = req.body;

  try {
    const user = await prisma.user.findUnique({
      where: {
        username,
      },
    });

    if (!user || !(await bcrypt.compare(password, user.password))) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }

    const token = jwt.sign({ userId: user.id }, 'your-secret-key', { expiresIn: '10h' });
    console.log(token);
    return res.json({ accessToken: token });
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
}) as any);

apiRouter.post('/register', (async (req: Request, res: Response) => {
  try {
    const { username, password } = req.body;
    const saltRounds = 10;

    const hashedPassword = await bcrypt.hash(password, saltRounds);

    await prisma.user.create({
      data: {
        username,
        password: hashedPassword,
      },
    });

    console.log(`Registration successful for ${username}`);
    return res.status(201).json({success: true, message: 'Registration successful'});
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
}) as any);

export default apiRouter;