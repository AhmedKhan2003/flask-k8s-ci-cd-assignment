# Stage 1: Build dependencies
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

# Install packages into a custom install directory
RUN pip install --upgrade pip \
    && pip install --prefix=/install -r requirements.txt

# Stage 2: Final image
FROM python:3.11-slim

# Add installed packages to Python path
ENV PYTHONPATH=/install/lib/python3.11/site-packages
ENV PATH=/install/bin:$PATH

WORKDIR /app

# Copy installed dependencies from builder stage
COPY --from=builder /install /install

# Copy application code
COPY . /app

EXPOSE 5000

CMD ["python",]()
