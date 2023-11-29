#!/bin/bash

file_path=".next_rails_scaffold.json"

if [ ! -e "$file_path" ]; then
  rm -rf src/pages/api src/styles

  echo "Installing dependencies..."
  yarn add @hookform/resolvers @tanstack/react-query @tanstack/react-query-devtools axios react-hook-form zod
  yarn add --dev @tanstack/react-query-devtools

  mv $file_path.lock $file_path
else
  rm $file_path.*
fi
