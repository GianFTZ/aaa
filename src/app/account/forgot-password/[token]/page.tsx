import React from 'react'
import { redirect } from 'next/navigation';
import ForgotPasswordForm from './forgotPasswordForm';
import prismaClient from '@/db/prismaClient';

export default async function LoginRoute({ params }: {
  params: { token: string };
}) {
  if (!params.token) {
    return redirect('/account/login');
  }
  
  const tokenInfo = await prismaClient.passwordReset.findUnique({
    where: { token: params.token },
  });

  if (!tokenInfo || tokenInfo.expires < new Date()) {
    return redirect('/account/login');
  }
  
  return <ForgotPasswordForm token={params.token} userId={tokenInfo.userId} />
}