/*
  Warnings:

  - You are about to drop the column `customer_id` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `discount` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `order_id` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `table_id` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the `customers` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_customer_id_fkey";

-- AlterTable
ALTER TABLE "orders" DROP COLUMN "customer_id",
DROP COLUMN "discount",
DROP COLUMN "order_id",
DROP COLUMN "table_id";

-- DropTable
DROP TABLE "customers";
