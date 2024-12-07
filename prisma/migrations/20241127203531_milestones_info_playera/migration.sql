/*
  Warnings:

  - The `format` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `matches` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `innings` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `runs` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `balls` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `highest` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `average` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `strikeRate` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `notOut` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `fours` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `sixes` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `ducks` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `fifties` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `hundreds` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `twoHundreds` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `threeHundreds` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `fourHundreds` column on the `BattingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `format` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `matches` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `innings` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `balls` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `runs` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `maidens` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `wickets` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `average` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `economy` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `strikeRate` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `fourWickets` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `fiveWickets` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `tenwickets` column on the `BowlingStats` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `category` on the `MostRuns` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "BattingStats" DROP COLUMN "format",
ADD COLUMN     "format" TEXT[],
DROP COLUMN "matches",
ADD COLUMN     "matches" TEXT[],
DROP COLUMN "innings",
ADD COLUMN     "innings" TEXT[],
DROP COLUMN "runs",
ADD COLUMN     "runs" TEXT[],
DROP COLUMN "balls",
ADD COLUMN     "balls" TEXT[],
DROP COLUMN "highest",
ADD COLUMN     "highest" TEXT[],
DROP COLUMN "average",
ADD COLUMN     "average" TEXT[],
DROP COLUMN "strikeRate",
ADD COLUMN     "strikeRate" TEXT[],
DROP COLUMN "notOut",
ADD COLUMN     "notOut" TEXT[],
DROP COLUMN "fours",
ADD COLUMN     "fours" TEXT[],
DROP COLUMN "sixes",
ADD COLUMN     "sixes" TEXT[],
DROP COLUMN "ducks",
ADD COLUMN     "ducks" TEXT[],
DROP COLUMN "fifties",
ADD COLUMN     "fifties" TEXT[],
DROP COLUMN "hundreds",
ADD COLUMN     "hundreds" TEXT[],
DROP COLUMN "twoHundreds",
ADD COLUMN     "twoHundreds" TEXT[],
DROP COLUMN "threeHundreds",
ADD COLUMN     "threeHundreds" TEXT[],
DROP COLUMN "fourHundreds",
ADD COLUMN     "fourHundreds" TEXT[];

-- AlterTable
ALTER TABLE "BowlingStats" DROP COLUMN "format",
ADD COLUMN     "format" TEXT[],
DROP COLUMN "matches",
ADD COLUMN     "matches" TEXT[],
DROP COLUMN "innings",
ADD COLUMN     "innings" TEXT[],
DROP COLUMN "balls",
ADD COLUMN     "balls" TEXT[],
DROP COLUMN "runs",
ADD COLUMN     "runs" TEXT[],
DROP COLUMN "maidens",
ADD COLUMN     "maidens" TEXT[],
DROP COLUMN "wickets",
ADD COLUMN     "wickets" TEXT[],
DROP COLUMN "average",
ADD COLUMN     "average" TEXT[],
DROP COLUMN "economy",
ADD COLUMN     "economy" TEXT[],
DROP COLUMN "strikeRate",
ADD COLUMN     "strikeRate" TEXT[],
DROP COLUMN "fourWickets",
ADD COLUMN     "fourWickets" TEXT[],
DROP COLUMN "fiveWickets",
ADD COLUMN     "fiveWickets" TEXT[],
DROP COLUMN "tenwickets",
ADD COLUMN     "tenwickets" TEXT[];

-- AlterTable
ALTER TABLE "MostRuns" DROP COLUMN "category";

-- CreateTable
CREATE TABLE "Information" (
    "id" SERIAL NOT NULL,
    "bat" TEXT,
    "bowl" TEXT,
    "name" TEXT NOT NULL,
    "nickName" TEXT,
    "height" TEXT,
    "role" TEXT,
    "birthPlace" TEXT,
    "intlTeam" TEXT,
    "teams" TEXT,
    "DoB" TEXT,
    "image" TEXT,
    "bio" TEXT,
    "rankings" TEXT,
    "playerId" INTEGER,

    CONSTRAINT "Information_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Information_playerId_key" ON "Information"("playerId");

-- AddForeignKey
ALTER TABLE "Information" ADD CONSTRAINT "Information_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE SET NULL ON UPDATE CASCADE;
