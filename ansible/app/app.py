from http.server import SimpleHTTPRequestHandler, HTTPServer

PORT = 8000

Handler = SimpleHTTPRequestHandler
httpd = HTTPServer(("", PORT), Handler)

print(f"Server running on port {PORT}")
httpd.serve_forever()
