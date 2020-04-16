#!/bin/bash
mkcert -cert-file cert.pem -key-file cert-key.pem development.local "*.development.local" development.test "*.development.test" development.app "*.development.app" localhost 127.0.0.1 ::1
cat cert-key.pem >> cert.pem
