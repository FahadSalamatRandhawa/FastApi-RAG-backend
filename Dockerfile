# Use a minimal Python runtime as a parent image
FROM python:3.11.8-alpine

# Set the working directory in the container to /app
WORKDIR /fastapi_rag

# Add the current directory contents into the container at /app
ADD . /fastapi_rag

# Set environment variables


# Install Poetry
RUN pip install poetry
# Install project dependencies
RUN poetry install

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the application when the container launches
CMD ["poetry", "run", "uvicorn", "fastapi_rag.main:app", "--host", "0.0.0.0", "--reload"]
