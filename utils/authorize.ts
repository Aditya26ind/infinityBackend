import { PrismaClient } from '@prisma/client';
import express, { Request, Response, NextFunction, RequestHandler } from 'express';
import jwt from 'jsonwebtoken';


const prisma = new PrismaClient();

export interface CustomRequest extends Request 
{ 
    user?: any; 
}

const authorize: RequestHandler = async (
  req: CustomRequest, 
  res: Response, 
  next: NextFunction
) => {
    const token = req.header('Authorization')?.split(' ')[1]; 
    if (!token) { 
        res.status(401).json({ message: 'Unauthorized: Missing token' }); 
        return 
    }
    
    try {
        const decoded = jwt.verify(token, 'your-secret-key') as { userId: number };
        const user = await prisma.user.findUnique({ where: { id: decoded.userId } });
        
        if (!user) { 

             res.status(401).json({ message: 'Unauthorized: Invalid user' }); 
             return
        }
        
        req.user = user; 
        next();
    }
    catch (err) {
        console.error(err);
        res.status(401).json({ message: 'Unauthorized: Invalid token' });
        return
    }
};

export default authorize;