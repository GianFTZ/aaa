'use server';

import prismaClient from "@/db/prismaClient";
import bcrypt from 'bcrypt'

export async function updatePassword({
  password,
  userId,
  token
}: {
  password: string;
  userId: string;
  token: string;
}): Promise<{
  message?: string;
  error?: string;
}> {
  const tokenPassword = await prismaClient.passwordReset.findFirst({
    where: {
      token
    }
  })
  
  if (!tokenPassword || tokenPassword?.expires < new Date()) {
    return { error: 'Token expired' }
  }
  const user = await prismaClient.employeeUser.findUnique({
    where: {
      id: userId
    }
  })
  if (!user) {
    return { error: 'User not found' }
  }
  const hashedPassword = await bcrypt.hash(password, Number(process.env.SALT_ROUNDS))
  await prismaClient.employeeUser.update({
    where: {
      id: userId
    },
    data: {
      password: hashedPassword
    }
  })
  await prismaClient.passwordReset.deleteMany({
    where: {
      userId
    }
  })
  return { message: 'Password updated' }
}