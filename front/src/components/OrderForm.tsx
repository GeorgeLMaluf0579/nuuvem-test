import React, { useState} from 'react';

const OrderForm: React.FC = () => {
  const [selectedFile, setSelectedFile] = useState<File | null>(null);

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    if (event.target.files && event.target.files.length > 0) {
      setSelectedFile(event.target.files[0])
    }
  };

  const handleSubmit = (event: React.FormEvent) => {
    event.preventDefault()

    if (selectedFile) { 
      const formData = new FormData()
      formData.append('file', selectedFile);
      fetch('http://localhost:3000/api/v1/orders', { 
        method: 'POST',
        body: formData,
      })
      .then((response) => {
        if (response.ok) {
          console.log('File uploaded successfully.');
        } else {
          console.error('Error uploading file.');
        }
      })
      .catch((error) => {
        console.error('Error uploading file', error);
      })
    }
  }
  
  return (
    <form className="font-sans mb-6" onSubmit={handleSubmit}>
      <div className="mb-6">
        <label className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">File to import orders:</label>
        <input className="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" type="file" onChange={handleFileChange} />
        <button className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" type="submit">Importar</button>
      </div>
    </form>
  )
}

export default OrderForm;