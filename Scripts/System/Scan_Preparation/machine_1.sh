#!/bin/bash

# Global variables
HTTP_PORT=80
HTTPS_PORT=443

# Function to check for necessary dependencies
check_dependencies() {
    echo "Checking for necessary dependencies..."

    # Check for Python
    if ! command -v python3 &> /dev/null; then
        echo "Python is not installed. Please install Python 3 and try again."
        exit 1
    fi

    # Check for OpenSSL
    if ! command -v openssl &> /dev/null; then
        echo "OpenSSL is not installed. Please install OpenSSL and try again."
        exit 1
    fi

    echo "All necessary dependencies are installed."
}

# Function to setup HTTP/HTTPS server
setup_http_https_server() {
    echo "Setting up HTTP/HTTPS server..."

    # Directory where the server files will be located. This will be the top level directory for the server.
    SERVER_DIR="server_directory"
    mkdir -p "$SERVER_DIR"
    cd "$SERVER_DIR"

    # Create a simple Python script for HTTP/HTTPS server
    create_python_server_script

    # Generate self-signed SSL certificate for HTTPS
    if ! [ -f "server.crt" ] || ! [ -f "server.key" ]; then
        echo "Generating self-signed SSL certificate..."
        openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"
    fi

    echo "HTTP/HTTPS server setup is complete."
    cd ../
    # Consider deleting the server directory after the scan is complete
    # rm -rf "$SERVER_DIR"
}

# Function to create a simple Python HTTP/HTTPS server script
create_python_server_script() {
    # Shorthand for creating a Python script. Deletes the script if it already exists and easy to handle during app file cleanup.
    # Be careful with EOF placement or have a good editor. 
    cat > http_https_server.py << EOF
    import http.server
    import ssl
    import os

    port = int(os.environ.get("HTTP_PORT", 80))
    httpd = http.server.HTTPServer(("", port), http.server.SimpleHTTPRequestHandler)

    https_port = int(os.environ.get("HTTPS_PORT", 443))
    httpd.socket = ssl.wrap_socket(httpd.socket, certfile='./server.crt', keyfile='./server.key', server_side=True)

    print(f"Serving HTTP on port {port} and HTTPS on port {https_port}")
    httpd.serve_forever()

EOF
    # Need to cat some files to current directory which is the server's top level directory while we are here.
    cat > index.html << EOF
    <html>
        <head>
            <title>HTTP/HTTPS Server</title>
        </head>
        <body>
            <h1>HTTP/HTTPS Server</h1>
            <p>This is a simple HTTP/HTTPS server.</p>
        </body>
    </html>
EOF
    cat > robots.txt << EOF
    User-agent: *
    Disallow: /
EOF
}


# Function to configure the network
configure_network() {
    # Network configurations for VM
}

# Function to simulate traffic
simulate_traffic() {
    # Send sample traffic to other machines while waiting for signal from Host computer to start ping flood simulation.
}

# Main function to orchestrate the setup
main() {
    check_dependencies
    setup_http_https_server
    configure_network
    # From here we'll create a listener for a signal from Host computer to start ping flood part of simulation.
    # Constructing a placeholder for now.
    # while ! [ -f "start_ping_flood" ]; do
        simulate_traffic    
    #     sleep 1
    # done
}

# Run the main function
main
