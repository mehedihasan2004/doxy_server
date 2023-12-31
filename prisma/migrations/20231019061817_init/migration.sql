-- CreateEnum
CREATE TYPE "Role" AS ENUM ('PATIENT', 'DOCTOR', 'ADMIN', 'SUPER_ADMIN');

-- CreateEnum
CREATE TYPE "Speciality" AS ENUM ('THYROID', 'EYE', 'NEUROLOGY', 'CARDIOLOGY', 'MEDICINE', 'PSYCHIATRY', 'DENTIST', 'ORTHOPEDICS', 'HAEMATOLOGY', 'GYNAECOLOGY');

-- CreateEnum
CREATE TYPE "Branch" AS ENUM ('BARISHAL', 'CHATTOGRAM', 'DHAKA', 'KHULNA', 'RAJSHAHI', 'RANGPUR', 'MYMENSINGH', 'SYLHET');

-- CreateEnum
CREATE TYPE "ProductCategory" AS ENUM ('MEDICINE', 'DEVICES', 'BABY_AND_MOM_CARE', 'NUTRITIONS_AND_DRINKS', 'PERSONAL_CARE', 'SUPPLEMENTS_AND_VITAMINS', 'HERBAL_AND_HOMIOPATHY');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'PATIENT',
    "contactNo" TEXT,
    "address" TEXT,
    "profileImage" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "doctors" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'DOCTOR',
    "contactNo" TEXT,
    "address" TEXT,
    "profileImage" TEXT,
    "speciality" "Speciality" NOT NULL,
    "experiences" TEXT NOT NULL,
    "practicing_branch" TEXT NOT NULL,
    "branch" "Branch" NOT NULL DEFAULT 'DHAKA',
    "treatmentId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "doctors_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "treatments" (
    "id" TEXT NOT NULL,
    "name" "Speciality" NOT NULL,
    "slots" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "treatments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "category" "ProductCategory" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_contactNo_key" ON "users"("contactNo");

-- CreateIndex
CREATE UNIQUE INDEX "doctors_email_key" ON "doctors"("email");

-- CreateIndex
CREATE UNIQUE INDEX "doctors_contactNo_key" ON "doctors"("contactNo");

-- AddForeignKey
ALTER TABLE "doctors" ADD CONSTRAINT "doctors_treatmentId_fkey" FOREIGN KEY ("treatmentId") REFERENCES "treatments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
