/*
  Warnings:

  - Added the required column `userPass` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Action" (
    "actionId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "assignId" INTEGER NOT NULL,
    "actionTitle" TEXT NOT NULL,
    "actionDate" DATETIME NOT NULL,
    "actionDescription" TEXT,
    "actionType" TEXT NOT NULL,
    "actionState" BOOLEAN NOT NULL,
    CONSTRAINT "Action_assignId_fkey" FOREIGN KEY ("assignId") REFERENCES "Assign" ("assignId") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Action" ("actionDate", "actionDescription", "actionId", "actionState", "actionTitle", "actionType", "assignId") SELECT "actionDate", "actionDescription", "actionId", "actionState", "actionTitle", "actionType", "assignId" FROM "Action";
DROP TABLE "Action";
ALTER TABLE "new_Action" RENAME TO "Action";
CREATE TABLE "new_User" (
    "userId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userEmail" TEXT NOT NULL,
    "userPass" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "userLastName" TEXT NOT NULL,
    "userStatus" BOOLEAN NOT NULL
);
INSERT INTO "new_User" ("userEmail", "userId", "userLastName", "userName", "userStatus") SELECT "userEmail", "userId", "userLastName", "userName", "userStatus" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
