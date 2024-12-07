/*
  Warnings:

  - You are about to drop the `player` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "player";

-- CreateTable
CREATE TABLE "Dashboard" (
    "id" SERIAL NOT NULL,
    "source" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "metaData" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Dashboard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "recordType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "recordType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MostRuns" (
    "id" SERIAL NOT NULL,
    "category" TEXT NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batsmen" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "average" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "MostRuns_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HighestScore" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batter" TEXT NOT NULL,
    "highScore" TEXT NOT NULL,
    "balls" TEXT NOT NULL,
    "verses" TEXT NOT NULL,
    "strikeRate" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "HighestScore_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HighestAverage" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batter" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "average" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "HighestAverage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "highestStrikeRate" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batter" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "average" TEXT NOT NULL,
    "strikeRate" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "highestStrikeRate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MostSixes" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batsmen" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "sixes" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "MostSixes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MostFours" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batter" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "fours" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "MostFours_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MostFifties" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batter" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "fifties" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "MostFifties_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MostHundreds" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batter" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "hundreds" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "MostHundreds_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MostNineties" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "batsmen" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "nineties" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "MostNineties_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MostWickets" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "bowler" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "overs" TEXT NOT NULL,
    "wickets" TEXT NOT NULL,
    "average" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "MostWickets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LowestAverage" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "bowler" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "wickets" TEXT NOT NULL,
    "average" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "LowestAverage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BestBowlingInnings" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "bowler" TEXT NOT NULL,
    "Vs" TEXT NOT NULL,
    "BBI" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "BestBowlingInnings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LowestEconomy" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "bowler" TEXT NOT NULL,
    "wickets" TEXT NOT NULL,
    "overs" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "economy" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "LowestEconomy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LowestStrikeRate" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "bowler" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "overs" TEXT NOT NULL,
    "wickets" TEXT NOT NULL,
    "strikeRate" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "LowestStrikeRate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MostFiveWickets" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "bowler" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "overs" TEXT NOT NULL,
    "wickets" TEXT NOT NULL,
    "fiveWickets" TEXT NOT NULL,
    "recordId" INTEGER NOT NULL,

    CONSTRAINT "MostFiveWickets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Player" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "faceImageId" TEXT NOT NULL,

    CONSTRAINT "Player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BowlingStats" (
    "id" SERIAL NOT NULL,
    "format" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "balls" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "maidens" TEXT NOT NULL,
    "wickets" TEXT NOT NULL,
    "average" TEXT NOT NULL,
    "economy" TEXT NOT NULL,
    "strikeRate" TEXT NOT NULL,
    "fourWickets" TEXT NOT NULL,
    "fiveWickets" TEXT NOT NULL,
    "tenwickets" TEXT NOT NULL,
    "playerId" INTEGER NOT NULL,

    CONSTRAINT "BowlingStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BattingStats" (
    "id" SERIAL NOT NULL,
    "format" TEXT NOT NULL,
    "matches" TEXT NOT NULL,
    "innings" TEXT NOT NULL,
    "runs" TEXT NOT NULL,
    "balls" TEXT NOT NULL,
    "highest" TEXT NOT NULL,
    "average" TEXT NOT NULL,
    "strikeRate" TEXT NOT NULL,
    "notOut" TEXT NOT NULL,
    "fours" TEXT NOT NULL,
    "sixes" TEXT NOT NULL,
    "ducks" TEXT NOT NULL,
    "fifties" TEXT NOT NULL,
    "hundreds" TEXT NOT NULL,
    "twoHundreds" TEXT NOT NULL,
    "threeHundreds" TEXT NOT NULL,
    "fourHundreds" TEXT NOT NULL,
    "playerId" INTEGER NOT NULL,

    CONSTRAINT "BattingStats_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "MostRuns_uniqueId_key" ON "MostRuns"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "HighestScore_uniqueId_key" ON "HighestScore"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "HighestAverage_uniqueId_key" ON "HighestAverage"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "highestStrikeRate_uniqueId_key" ON "highestStrikeRate"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "MostSixes_uniqueId_key" ON "MostSixes"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "MostFours_uniqueId_key" ON "MostFours"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "MostFifties_uniqueId_key" ON "MostFifties"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "MostHundreds_uniqueId_key" ON "MostHundreds"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "MostNineties_uniqueId_key" ON "MostNineties"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "MostWickets_uniqueId_key" ON "MostWickets"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "LowestAverage_uniqueId_key" ON "LowestAverage"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "BestBowlingInnings_uniqueId_key" ON "BestBowlingInnings"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "LowestEconomy_uniqueId_key" ON "LowestEconomy"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "LowestStrikeRate_uniqueId_key" ON "LowestStrikeRate"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "MostFiveWickets_uniqueId_key" ON "MostFiveWickets"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "Player_uniqueId_key" ON "Player"("uniqueId");

-- AddForeignKey
ALTER TABLE "Dashboard" ADD CONSTRAINT "Dashboard_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MostRuns" ADD CONSTRAINT "MostRuns_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HighestScore" ADD CONSTRAINT "HighestScore_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HighestAverage" ADD CONSTRAINT "HighestAverage_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "highestStrikeRate" ADD CONSTRAINT "highestStrikeRate_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MostSixes" ADD CONSTRAINT "MostSixes_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MostFours" ADD CONSTRAINT "MostFours_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MostFifties" ADD CONSTRAINT "MostFifties_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MostHundreds" ADD CONSTRAINT "MostHundreds_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MostNineties" ADD CONSTRAINT "MostNineties_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MostWickets" ADD CONSTRAINT "MostWickets_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LowestAverage" ADD CONSTRAINT "LowestAverage_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BestBowlingInnings" ADD CONSTRAINT "BestBowlingInnings_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LowestEconomy" ADD CONSTRAINT "LowestEconomy_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LowestStrikeRate" ADD CONSTRAINT "LowestStrikeRate_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MostFiveWickets" ADD CONSTRAINT "MostFiveWickets_recordId_fkey" FOREIGN KEY ("recordId") REFERENCES "recordType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BowlingStats" ADD CONSTRAINT "BowlingStats_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BattingStats" ADD CONSTRAINT "BattingStats_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
