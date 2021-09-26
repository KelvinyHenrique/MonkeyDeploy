/*
  Warnings:

  - The primary key for the `action` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `actionId` on the `action` table. All the data in the column will be lost.
  - You are about to drop the column `actionType` on the `action` table. All the data in the column will be lost.
  - You are about to drop the column `hookId` on the `action` table. All the data in the column will be lost.
  - You are about to drop the column `serverId` on the `action` table. All the data in the column will be lost.
  - You are about to drop the column `startAt` on the `action` table. All the data in the column will be lost.
  - The primary key for the `action_rule` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `actionRuleId` on the `action_rule` table. All the data in the column will be lost.
  - You are about to drop the column `relatedRule` on the `action_rule` table. All the data in the column will be lost.
  - The primary key for the `group` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `groupId` on the `group` table. All the data in the column will be lost.
  - You are about to drop the column `ownerId` on the `group` table. All the data in the column will be lost.
  - The primary key for the `group_member` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `groupId` on the `group_member` table. All the data in the column will be lost.
  - You are about to drop the column `groupMemberId` on the `group_member` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `group_member` table. All the data in the column will be lost.
  - The primary key for the `group_member_rule` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `groupMemberId` on the `group_member_rule` table. All the data in the column will be lost.
  - You are about to drop the column `groupMemberRuleId` on the `group_member_rule` table. All the data in the column will be lost.
  - You are about to drop the column `ruleId` on the `group_member_rule` table. All the data in the column will be lost.
  - The primary key for the `hook` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `groupId` on the `hook` table. All the data in the column will be lost.
  - You are about to drop the column `hookId` on the `hook` table. All the data in the column will be lost.
  - The primary key for the `rule` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ruleId` on the `rule` table. All the data in the column will be lost.
  - The primary key for the `server` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `actionActionId` on the `server` table. All the data in the column will be lost.
  - You are about to drop the column `authMethod` on the `server` table. All the data in the column will be lost.
  - You are about to drop the column `groupId` on the `server` table. All the data in the column will be lost.
  - You are about to drop the column `privateKey` on the `server` table. All the data in the column will be lost.
  - You are about to drop the column `serverId` on the `server` table. All the data in the column will be lost.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `createdAt` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `user` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[action_id]` on the table `action` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[server_id]` on the table `action` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[action_rule_id]` on the table `action_rule` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[group_id]` on the table `group` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[owner_id]` on the table `group` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[group_member_id]` on the table `group_member` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[group_id]` on the table `group_member` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `group_member` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[group_member_rule_id]` on the table `group_member_rule` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rule_id]` on the table `group_member_rule` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[group_member_id]` on the table `group_member_rule` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[hook_id]` on the table `hook` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[group_id]` on the table `hook` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rule_id]` on the table `rule` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[server_id]` on the table `server` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[group_id]` on the table `server` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `action_type` to the `action` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hook_id` to the `action` table without a default value. This is not possible if the table is not empty.
  - Added the required column `server_id` to the `action` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_at` to the `action` table without a default value. This is not possible if the table is not empty.
  - Added the required column `related_rule` to the `action_rule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `owner_id` to the `group` table without a default value. This is not possible if the table is not empty.
  - Added the required column `group_id` to the `group_member` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `group_member` table without a default value. This is not possible if the table is not empty.
  - Added the required column `group_member_id` to the `group_member_rule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rule_id` to the `group_member_rule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `group_id` to the `hook` table without a default value. This is not possible if the table is not empty.
  - Added the required column `auth__method` to the `server` table without a default value. This is not possible if the table is not empty.
  - Added the required column `group_id` to the `server` table without a default value. This is not possible if the table is not empty.
  - Added the required column `private_key` to the `server` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "action" DROP CONSTRAINT "action_serverId_fkey";

-- DropForeignKey
ALTER TABLE "group" DROP CONSTRAINT "group_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "group_member" DROP CONSTRAINT "group_member_groupId_fkey";

-- DropForeignKey
ALTER TABLE "group_member" DROP CONSTRAINT "group_member_userId_fkey";

-- DropForeignKey
ALTER TABLE "group_member_rule" DROP CONSTRAINT "group_member_rule_groupMemberId_fkey";

-- DropForeignKey
ALTER TABLE "group_member_rule" DROP CONSTRAINT "group_member_rule_ruleId_fkey";

-- DropForeignKey
ALTER TABLE "hook" DROP CONSTRAINT "hook_groupId_fkey";

-- DropForeignKey
ALTER TABLE "server" DROP CONSTRAINT "server_groupId_fkey";

-- DropIndex
DROP INDEX "action_actionId_key";

-- DropIndex
DROP INDEX "action_serverId_unique";

-- DropIndex
DROP INDEX "action_rule_actionRuleId_key";

-- DropIndex
DROP INDEX "group_groupId_key";

-- DropIndex
DROP INDEX "group_ownerId_unique";

-- DropIndex
DROP INDEX "group_member_groupId_unique";

-- DropIndex
DROP INDEX "group_member_groupMemberId_key";

-- DropIndex
DROP INDEX "group_member_userId_unique";

-- DropIndex
DROP INDEX "group_member_rule_groupMemberId_unique";

-- DropIndex
DROP INDEX "group_member_rule_groupMemberRuleId_key";

-- DropIndex
DROP INDEX "group_member_rule_ruleId_unique";

-- DropIndex
DROP INDEX "hook_groupId_unique";

-- DropIndex
DROP INDEX "hook_hookId_key";

-- DropIndex
DROP INDEX "rule_ruleId_key";

-- DropIndex
DROP INDEX "server_groupId_unique";

-- DropIndex
DROP INDEX "server_serverId_key";

-- DropIndex
DROP INDEX "user_userId_key";

-- AlterTable
ALTER TABLE "action" DROP CONSTRAINT "action_pkey",
DROP COLUMN "actionId",
DROP COLUMN "actionType",
DROP COLUMN "hookId",
DROP COLUMN "serverId",
DROP COLUMN "startAt",
ADD COLUMN     "action_id" SERIAL NOT NULL,
ADD COLUMN     "action_type" TEXT NOT NULL,
ADD COLUMN     "hook_id" INTEGER NOT NULL,
ADD COLUMN     "server_id" INTEGER NOT NULL,
ADD COLUMN     "start_at" TIMESTAMP(3) NOT NULL,
ADD CONSTRAINT "action_pkey" PRIMARY KEY ("action_id");

-- AlterTable
ALTER TABLE "action_rule" DROP CONSTRAINT "action_rule_pkey",
DROP COLUMN "actionRuleId",
DROP COLUMN "relatedRule",
ADD COLUMN     "action_rule_id" SERIAL NOT NULL,
ADD COLUMN     "related_rule" TEXT NOT NULL,
ADD CONSTRAINT "action_rule_pkey" PRIMARY KEY ("action_rule_id");

-- AlterTable
ALTER TABLE "group" DROP CONSTRAINT "group_pkey",
DROP COLUMN "groupId",
DROP COLUMN "ownerId",
ADD COLUMN     "group_id" SERIAL NOT NULL,
ADD COLUMN     "owner_id" INTEGER NOT NULL,
ADD CONSTRAINT "group_pkey" PRIMARY KEY ("group_id");

-- AlterTable
ALTER TABLE "group_member" DROP CONSTRAINT "group_member_pkey",
DROP COLUMN "groupId",
DROP COLUMN "groupMemberId",
DROP COLUMN "userId",
ADD COLUMN     "group_id" INTEGER NOT NULL,
ADD COLUMN     "group_member_id" SERIAL NOT NULL,
ADD COLUMN     "user_id" INTEGER NOT NULL,
ADD CONSTRAINT "group_member_pkey" PRIMARY KEY ("group_member_id");

-- AlterTable
ALTER TABLE "group_member_rule" DROP CONSTRAINT "group_member_rule_pkey",
DROP COLUMN "groupMemberId",
DROP COLUMN "groupMemberRuleId",
DROP COLUMN "ruleId",
ADD COLUMN     "group_member_id" INTEGER NOT NULL,
ADD COLUMN     "group_member_rule_id" SERIAL NOT NULL,
ADD COLUMN     "rule_id" INTEGER NOT NULL,
ADD CONSTRAINT "group_member_rule_pkey" PRIMARY KEY ("group_member_rule_id");

-- AlterTable
ALTER TABLE "hook" DROP CONSTRAINT "hook_pkey",
DROP COLUMN "groupId",
DROP COLUMN "hookId",
ADD COLUMN     "group_id" INTEGER NOT NULL,
ADD COLUMN     "hook_id" SERIAL NOT NULL,
ADD CONSTRAINT "hook_pkey" PRIMARY KEY ("hook_id");

-- AlterTable
ALTER TABLE "rule" DROP CONSTRAINT "rule_pkey",
DROP COLUMN "ruleId",
ADD COLUMN     "rule_id" SERIAL NOT NULL,
ADD CONSTRAINT "rule_pkey" PRIMARY KEY ("rule_id");

-- AlterTable
ALTER TABLE "server" DROP CONSTRAINT "server_pkey",
DROP COLUMN "actionActionId",
DROP COLUMN "authMethod",
DROP COLUMN "groupId",
DROP COLUMN "privateKey",
DROP COLUMN "serverId",
ADD COLUMN     "auth__method" INTEGER NOT NULL,
ADD COLUMN     "group_id" INTEGER NOT NULL,
ADD COLUMN     "private_key" TEXT NOT NULL,
ADD COLUMN     "server_id" SERIAL NOT NULL,
ADD CONSTRAINT "server_pkey" PRIMARY KEY ("server_id");

-- AlterTable
ALTER TABLE "user" DROP CONSTRAINT "user_pkey",
DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
DROP COLUMN "userId",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3),
ADD COLUMN     "user_id" SERIAL NOT NULL,
ADD CONSTRAINT "user_pkey" PRIMARY KEY ("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "action_action_id_key" ON "action"("action_id");

-- CreateIndex
CREATE UNIQUE INDEX "action_server_id_unique" ON "action"("server_id");

-- CreateIndex
CREATE UNIQUE INDEX "action_rule_action_rule_id_key" ON "action_rule"("action_rule_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_group_id_key" ON "group"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_owner_id_unique" ON "group"("owner_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_group_member_id_key" ON "group_member"("group_member_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_group_id_unique" ON "group_member"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_user_id_unique" ON "group_member"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_rule_group_member_rule_id_key" ON "group_member_rule"("group_member_rule_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_rule_rule_id_unique" ON "group_member_rule"("rule_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_rule_group_member_id_unique" ON "group_member_rule"("group_member_id");

-- CreateIndex
CREATE UNIQUE INDEX "hook_hook_id_key" ON "hook"("hook_id");

-- CreateIndex
CREATE UNIQUE INDEX "hook_group_id_unique" ON "hook"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "rule_rule_id_key" ON "rule"("rule_id");

-- CreateIndex
CREATE UNIQUE INDEX "server_server_id_key" ON "server"("server_id");

-- CreateIndex
CREATE UNIQUE INDEX "server_group_id_unique" ON "server"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_user_id_key" ON "user"("user_id");

-- AddForeignKey
ALTER TABLE "group" ADD CONSTRAINT "group_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "user"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_member" ADD CONSTRAINT "group_member_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_member" ADD CONSTRAINT "group_member_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_member_rule" ADD CONSTRAINT "group_member_rule_rule_id_fkey" FOREIGN KEY ("rule_id") REFERENCES "rule"("rule_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_member_rule" ADD CONSTRAINT "group_member_rule_group_member_id_fkey" FOREIGN KEY ("group_member_id") REFERENCES "group_member"("group_member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "server" ADD CONSTRAINT "server_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "hook" ADD CONSTRAINT "hook_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "action" ADD CONSTRAINT "action_server_id_fkey" FOREIGN KEY ("server_id") REFERENCES "server"("server_id") ON DELETE RESTRICT ON UPDATE CASCADE;
