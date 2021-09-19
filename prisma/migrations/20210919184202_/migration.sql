/*
  Warnings:

  - A unique constraint covering the columns `[serverId]` on the table `Action` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Server" DROP CONSTRAINT "Server_actionActionId_fkey";

-- CreateIndex
CREATE UNIQUE INDEX "Action_serverId_unique" ON "Action"("serverId");

-- AddForeignKey
ALTER TABLE "Action" ADD CONSTRAINT "Action_serverId_fkey" FOREIGN KEY ("serverId") REFERENCES "Server"("serverId") ON DELETE RESTRICT ON UPDATE CASCADE;
