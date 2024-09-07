# Use an official Python runtime as a parent image
FROM --platform=linux/amd64 python:3.9-slim

# Install PostgreSQL development libraries
RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install the correct requirements.txt from book_catalog
RUN pip install --no-cache-dir -r book_catalog/requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Run main.py when the container launches
CMD ["python", "book_catalog/main.py"]