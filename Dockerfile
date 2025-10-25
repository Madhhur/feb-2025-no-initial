# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy entire application code
COPY ./my_python_project/ .


# Expose port
EXPOSE 8000

CMD ["python", "src/calculator.py"]

