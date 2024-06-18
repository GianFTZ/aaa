/*
  Warnings:

  - You are about to drop the column `employeeUserId` on the `activities` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "activities" DROP CONSTRAINT "activities_employeeUserId_fkey";

-- AlterTable
ALTER TABLE "activities" DROP COLUMN "employeeUserId";

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
