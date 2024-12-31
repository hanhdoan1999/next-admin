/*
  Warnings:

  - The primary key for the `Profile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `account_id` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `discord_handle` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `display_picture` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `is_receive_notification` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `profile_id` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `telegram_handle` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `x_handle` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the `Account` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Blockchain` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Game` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GameMedia` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GamePlatform` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GamePlatformRelation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GameSection` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GameSectionRelation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GameTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GameTagRelation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PlayerLaunchGame` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Profile2` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `Profile` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Game" DROP CONSTRAINT "Game_blockchain_id_fkey";

-- DropForeignKey
ALTER TABLE "GameMedia" DROP CONSTRAINT "GameMedia_game_id_fkey";

-- DropForeignKey
ALTER TABLE "GamePlatformRelation" DROP CONSTRAINT "GamePlatformRelation_game_id_fkey";

-- DropForeignKey
ALTER TABLE "GamePlatformRelation" DROP CONSTRAINT "GamePlatformRelation_game_platform_id_fkey";

-- DropForeignKey
ALTER TABLE "GameSectionRelation" DROP CONSTRAINT "GameSectionRelation_game_id_fkey";

-- DropForeignKey
ALTER TABLE "GameSectionRelation" DROP CONSTRAINT "GameSectionRelation_game_section_id_fkey";

-- DropForeignKey
ALTER TABLE "GameTagRelation" DROP CONSTRAINT "GameTagRelation_game_id_fkey";

-- DropForeignKey
ALTER TABLE "GameTagRelation" DROP CONSTRAINT "GameTagRelation_game_tag_id_fkey";

-- DropForeignKey
ALTER TABLE "PlayerLaunchGame" DROP CONSTRAINT "PlayerLaunchGame_account_id_fkey";

-- DropForeignKey
ALTER TABLE "PlayerLaunchGame" DROP CONSTRAINT "PlayerLaunchGame_game_id_fkey";

-- DropForeignKey
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_account_id_fkey";

-- DropForeignKey
ALTER TABLE "Profile2" DROP CONSTRAINT "Profile2_userId_fkey";

-- DropIndex
DROP INDEX "Profile_account_id_key";

-- AlterTable
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_pkey",
DROP COLUMN "account_id",
DROP COLUMN "created_at",
DROP COLUMN "discord_handle",
DROP COLUMN "display_picture",
DROP COLUMN "is_receive_notification",
DROP COLUMN "profile_id",
DROP COLUMN "telegram_handle",
DROP COLUMN "updated_at",
DROP COLUMN "x_handle",
ADD COLUMN     "bio" TEXT,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "userId" INTEGER,
ADD CONSTRAINT "Profile_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "Account";

-- DropTable
DROP TABLE "Blockchain";

-- DropTable
DROP TABLE "Game";

-- DropTable
DROP TABLE "GameMedia";

-- DropTable
DROP TABLE "GamePlatform";

-- DropTable
DROP TABLE "GamePlatformRelation";

-- DropTable
DROP TABLE "GameSection";

-- DropTable
DROP TABLE "GameSectionRelation";

-- DropTable
DROP TABLE "GameTag";

-- DropTable
DROP TABLE "GameTagRelation";

-- DropTable
DROP TABLE "PlayerLaunchGame";

-- DropTable
DROP TABLE "Profile2";

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userId_key" ON "Profile"("userId");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
