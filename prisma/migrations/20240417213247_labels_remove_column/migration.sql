/*
  Warnings:

  - You are about to drop the column `employeeUserId` on the `labels` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "labels" DROP CONSTRAINT "labels_employeeUserId_fkey";

-- AlterTable
ALTER TABLE "labels" DROP COLUMN "employeeUserId";

-- AddForeignKey
ALTER TABLE "labels" ADD CONSTRAINT "labels_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
