/*
  Warnings:

  - Made the column `assignId` on table `Company` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Company" (
    "companyId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "assignId" INTEGER NOT NULL,
    "companyName" TEXT NOT NULL,
    "companyAddress" TEXT NOT NULL,
    "companyWebsite" TEXT NOT NULL,
    "companyIndustry" TEXT NOT NULL,
    "companyRevenue" TEXT NOT NULL,
    "companyPhone" TEXT NOT NULL,
    CONSTRAINT "Company_assignId_fkey" FOREIGN KEY ("assignId") REFERENCES "Assign" ("assignId") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Company" ("assignId", "companyAddress", "companyId", "companyIndustry", "companyName", "companyPhone", "companyRevenue", "companyWebsite") SELECT "assignId", "companyAddress", "companyId", "companyIndustry", "companyName", "companyPhone", "companyRevenue", "companyWebsite" FROM "Company";
DROP TABLE "Company";
ALTER TABLE "new_Company" RENAME TO "Company";
CREATE UNIQUE INDEX "Company_assignId_key" ON "Company"("assignId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
