#!/bin/bash
set -e

# Stop Apache service
systemctl stop httpd

# Disable Apache on boot
systemctl disable httpd

echo "Apache HTTP server stopped and disabled."
