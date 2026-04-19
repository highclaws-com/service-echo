# Echo Server

A simple Node.js (Express) server that echoes back HTTP request details.

It responds to all requests on port `8080` with the server startup command, request method and URL, raw HTTP headers, and the request body. Useful for testing, debugging, or inspecting HTTP requests.

## Usage

### Using Node.js

```bash
npm install
npm start
```

### Using Docker

```bash
docker build -t echo .
docker run -p 8080:8080 echo
```

Once running, send a request to `http://localhost:8080/` to see the echoed details.
