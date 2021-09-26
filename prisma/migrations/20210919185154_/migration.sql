/*
  Warnings:

  - You are about to drop the `Action` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ActionRule` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Group` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GroupMember` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GroupMemberRule` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Hook` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Rule` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Server` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Action" DROP CONSTRAINT "Action_serverId_fkey";

-- DropForeignKey
ALTER TABLE "Group" DROP CONSTRAINT "Group_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "GroupMember" DROP CONSTRAINT "GroupMember_groupId_fkey";

-- DropForeignKey
ALTER TABLE "GroupMember" DROP CONSTRAINT "GroupMember_userId_fkey";

-- DropForeignKey
ALTER TABLE "GroupMemberRule" DROP CONSTRAINT "GroupMemberRule_groupMemberId_fkey";

-- DropForeignKey
ALTER TABLE "GroupMemberRule" DROP CONSTRAINT "GroupMemberRule_ruleId_fkey";

-- DropForeignKey
ALTER TABLE "Hook" DROP CONSTRAINT "Hook_groupId_fkey";

-- DropForeignKey
ALTER TABLE "Server" DROP CONSTRAINT "Server_groupId_fkey";

-- DropTable
DROP TABLE "Action";

-- DropTable
DROP TABLE "ActionRule";

-- DropTable
DROP TABLE "Group";

-- DropTable
DROP TABLE "GroupMember";

-- DropTable
DROP TABLE "GroupMemberRule";

-- DropTable
DROP TABLE "Hook";

-- DropTable
DROP TABLE "Rule";

-- DropTable
DROP TABLE "Server";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "user" (
    "userId" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "user_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "group" (
    "groupId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "ownerId" INTEGER NOT NULL,

    CONSTRAINT "group_pkey" PRIMARY KEY ("groupId")
);

-- CreateTable
CREATE TABLE "group_member" (
    "groupMemberId" SERIAL NOT NULL,
    "groupId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "group_member_pkey" PRIMARY KEY ("groupMemberId")
);

-- CreateTable
CREATE TABLE "group_member_rule" (
    "groupMemberRuleId" SERIAL NOT NULL,
    "groupMemberId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "ruleId" INTEGER NOT NULL,

    CONSTRAINT "group_member_rule_pkey" PRIMARY KEY ("groupMemberRuleId")
);

-- CreateTable
CREATE TABLE "rule" (
    "ruleId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "rule_pkey" PRIMARY KEY ("ruleId")
);

-- CreateTable
CREATE TABLE "server" (
    "serverId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "groupId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "host" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "port" TEXT NOT NULL,
    "authMethod" INTEGER NOT NULL,
    "actionActionId" INTEGER NOT NULL,
    "privateKey" TEXT NOT NULL,

    CONSTRAINT "server_pkey" PRIMARY KEY ("serverId")
);

-- CreateTable
CREATE TABLE "hook" (
    "hookId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "groupId" INTEGER NOT NULL,
    "event" TEXT NOT NULL,
    "origin" TEXT NOT NULL,
    "repos" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "hook_pkey" PRIMARY KEY ("hookId")
);

-- CreateTable
CREATE TABLE "action" (
    "actionId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "serverId" INTEGER NOT NULL,
    "hookId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "command" TEXT NOT NULL,
    "actionType" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "action_pkey" PRIMARY KEY ("actionId")
);

-- CreateTable
CREATE TABLE "action_rule" (
    "actionRuleId" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "relatedRule" TEXT NOT NULL,

    CONSTRAINT "action_rule_pkey" PRIMARY KEY ("actionRuleId")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_userId_key" ON "user"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_username_key" ON "user"("username");

-- CreateIndex
CREATE UNIQUE INDEX "group_groupId_key" ON "group"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "group_ownerId_unique" ON "group"("ownerId");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_groupMemberId_key" ON "group_member"("groupMemberId");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_groupId_unique" ON "group_member"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_userId_unique" ON "group_member"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_rule_groupMemberRuleId_key" ON "group_member_rule"("groupMemberRuleId");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_rule_ruleId_unique" ON "group_member_rule"("ruleId");

-- CreateIndex
CREATE UNIQUE INDEX "group_member_rule_groupMemberId_unique" ON "group_member_rule"("groupMemberId");

-- CreateIndex
CREATE UNIQUE INDEX "rule_ruleId_key" ON "rule"("ruleId");

-- CreateIndex
CREATE UNIQUE INDEX "server_serverId_key" ON "server"("serverId");

-- CreateIndex
CREATE UNIQUE INDEX "server_groupId_unique" ON "server"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "hook_hookId_key" ON "hook"("hookId");

-- CreateIndex
CREATE UNIQUE INDEX "hook_groupId_unique" ON "hook"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "action_actionId_key" ON "action"("actionId");

-- CreateIndex
CREATE UNIQUE INDEX "action_serverId_unique" ON "action"("serverId");

-- CreateIndex
CREATE UNIQUE INDEX "action_rule_actionRuleId_key" ON "action_rule"("actionRuleId");

-- AddForeignKey
ALTER TABLE "group" ADD CONSTRAINT "group_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "user"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_member" ADD CONSTRAINT "group_member_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "group"("groupId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_member" ADD CONSTRAINT "group_member_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_member_rule" ADD CONSTRAINT "group_member_rule_ruleId_fkey" FOREIGN KEY ("ruleId") REFERENCES "rule"("ruleId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_member_rule" ADD CONSTRAINT "group_member_rule_groupMemberId_fkey" FOREIGN KEY ("groupMemberId") REFERENCES "group_member"("groupMemberId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "server" ADD CONSTRAINT "server_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "group"("groupId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "hook" ADD CONSTRAINT "hook_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "group"("groupId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "action" ADD CONSTRAINT "action_serverId_fkey" FOREIGN KEY ("serverId") REFERENCES "server"("serverId") ON DELETE RESTRICT ON UPDATE CASCADE;
