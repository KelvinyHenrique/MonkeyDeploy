/*
  Warnings:

  - You are about to drop the column `auth__method` on the `server` table. All the data in the column will be lost.
  - Added the required column `auth_method` to the `server` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "server" DROP CONSTRAINT "server_group_id_fkey";

-- AlterTable
ALTER TABLE "server" DROP COLUMN "auth__method",
ADD COLUMN     "auth_method" INTEGER NOT NULL,
ALTER COLUMN "group_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "server" ADD CONSTRAINT "server_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "group"("group_id") ON DELETE SET NULL ON UPDATE CASCADE;
