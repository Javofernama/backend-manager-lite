-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "userId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userEmail" TEXT NOT NULL,
    "userPass" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "userLastName" TEXT NOT NULL,
    "userStatus" BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO "new_User" ("userEmail", "userId", "userLastName", "userName", "userPass", "userStatus") SELECT "userEmail", "userId", "userLastName", "userName", "userPass", "userStatus" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
