#!/bin/bash

file_path=".next_rails_scaffold.json"

if [ ! -e "$file_path" ]; then
  rm -rf src/pages/api src/styles

  echo "Installing dependencies..."
  yarn add @hookform/resolvers @tanstack/react-query axios react-hook-form zod

  mv $file_path.lock $file_path
else
  rm $file_path.*
fi