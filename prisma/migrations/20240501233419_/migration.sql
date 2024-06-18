/*
  Warnings:

  - You are about to drop the column `description` on the `order_items` table. All the data in the column will be lost.
  - You are about to drop the column `discount` on the `order_items` table. All the data in the column will be lost.
  - You are about to drop the column `item` on the `order_items` table. All the data in the column will be lost.
  - Added the required column `details` to the `order_items` table without a default value. This is not possible if the table is not empty.
  - Added the required column `quantity` to the `order_items` table without a default value. This is not possible if the table is not empty.
  - Made the column `order_id` on table `order_items` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "order_items" DROP CONSTRAINT "order_items_order_id_fkey";

-- AlterTable
ALTER TABLE "order_items" DROP COLUMN "description",
DROP COLUMN "discount",
DROP COLUMN "item",
ADD COLUMN     "details" TEXT NOT NULL,
ADD COLUMN     "quantity" INTEGER NOT NULL,
ALTER COLUMN "order_id" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "order_items" ADD CONSTRAINT "order_items_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
