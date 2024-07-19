#!/bin/bash

# Define the stack names in the order you want to destroy them
STACKS=("first_stack" "second_stack")

# Loop through each stack and delete the resources
for STACK in "${STACKS[@]}"; 
do
  echo "Destroying resources in $STACK..."
  terraform destroy -target=spacelift_stack.$STACK -auto-approve
  
  # Check if the previous command was successful
  if [ $? -eq 0 ]; then
    echo "Resources in $STACK destroyed successfully."
  else
    echo "Failed to destroy resources in $STACK. Exiting script."
    exit 1
  fi
done