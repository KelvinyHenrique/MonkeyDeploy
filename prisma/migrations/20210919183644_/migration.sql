-- CreateTable
CREATE TABLE "Server" (
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

    CONSTRAINT "Server_pkey" PRIMARY KEY ("serverId")
);

-- CreateTable
CREATE TABLE "Hook" (
    "hookId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "groupId" INTEGER NOT NULL,
    "event" TEXT NOT NULL,
    "origin" TEXT NOT NULL,
    "repos" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Hook_pkey" PRIMARY KEY ("hookId")
);

-- CreateTable
CREATE TABLE "Action" (
    "actionId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "serverId" INTEGER NOT NULL,
    "hookId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "command" TEXT NOT NULL,
    "actionType" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Action_pkey" PRIMARY KEY ("actionId")
);

-- CreateTable
CREATE TABLE "ActionRule" (
    "actionRuleId" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "relatedRule" TEXT NOT NULL,

    CONSTRAINT "ActionRule_pkey" PRIMARY KEY ("actionRuleId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Server_serverId_key" ON "Server"("serverId");

-- CreateIndex
CREATE UNIQUE INDEX "Server_groupId_unique" ON "Server"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "Hook_hookId_key" ON "Hook"("hookId");

-- CreateIndex
CREATE UNIQUE INDEX "Hook_groupId_unique" ON "Hook"("groupId");

-- CreateIndex
CREATE UNIQUE INDEX "Action_actionId_key" ON "Action"("actionId");

-- CreateIndex
CREATE UNIQUE INDEX "ActionRule_actionRuleId_key" ON "ActionRule"("actionRuleId");

-- AddForeignKey
ALTER TABLE "Server" ADD CONSTRAINT "Server_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("groupId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Server" ADD CONSTRAINT "Server_actionActionId_fkey" FOREIGN KEY ("actionActionId") REFERENCES "Action"("actionId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hook" ADD CONSTRAINT "Hook_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("groupId") ON DELETE RESTRICT ON UPDATE CASCADE;
