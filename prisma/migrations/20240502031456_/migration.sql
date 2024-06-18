/*
  Warnings:

  - You are about to drop the column `price` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the `payments` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `amount` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_id` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_type` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_jid` to the `orders` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "PaymentType" AS ENUM ('PIX');

-- DropForeignKey
ALTER TABLE "payments" DROP CONSTRAINT "payments_order_id_fkey";

-- AlterTable
ALTER TABLE "orders" DROP COLUMN "price",
ADD COLUMN     "amount" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "payment_id" TEXT NOT NULL,
ADD COLUMN     "payment_type" "PaymentType" NOT NULL,
ADD COLUMN     "user_jid" TEXT NOT NULL;

-- DropTable
DROP TABLE "payments";

-- DropEnum
DROP TYPE "ActivityType";

-- DropEnum
DROP TYPE "Role";
