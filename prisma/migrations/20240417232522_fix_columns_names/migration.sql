/*
  Warnings:

  - You are about to drop the column `boardId` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `dueDate` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `newColumnId` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `oldColumnId` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `originalColumnId` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `taskId` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `activities` table. All the data in the column will be lost.
  - You are about to drop the column `boardId` on the `board_columns` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `board_columns` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `board_columns` table. All the data in the column will be lost.
  - You are about to drop the column `backgroundUrl` on the `boards` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `boards` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `boards` table. All the data in the column will be lost.
  - The primary key for the `boards_members` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `boardId` on the `boards_members` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `boards_members` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `boards_members` table. All the data in the column will be lost.
  - You are about to drop the column `taskId` on the `checklists` table. All the data in the column will be lost.
  - You are about to drop the column `checklistId` on the `checklists_items` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `checklists_items` table. All the data in the column will be lost.
  - You are about to drop the column `boardId` on the `labels` table. All the data in the column will be lost.
  - You are about to drop the column `isDefault` on the `labels` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `labels` table. All the data in the column will be lost.
  - You are about to drop the column `orderId` on the `order_items` table. All the data in the column will be lost.
  - You are about to drop the column `orderId` on the `payments` table. All the data in the column will be lost.
  - You are about to drop the column `paymentType` on the `payments` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `sessions` table. All the data in the column will be lost.
  - You are about to drop the column `assignedToId` on the `tasks` table. All the data in the column will be lost.
  - You are about to drop the column `columnId` on the `tasks` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `tasks` table. All the data in the column will be lost.
  - You are about to drop the column `createdByUserId` on the `tasks` table. All the data in the column will be lost.
  - You are about to drop the column `dueDate` on the `tasks` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `tasks` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `tasks` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `activities` table without a default value. This is not possible if the table is not empty.
  - Added the required column `board_id` to the `board_columns` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `board_columns` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `status` on the `board_columns` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `updated_at` to the `boards` table without a default value. This is not possible if the table is not empty.
  - Added the required column `board_id` to the `boards_members` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `boards_members` table without a default value. This is not possible if the table is not empty.
  - Added the required column `task_id` to the `checklists` table without a default value. This is not possible if the table is not empty.
  - Added the required column `checklist_id` to the `checklists_items` table without a default value. This is not possible if the table is not empty.
  - Added the required column `board_id` to the `labels` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `labels` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_id` to the `payments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `payments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `sessions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `column_id` to the `tasks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by_user_id` to the `tasks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `tasks` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "activities" DROP CONSTRAINT "activities_boardId_fkey";

-- DropForeignKey
ALTER TABLE "activities" DROP CONSTRAINT "activities_newColumnId_fkey";

-- DropForeignKey
ALTER TABLE "activities" DROP CONSTRAINT "activities_oldColumnId_fkey";

-- DropForeignKey
ALTER TABLE "activities" DROP CONSTRAINT "activities_originalColumnId_fkey";

-- DropForeignKey
ALTER TABLE "activities" DROP CONSTRAINT "activities_taskId_fkey";

-- DropForeignKey
ALTER TABLE "activities" DROP CONSTRAINT "activities_userId_fkey";

-- DropForeignKey
ALTER TABLE "board_columns" DROP CONSTRAINT "board_columns_boardId_fkey";

-- DropForeignKey
ALTER TABLE "boards_members" DROP CONSTRAINT "boards_members_boardId_fkey";

-- DropForeignKey
ALTER TABLE "boards_members" DROP CONSTRAINT "boards_members_userId_fkey";

-- DropForeignKey
ALTER TABLE "checklists" DROP CONSTRAINT "checklists_taskId_fkey";

-- DropForeignKey
ALTER TABLE "checklists_items" DROP CONSTRAINT "checklists_items_checklistId_fkey";

-- DropForeignKey
ALTER TABLE "labels" DROP CONSTRAINT "labels_boardId_fkey";

-- DropForeignKey
ALTER TABLE "labels" DROP CONSTRAINT "labels_userId_fkey";

-- DropForeignKey
ALTER TABLE "order_items" DROP CONSTRAINT "order_items_orderId_fkey";

-- DropForeignKey
ALTER TABLE "payments" DROP CONSTRAINT "payments_orderId_fkey";

-- DropForeignKey
ALTER TABLE "sessions" DROP CONSTRAINT "sessions_userId_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_assignedToId_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_columnId_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_createdByUserId_fkey";

-- AlterTable
ALTER TABLE "activities" DROP COLUMN "boardId",
DROP COLUMN "createdAt",
DROP COLUMN "dueDate",
DROP COLUMN "newColumnId",
DROP COLUMN "oldColumnId",
DROP COLUMN "originalColumnId",
DROP COLUMN "startDate",
DROP COLUMN "taskId",
DROP COLUMN "userId",
ADD COLUMN     "board_id" TEXT,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "due_date" TIMESTAMP(3),
ADD COLUMN     "new_column_id" TEXT,
ADD COLUMN     "old_column_id" TEXT,
ADD COLUMN     "original_column_id" TEXT,
ADD COLUMN     "start_date" TIMESTAMP(3),
ADD COLUMN     "task_id" TEXT,
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "board_columns" DROP COLUMN "boardId",
DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "board_id" TEXT NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
DROP COLUMN "status",
ADD COLUMN     "status" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "boards" DROP COLUMN "backgroundUrl",
DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "background_url" TEXT,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "boards_members" DROP CONSTRAINT "boards_members_pkey",
DROP COLUMN "boardId",
DROP COLUMN "createdAt",
DROP COLUMN "userId",
ADD COLUMN     "board_id" TEXT NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "user_id" TEXT NOT NULL,
ADD CONSTRAINT "boards_members_pkey" PRIMARY KEY ("user_id", "board_id");

-- AlterTable
ALTER TABLE "checklists" DROP COLUMN "taskId",
ADD COLUMN     "task_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "checklists_items" DROP COLUMN "checklistId",
DROP COLUMN "createdAt",
ADD COLUMN     "checklist_id" TEXT NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "labels" DROP COLUMN "boardId",
DROP COLUMN "isDefault",
DROP COLUMN "userId",
ADD COLUMN     "board_id" TEXT NOT NULL,
ADD COLUMN     "id_default" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "order_items" DROP COLUMN "orderId",
ADD COLUMN     "order_id" TEXT;

-- AlterTable
ALTER TABLE "orders" ALTER COLUMN "status" SET DEFAULT 'PENDING';

-- AlterTable
ALTER TABLE "payments" DROP COLUMN "orderId",
DROP COLUMN "paymentType",
ADD COLUMN     "order_id" TEXT NOT NULL,
ADD COLUMN     "type" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "sessions" DROP COLUMN "userId",
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "tasks" DROP COLUMN "assignedToId",
DROP COLUMN "columnId",
DROP COLUMN "createdAt",
DROP COLUMN "createdByUserId",
DROP COLUMN "dueDate",
DROP COLUMN "startDate",
DROP COLUMN "updatedAt",
ADD COLUMN     "assigned_to_id" TEXT,
ADD COLUMN     "column_id" TEXT NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by_user_id" TEXT NOT NULL,
ADD COLUMN     "due_date" TIMESTAMP(3),
ADD COLUMN     "start_date" TIMESTAMP(3),
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AddForeignKey
ALTER TABLE "payments" ADD CONSTRAINT "payments_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sessions" ADD CONSTRAINT "sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_items" ADD CONSTRAINT "order_items_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "boards_members" ADD CONSTRAINT "boards_members_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "boards_members" ADD CONSTRAINT "boards_members_board_id_fkey" FOREIGN KEY ("board_id") REFERENCES "boards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "board_columns" ADD CONSTRAINT "board_columns_board_id_fkey" FOREIGN KEY ("board_id") REFERENCES "boards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tasks" ADD CONSTRAINT "tasks_column_id_fkey" FOREIGN KEY ("column_id") REFERENCES "board_columns"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tasks" ADD CONSTRAINT "tasks_assigned_to_id_fkey" FOREIGN KEY ("assigned_to_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tasks" ADD CONSTRAINT "tasks_created_by_user_id_fkey" FOREIGN KEY ("created_by_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "labels" ADD CONSTRAINT "labels_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "labels" ADD CONSTRAINT "labels_board_id_fkey" FOREIGN KEY ("board_id") REFERENCES "boards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "checklists" ADD CONSTRAINT "checklists_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "tasks"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "checklists_items" ADD CONSTRAINT "checklists_items_checklist_id_fkey" FOREIGN KEY ("checklist_id") REFERENCES "checklists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "tasks"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_board_id_fkey" FOREIGN KEY ("board_id") REFERENCES "boards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_old_column_id_fkey" FOREIGN KEY ("old_column_id") REFERENCES "board_columns"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_new_column_id_fkey" FOREIGN KEY ("new_column_id") REFERENCES "board_columns"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_original_column_id_fkey" FOREIGN KEY ("original_column_id") REFERENCES "board_columns"("id") ON DELETE SET NULL ON UPDATE CASCADE;
