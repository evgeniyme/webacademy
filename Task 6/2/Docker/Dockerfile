# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY print_time_date.py /app

# Run the application
CMD ["python3", "print_time_date.py"]