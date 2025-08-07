#!/bin/bash
set -e

# Start Apache service
systemctl start httpd

# Enable Apache to start on boot
systemctl enable httpd

echo "Apache HTTP server started and enabled."
