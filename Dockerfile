FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt

# Final stage
FROM python:3.11-slim
ENV PATH=/install/bin:$PATH
WORKDIR /app
COPY --from=builder /install /install
COPY . /app
EXPOSE 5000
CMD ["python", "app.py"]
