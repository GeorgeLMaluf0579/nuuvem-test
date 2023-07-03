import React, { useEffect, useState } from 'react';

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
      <ul>
        { orders && orders.map((order: any) => (
          <li key={order.id} className="border-b py-2">
            {order.created_at}
          </li>
        ))}
      </ul>
    </div>
  )
}

export default OrderList;