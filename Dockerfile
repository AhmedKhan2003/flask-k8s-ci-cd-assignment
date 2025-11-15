# Stage 1: Build dependencies
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install --prefix=/install -r requirements.txt

# Stage 2: Final image
FROM python:3.11-slim

# Fix Python module path
ENV PYTHONPATH=/install/lib/python3.11/site-packages
ENV PATH=/install/bin:$PATH

WORKDIR /app

# Copy dependencies from builder
COPY --from=builder /install /install

# Copy app code
COPY . /app

EXPOSE 5000

CMD ["python", "app.py"]