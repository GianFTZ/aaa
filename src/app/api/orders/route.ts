import { getServerSession } from "next-auth";
import { authOptions } from "../auth/[...nextauth]/auth-options";
import { NextResponse } from "next/server";
import prismaClient from "@/db/prismaClient";
import { Session } from "@/models/session";

export async function GET() {
  const session = await getServerSession(authOptions) as Session | null;
  if (!session) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const orders = await prismaClient.order.findMany({
    where: {
      businessId: session.user.businessId
    },
    select: {
      id: true,
      amount: true,
      status: true,
      number: true,
      userJid: true,
      paymentType: true,
      createdAt: true,
      items: {
        select: {
          id: true,
          price: true,
          quantity: true,
          details: true
        }
      }
    }
  })
  return NextResponse.json({ orders })
}