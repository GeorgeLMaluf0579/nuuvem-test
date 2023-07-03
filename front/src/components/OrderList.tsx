import React, { useEffect, useState } from 'react';
import { format } from 'date-fns';

const OrderList: React.FC = () => {
  const [orders, setOrders] = useState([]);

  async function fetchOrderAPI() {
    try {
      const response = await fetch('http://localhost:3000/api/v1/orders')
      const data = await response.json()
      if(data) { setOrders(data) }
    } catch (error) {
      console.error(error);      
    }
  }

  useEffect(() => {
    fetchOrderAPI()
  }, []);

  return (
    <div className="font-sans container mx-auto p-4">
      <h1 className="text-2xl mb-4">Orders list</h1>
      <table className="table-auto border-spacing-2">
        <thead>
          <tr>
            <th className="text-left border border-slate-300">Id</th>
            <th className="text-center border border-slate-300">Importado em</th>
            <th className="text-center border border-slate-300">Valor Total</th>
          </tr>
        </thead>
        <tbody>
          {orders && orders.map((order:any) => (
            <tr key={order.id}>
              <td className="text-left border border-slate-300">
                {order.id}
              </td>
              <td className="text-center border border-slate-300">
                {format(new Date(order.created_at), 'dd/MM/yyyy hh:mm:ss')}
              </td>
              <td className="text-center border border-slate-300">
                {order.value}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default OrderList;