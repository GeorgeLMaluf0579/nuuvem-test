import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import OrderForm from "../../components/OrderForm";

describe('OrderForm', () => {
  test('should submit file the api endpoint', async () => {
    const mockFetch = jest.fn(() =>
      Promise.resolve({
        ok: true,
      }) 
    ) as jest.Mock;

    global.fetch = mockFetch;
    
    render(<OrderForm />);

    const fileInput = screen.getByTestId('upInput');
    const file = new File(['file-content'], 'file.txt', { type: 'text/plain' });
    fireEvent.change(fileInput, { target: {files: [file] } });

    const submitButton = screen.getByTestId('btSubmit');
    fireEvent.click(submitButton)

    await waitFor(() => expect(mockFetch).toHaveBeenCalledTimes(1));

    expect(mockFetch).toHaveBeenCalledWith(
      'http://localhost:3000/api/v1/orders',
      expect.objectContaining({
        method: 'POST',
        body: expect.any(FormData),
      })
    );
  });
});