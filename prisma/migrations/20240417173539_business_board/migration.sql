/*
  Warnings:

  - A unique constraint covering the columns `[business_id]` on the table `boards` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `business_id` to the `boards` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "boards" ADD COLUMN     "business_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "image" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "boards_business_id_key" ON "boards"("business_id");
