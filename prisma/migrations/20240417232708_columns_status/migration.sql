/*
  Warnings:

  - Changed the type of `status` on the `board_columns` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "board_columns" DROP COLUMN "status",
ADD COLUMN     "status" "OrderStatus" NOT NULL;
