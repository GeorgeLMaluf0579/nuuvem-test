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
    <div className="container mx-auto p-4">
      <h1 className="text-2xl mb-4">Orders list</h1>
      <table>
        <thead>
          <tr>
            <th>Id</th>
            <th>Importado em</th>
            <th>Valor Total</th>
          </tr>
        </thead>
        <tbody>
          {orders && orders.map((order:any) => (
            <tr key={order.id}>
              <td>
                {order.id}
              </td>
              <td>
                {format(new Date(order.created_at), 'dd/MM/yyyy hh:mm:ss')}
              </td>
              <td>
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