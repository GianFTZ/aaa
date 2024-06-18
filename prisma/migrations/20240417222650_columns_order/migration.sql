/*
  Warnings:

  - Added the required column `order` to the `board_columns` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "board_columns" ADD COLUMN     "order" INTEGER NOT NULL;
