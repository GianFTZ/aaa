import CredentialProvider from "next-auth/providers/credentials"
import bcrypt from 'bcrypt'
import prismaClient from '@/db/prismaClient'
import { Session, User } from '@/models/session';
import validator from 'validator';
import { AuthOptions } from "next-auth"

export const authOptions: AuthOptions = {
  pages: {
    signIn: '/auth/login',
  },
  providers: [
    CredentialProvider({
      name: "Credentials",
      credentials: {
        email: { label: "Email", type: "text", placeholder: "Email" },
        password: { label: "Password", type: "password" },
      },
      authorize: async (credentials, req): Promise<any> => {
        const { email, password } = credentials as {
          email: string
          password: string
        }
        if (!validator.isEmail(email)) {
          throw new Error("Email inválido!")
        }
        const user = await prismaClient.employeeUser.findUnique({
          where: {
            email
          }
        });
        if (!user) {
          throw new Error("E-mail não encontrado ou senha inválida!")
        }
        const passwordMatch = await bcrypt.compare(password, user.password);
        if (!passwordMatch) {
          throw new Error("E-mail não encontrado ou senha inválida!")
        }
        return {
          id: user.id,
          name: user.name,
          email: user.email,
          image: user.image,
          businessId: user.businessId
        } as User
      }
    })
  ],
  secret: process.env.NEXTAUTH_SECRET as string,
  callbacks: {
    signIn: async ({ user, account, profile }) => {
      const { email } = user;
      const userExists = await prismaClient.employeeUser.findUnique({
        where: {
          email: email as string
        }
      });
      if (!userExists) {
        return false
      }
      return true;
    },
    session: async ({ session, user }) => {
      if (!session.user) {
        return session
      }
      const { user: { email } } = session as Session;
      const userExists = await prismaClient.employeeUser.findUnique({
        where: {
          email
        }
      });
      if (userExists) {
        return {
          ...session,
          user: {
            ...session.user,
            id: userExists.id,
            name: userExists.name,
            email: userExists.email,
            image: userExists.image,
            businessId: userExists.businessId
          }
        } as Session
      }
      return {} as Session;
    }
  }
}