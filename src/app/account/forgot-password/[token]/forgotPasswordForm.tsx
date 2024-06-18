"use client";

import { Notify } from '@/components/Notify';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import validator from 'validator';
import { updatePassword } from './update';

export default function ForgotPasswordForm({
  userId,
  token
}: {
  userId: string
  token: string
}) {
  const router = useRouter()
  const [password, setPassword] = useState('')
  const [passwordConfirm, setPasswordConfirm] = useState('')

  const [segurityPassword, setSegurityPassword] = useState({
    length: false,
    includesUpperCase: false,
    includesLowerCase: false,
    includesNumber: false,
  });
  const score = validator.isStrongPassword(password, {
    returnScore: true,
    pointsPerUnique: 1,
    pointsPerRepeat: 0.5,
    pointsForContainingLower: 22,
    pointsForContainingUpper: 22,
    pointsForContainingNumber: 22,
    pointsForContainingSymbol: 22
  })

  return (
    <div className='min-h-screen bg-base-200'>
      <div className="flex flex-col items-center justify-center bg-base-200 pt-16 w-full p-6 lg:p-16 md:p-8">
        <h1 className="text-6xl pb-4 font-extrabold max-sm:text-4xl">Esqueci minha senha</h1>
        <p className="text-lg pb-4">
          Por favor, digite sua nova senha.
        </p>
        <div className="flex flex-col w-full md:w-9/12">
          <form className="flex flex-col items-center justify-center p-4 rounded shadow-md">
            <div className="flex flex-col w-full">
              <label htmlFor="password" className="mb-2 text-sm">Nova Senha</label>
              <input
                id="password"
                type="password"
                className="w-full p-2 border border-gray-300 rounded shadow-sm text-black"
                minLength={8}
                onChange={(e) => {
                  setPassword(e.target.value)
                  setSegurityPassword({
                    length: validator.isLength(e.target.value, { min: 8 }),
                    includesUpperCase: e.target.value.match(/[A-Z]/g) ? true : false,
                    includesLowerCase: e.target.value.match(/[a-z]/g) ? true : false,
                    includesNumber: e.target.value.match(/[0-9]/g) ? true : false
                  })
                }} />
            </div>
            <div className="flex flex-col w-full">
              <label htmlFor="passwordConfirm" className="mb-2 text-sm">Confirmar Nova Senha</label>
              <input
                id="passwordConfirm"
                type="password"
                className="w-full p-2  border border-gray-300 rounded shadow-sm text-black"
                onChange={(e) => setPasswordConfirm(e.target.value)} />
            </div>
            <div className='pt-4 self-start pb-4'>
              <h3>
                Força da Senha: <span className="badge badge-primary">{
                  score < 30 ? 'Tá fraco' : score < 60 ? 'Tá ficando bom' : 'Perfeita!'
                }</span>
              </h3>
              <progress className="progress w-full progress-primary" value={score} max="100"></progress>
              <ul className="list-disc list-inside">
                <li className={segurityPassword.length ? 'text-green-500' : 'text-red-500'}>Mínimo de 8 caracteres</li>
                <li className={segurityPassword.includesUpperCase ? 'text-green-500' : 'text-red-500'}>Pelo menos uma letra maiúscula</li>
                <li className={segurityPassword.includesLowerCase ? 'text-green-500' : 'text-red-500'}>Pelo menos uma letra minúscula</li>
                <li className={segurityPassword.includesNumber ? 'text-green-500' : 'text-red-500'}>Pelo menos um número</li>
                <li className={validator.equals(password, passwordConfirm) && password.length != 0 ? 'text-green-500' : 'text-red-500'}>As senhas devem ser iguais</li>
              </ul>
            </div>
            <button
              className="btn btn-primary w-full"
              disabled={
                !validator.equals(password, passwordConfirm) ||
                !segurityPassword.includesUpperCase ||
                !segurityPassword.includesLowerCase ||
                !segurityPassword.includesNumber ||
                !segurityPassword.length ||
                passwordConfirm === ''
              }
              onClick={
                async (e) => {
                  e.preventDefault()
                  const res = await updatePassword(
                    {
                      userId,
                      token,
                      password
                    }
                  )
                  if (res.error) {
                    console.log(res.error)
                    Notify('Ocorrreu um erro ao redefinir sua senha', 'error')
                  } else {
                    Notify('Senha redefinida com sucesso', 'success');
                    router.push('/account/login')
                  }
                }
              }>
              Redefinir Senha
            </button>
          </form>
        </div>
      </div>
    </div>
  )
}
