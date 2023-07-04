import { render, screen, waitFor } from '@testing-library/react';
import OrderList from "../../components/OrderList";

describe('OrderList', () => {
  test('render the table with orders', async () => {
    const mockOrders = [
      {id:2, created_at: new Date('03/07/2023 07:15:41'), value: 101.31},
      {id:1, created_at: new Date('03/07/2023 06:48:18'), value: 99.11},
    ];

    global.fetch = jest.fn(() =>
      Promise.resolve({
        ok: true,
        json: () => Promise.resolve(mockOrders)
      })
    ) as jest.Mock;

    render(<OrderList />);

    await waitFor(() => {
      const order1 = screen.getByText('1')
      const order2 = screen.getByText('2')
      expect(order1).toBeInTheDocument();
      expect(order2).toBeInTheDocument();
    });
  });
});