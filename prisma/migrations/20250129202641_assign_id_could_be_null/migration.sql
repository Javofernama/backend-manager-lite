-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Company" (
    "companyId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "assignId" INTEGER,
    "companyName" TEXT NOT NULL,
    "companyAddress" TEXT,
    "companyWebsite" TEXT,
    "companyIndustry" TEXT,
    "companyRevenue" TEXT,
    "companyPhone" TEXT,
    CONSTRAINT "Company_assignId_fkey" FOREIGN KEY ("assignId") REFERENCES "Assign" ("assignId") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Company" ("assignId", "companyAddress", "companyId", "companyIndustry", "companyName", "companyPhone", "companyRevenue", "companyWebsite") SELECT "assignId", "companyAddress", "companyId", "companyIndustry", "companyName", "companyPhone", "companyRevenue", "companyWebsite" FROM "Company";
DROP TABLE "Company";
ALTER TABLE "new_Company" RENAME TO "Company";
CREATE UNIQUE INDEX "Company_assignId_key" ON "Company"("assignId");
CREATE TABLE "new_Contact" (
    "contactId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "companyId" INTEGER NOT NULL,
    "contactFirstName" TEXT NOT NULL,
    "contactLastName" TEXT,
    "contactGender" TEXT,
    "contactTitle" TEXT,
    "contactPosition" TEXT,
    "contactCode" TEXT,
    "contactEmail" TEXT,
    "contactProfileUrl" TEXT,
    CONSTRAINT "Contact_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company" ("companyId") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Contact" ("companyId", "contactCode", "contactEmail", "contactFirstName", "contactGender", "contactId", "contactLastName", "contactPosition", "contactProfileUrl", "contactTitle") SELECT "companyId", "contactCode", "contactEmail", "contactFirstName", "contactGender", "contactId", "contactLastName", "contactPosition", "contactProfileUrl", "contactTitle" FROM "Contact";
DROP TABLE "Contact";
ALTER TABLE "new_Contact" RENAME TO "Contact";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
