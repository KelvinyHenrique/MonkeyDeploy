/*
  Warnings:

  - You are about to drop the `Groups` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Groups" DROP CONSTRAINT "Groups_ownerId_fkey";

-- DropTable
DROP TABLE "Groups";

-- CreateTable
CREATE TABLE "Group" (
    "groupId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "ownerId" INTEGER NOT NULL,

    CONSTRAINT "Group_pkey" PRIMARY KEY ("groupId")
);

-- CreateTable
CREATE TABLE "GroupMember" (
    "groupMemberId" SERIAL NOT NULL,
    "groupId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "GroupMember_pkey" PRIMARY KEY ("groupMemberId")
);

-- CreateTable
CREATE TABLE "GroupMemberRule" (
    "groupMemberRuleId" SERIAL NOT NULL,
    "groupMemberId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "ruleId" INTEGER NOT NULL,

    CONSTRAINT "GroupMemberRule_pkey" PRIMARY KEY ("groupMemberRuleId")
);

-- CreateTable
CREATE TABLE "Rule" (
    "ruleId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "Rule_pkey" PRIMARY KEY ("ruleId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Group_groupId_key" ON "Group"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "Group_ownerId_unique" ON "Group"("ownerId");

-- CreateIndex
CREATE UNIQUE INDEX "GroupMember_groupMemberId_key" ON "GroupMember"("groupMemberId");

-- CreateIndex
CREATE UNIQUE INDEX "GroupMember_groupId_unique" ON "GroupMember"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "GroupMember_userId_unique" ON "GroupMember"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "GroupMemberRule_groupMemberRuleId_key" ON "GroupMemberRule"("groupMemberRuleId");

-- CreateIndex
CREATE UNIQUE INDEX "GroupMemberRule_ruleId_unique" ON "GroupMemberRule"("ruleId");

-- CreateIndex
CREATE UNIQUE INDEX "GroupMemberRule_groupMemberId_unique" ON "GroupMemberRule"("groupMemberId");

-- CreateIndex
CREATE UNIQUE INDEX "Rule_ruleId_key" ON "Rule"("ruleId");

-- CreateIndex
CREATE UNIQUE INDEX "User_userId_key" ON "User"("userId");

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupMember" ADD CONSTRAINT "GroupMember_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("groupId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupMember" ADD CONSTRAINT "GroupMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupMemberRule" ADD CONSTRAINT "GroupMemberRule_ruleId_fkey" FOREIGN KEY ("ruleId") REFERENCES "Rule"("ruleId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupMemberRule" ADD CONSTRAINT "GroupMemberRule_groupMemberId_fkey" FOREIGN KEY ("groupMemberId") REFERENCES "GroupMember"("groupMemberId") ON DELETE RESTRICT ON UPDATE CASCADE;
