"use client";

import React, { Component, ReactElement, useEffect, useState } from 'react';
import { Socket, io } from 'socket.io-client';
import { Order, OrderStatus } from '@prisma/client';
import Board from '@/board';
import { Session } from '@/models/session';

const NEXT_PUBLIC_WS_URL = process.env.NEXT_PUBLIC_WS_URL || 'ws://localhost:8080';

export default function DashboardPage({
  session
}: {
  session: Session
}){
  const [pendingOrders, setPendingOrders] = useState<Order[]>([]); // PENDING
  const [inProgressOrders, setInProgressOrders] = useState<Order[]>([]); // PREPARING
  const [completedOrders, setCompletedOrders] = useState<Order[]>([]); // DONE
  const [canceledOrders, setCanceledOrders] = useState<Order[]>([]); // CANCELED

  const [socket, setSocket] = useState<Socket>();
  useEffect(() => {
    (async () => {
      const response = await fetch('/api/orders')
      const data = await response.json()
      setPendingOrders(data.pendingOrders)
      setInProgressOrders(data.inProgressOrders)
      setCompletedOrders(data.completedOrders)
      setCanceledOrders(data.canceledOrders)
    })()
  }, []);
  useEffect(() => {
    if (session?.user?.id) {
      const socket = io(NEXT_PUBLIC_WS_URL, {
        reconnection: true,
        reconnectionAttempts: 3,
        reconnectionDelay: 1000,
        reconnectionDelayMax: 5000,
        autoConnect: true,
        transports: ['websocket']
      });
      socket.on('connect', () => {
        console.log('connected');
        socket.emit('join', {
          userId: session.user.id
        });
      })
      socket.on('new.order', (order: Order) => {
        setPendingOrders([...pendingOrders, order]) 
      })
      socket.on('order.updated', ({ orderId, status, actionById }: {
        orderId: string,
        status: OrderStatus,
        actionById: string
      }) => {
        if (actionById === session.user.id) {
          return
        }
        const pendingOrderIndex = pendingOrders.findIndex(order => order.id === orderId)
        const inProgressOrderIndex = inProgressOrders.findIndex(order => order.id === orderId)
        const completedOrderIndex = completedOrders.findIndex(order => order.id === orderId)
        const canceledOrderIndex = canceledOrders.findIndex(order => order.id === orderId)

        // if status is same, do nothing (order already updated)
        if (pendingOrderIndex !== -1 && pendingOrders[pendingOrderIndex].status === status) {
          return
        } else if (inProgressOrderIndex !== -1 && inProgressOrders[inProgressOrderIndex].status === status) {
          return
        } else if (completedOrderIndex !== -1 && completedOrders[completedOrderIndex].status === status) {
          return
        } else if (canceledOrderIndex !== -1 && canceledOrders[canceledOrderIndex].status === status) {
          return
        }

        const order = {
          index: pendingOrderIndex !== -1 ? pendingOrderIndex : inProgressOrderIndex !== -1 ? inProgressOrderIndex : completedOrderIndex !== -1 ? completedOrderIndex : canceledOrderIndex,
          local: pendingOrderIndex !== -1 ? pendingOrders : inProgressOrderIndex !== -1 ? inProgressOrders : completedOrderIndex !== -1 ? completedOrders : canceledOrders
        }

        if (order.index === -1) {
          return
        }

        const updatedOrder: Order = {
          ...order.local[order.index],
          status
        }

        if (status === 'PENDING') {
          setPendingOrders([...pendingOrders, updatedOrder])
        } else if (status === 'PREPARING') {
          setInProgressOrders([...inProgressOrders, updatedOrder])
        } else if (status === 'DONE') {
          setCompletedOrders([...completedOrders, updatedOrder])
        } else if (status === 'CANCELED') {
          setCanceledOrders([...canceledOrders, updatedOrder])
        }

        if (order.local === pendingOrders) {
          setPendingOrders(pendingOrders.filter(order => order.id !== orderId))
        } else if (order.local === inProgressOrders) {
          setInProgressOrders(inProgressOrders.filter(order => order.id !== orderId))
        } else if (order.local === completedOrders) {
          setCompletedOrders(completedOrders.filter(order => order.id !== orderId))
        } else if (order.local === canceledOrders) {
          setCanceledOrders(canceledOrders.filter(order => order.id !== orderId))
        }
      })
      setSocket(socket);
      return () => {
        socket.disconnect();
      };
    }
  }, [session?.user?.id]);

  return (
    <Board initial={authorQuoteMap} />
  );
}