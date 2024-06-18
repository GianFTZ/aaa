export interface User {
  id: string
  email: string
  name: string
  image: string | null
  businessId: string
}

export interface Session {
  user: User
  expires: string
}
