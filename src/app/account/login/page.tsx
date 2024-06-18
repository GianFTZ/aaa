import React from 'react'
import { getServerSession } from 'next-auth';
import LoginForm from './login-form';
import { authOptions } from '@/app/api/auth/[...nextauth]/auth-options';
import { redirect } from 'next/navigation';

export default async function LoginRoute() {
  const session = await getServerSession(authOptions)
  if (session) {
    return redirect('/account')
  }
  return <LoginForm />
}