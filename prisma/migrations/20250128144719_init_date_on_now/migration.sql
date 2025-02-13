-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Action" (
    "actionId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "assignId" INTEGER NOT NULL,
    "actionTitle" TEXT NOT NULL,
    "actionDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actionDescription" TEXT,
    "actionType" TEXT NOT NULL,
    "actionState" BOOLEAN NOT NULL,
    CONSTRAINT "Action_assignId_fkey" FOREIGN KEY ("assignId") REFERENCES "Assign" ("assignId") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Action" ("actionDate", "actionDescription", "actionId", "actionState", "actionTitle", "actionType", "assignId") SELECT "actionDate", "actionDescription", "actionId", "actionState", "actionTitle", "actionType", "assignId" FROM "Action";
DROP TABLE "Action";
ALTER TABLE "new_Action" RENAME TO "Action";
CREATE TABLE "new_Assign" (
    "assignId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "assignDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Assign_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("userId") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Assign" ("assignDate", "assignId", "userId") SELECT "assignDate", "assignId", "userId" FROM "Assign";
DROP TABLE "Assign";
ALTER TABLE "new_Assign" RENAME TO "Assign";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
