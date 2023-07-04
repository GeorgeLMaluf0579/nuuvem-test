import OrderForm from './components/OrderForm';
import OrderList from './components/OrderList';

function App() {
  return(
    <>
      <div className="font-sans text-3xl text-blue-700 flex items-center justify-left">
        Nuuvem Test Web 1
      </div>
      <div className="container mx-auto">
        <OrderForm />
        <OrderList />
      </div>
    </>
  )
}

export default App
