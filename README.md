# Nuuvem Test Web 1
This solutions is a suggestion to solve from Nuuvem Inc. [code challenge](./CHALLENGE.md)

The solution is splited into two parts:
* Backend
* Frontend 

Both are in respective docker containers and work together as one.

## 🧪 Technologies
This solution was developed using the following technologies:
- [Docker](https://www.docker.com)
- [Ruby](https://www.ruby-lang.org/)
- [Rails](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org)
- [Vite](https://vitejs.dev/)
- [React](https://react.dev/)
- [RSpec](https://rspec.info)

## 📦 Setup
### 1. Extract the content of the zip file or clone the repo from Github:
  ```bash
  $ git clone https://github.com/GeorgeLMaluf0579/nuuvem-test.git && cd nuuvem-test
  ```
### 2. Build the docker images
  ```bash
  $ make docker-build
  ```
  This process will take some time, it depends of your internet connection and speed of your CPU.

### 3. Setup the project database
  After build the docker images, you need setup the project database. To do that, follow the command:
  ```bash
  $ make docker-setupdb
  ```
## 🏎 How to execute
  After execute all procedures from Setup section, you can execute the project using the line bellow:
  ```bash
  $ make docker-run
  ```
  Open your favorite browser and access the following url:
  ```
  http://localhost:3001
  ```
  You can use the sample file (example_input.tab) on project root folder to test the import process

## 🤖 Automated Testing and Code coverage
To execute backend test suite:
```
$ make docker-back-tests
```
To execute frontend test suite:
```
$ make docker-front-tests
```
To execute both test suites:
```
$ make docker-all-tests
```

After the exection of test suite, a subfolder called coverage will be created or update inside of each project.

## 👨🏻‍💻 Autor
Made by George L. 'Maverick' Maluf
- [Linkedin](https://www.linkedin.com/in/👨🏻%E2%80%8D💻-george-l-maluf-24225733/)
- [Email](mailto:georgelmaluf286@gmail.com)