/*
  Warnings:

  - You are about to drop the `_LabelToTask` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `activitys` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `board_columns` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `board_members` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `boards` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `checklist_items` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `checklists` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `labels` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tasks` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_LabelToTask" DROP CONSTRAINT "_LabelToTask_A_fkey";

-- DropForeignKey
ALTER TABLE "_LabelToTask" DROP CONSTRAINT "_LabelToTask_B_fkey";

-- DropForeignKey
ALTER TABLE "activitys" DROP CONSTRAINT "activitys_board_id_fkey";

-- DropForeignKey
ALTER TABLE "activitys" DROP CONSTRAINT "activitys_new_column_id_fkey";

-- DropForeignKey
ALTER TABLE "activitys" DROP CONSTRAINT "activitys_old_column_id_fkey";

-- DropForeignKey
ALTER TABLE "activitys" DROP CONSTRAINT "activitys_original_column_id_fkey";

-- DropForeignKey
ALTER TABLE "activitys" DROP CONSTRAINT "activitys_task_id_fkey";

-- DropForeignKey
ALTER TABLE "activitys" DROP CONSTRAINT "activitys_user_id_fkey";

-- DropForeignKey
ALTER TABLE "board_columns" DROP CONSTRAINT "board_columns_board_id_fkey";

-- DropForeignKey
ALTER TABLE "board_members" DROP CONSTRAINT "board_members_board_id_fkey";

-- DropForeignKey
ALTER TABLE "board_members" DROP CONSTRAINT "board_members_user_id_fkey";

-- DropForeignKey
ALTER TABLE "checklist_items" DROP CONSTRAINT "checklist_items_checklist_id_fkey";

-- DropForeignKey
ALTER TABLE "checklists" DROP CONSTRAINT "checklists_task_id_fkey";

-- DropForeignKey
ALTER TABLE "labels" DROP CONSTRAINT "labels_board_id_fkey";

-- DropForeignKey
ALTER TABLE "labels" DROP CONSTRAINT "labels_user_id_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_assigned_to_id_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_column_id_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_created_by_user_id_fkey";

-- DropTable
DROP TABLE "_LabelToTask";

-- DropTable
DROP TABLE "activitys";

-- DropTable
DROP TABLE "board_columns";

-- DropTable
DROP TABLE "board_members";

-- DropTable
DROP TABLE "boards";

-- DropTable
DROP TABLE "checklist_items";

-- DropTable
DROP TABLE "checklists";

-- DropTable
DROP TABLE "labels";

-- DropTable
DROP TABLE "tasks";
