/*
  Warnings:

  - Added the required column `userId` to the `labels` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "labels" ADD COLUMN     "userId" TEXT NOT NULL;
