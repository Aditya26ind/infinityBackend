/*
  Warnings:

  - A unique constraint covering the columns `[username]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "player" (
    "id" SERIAL NOT NULL,
    "uniqueId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "faceImageId" TEXT NOT NULL,

    CONSTRAINT "player_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "player_uniqueId_key" ON "player"("uniqueId");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");
