/*
  Warnings:

  - You are about to drop the column `order` on the `board_columns` table. All the data in the column will be lost.
  - Added the required column `status` to the `board_columns` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "board_columns" DROP COLUMN "order",
ADD COLUMN     "status" "OrderStatus" NOT NULL;
