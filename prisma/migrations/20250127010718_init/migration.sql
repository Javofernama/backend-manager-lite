-- CreateTable
CREATE TABLE "User" (
    "userId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userEmail" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "userLastName" TEXT NOT NULL,
    "userStatus" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "Action" (
    "actionId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "assignId" INTEGER NOT NULL,
    "actionTitle" TEXT NOT NULL,
    "actionDate" DATETIME NOT NULL,
    "actionDescription" TEXT NOT NULL,
    "actionType" TEXT NOT NULL,
    "actionState" BOOLEAN NOT NULL,
    CONSTRAINT "Action_assignId_fkey" FOREIGN KEY ("assignId") REFERENCES "Assign" ("assignId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Assign" (
    "assignId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "assignDate" DATETIME NOT NULL,
    CONSTRAINT "Assign_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("userId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Company" (
    "companyId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "assignId" INTEGER,
    "companyName" TEXT NOT NULL,
    "companyAddress" TEXT NOT NULL,
    "companyWebsite" TEXT NOT NULL,
    "companyIndustry" TEXT NOT NULL,
    "companyRevenue" TEXT NOT NULL,
    "companyPhone" TEXT NOT NULL,
    CONSTRAINT "Company_assignId_fkey" FOREIGN KEY ("assignId") REFERENCES "Assign" ("assignId") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Contact" (
    "contactId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "companyId" INTEGER NOT NULL,
    "contactFirstName" TEXT NOT NULL,
    "contactLastName" TEXT NOT NULL,
    "contactGender" TEXT NOT NULL,
    "contactTitle" TEXT NOT NULL,
    "contactPosition" TEXT NOT NULL,
    "contactCode" TEXT NOT NULL,
    "contactEmail" TEXT NOT NULL,
    "contactProfileUrl" TEXT NOT NULL,
    CONSTRAINT "Contact_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company" ("companyId") ON DELETE RESTRICT ON UPDATE CASCADE
);
