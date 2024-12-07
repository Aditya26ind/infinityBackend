import express, { Request, Response, NextFunction } from "express";
import apiRouter from "./apis/auth";
import playerRouter from "./apis/player";
import openAiRouter from "./apis/openAi";
import milestoneRouter from "./apis/milestone";
import cors from 'cors'
import morgan from 'morgan';



const app = express();
const PORT = process.env.PORT || 8000;

app.use(morgan('dev'));

app.use(cors({
  origin: 'http://localhost:3000', 
  methods: ['GET', 'POST', 'PUT', 'DELETE'], 
  allowedHeaders: ['Content-Type', 'Authorization']
}));

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.get("/", (req: Request, res: Response) => {
  res.send("Hello, World!");
});

app.use('/auth/user', apiRouter);
app.use('/players',playerRouter);
app.use('/openai', openAiRouter);
app.use('/milestones', milestoneRouter);

// Start Server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});