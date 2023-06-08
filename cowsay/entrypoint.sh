#!/bin/bash

echo "Enter prefered PORT number":
read PORT
echo "your application will now run on PORT:$PORT"
export PORT=$PORT
npm start
