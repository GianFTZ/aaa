import { getServerSession } from "next-auth";
import DashboardPage from "./main";
import { authOptions } from "../api/auth/[...nextauth]/auth-options";
import { redirect } from "next/navigation";
import { Session } from "@/models/session";

export default async function Page() {
  const session = await getServerSession(authOptions) as Session | null;
  if (!session) {
    return redirect('/account/login')
  }
  return (
    <DashboardPage session={session} />
  )
}