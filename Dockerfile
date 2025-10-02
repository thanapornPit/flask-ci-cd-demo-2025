FROM python:3.12-slim

# ติดตั้ง dependencies ที่จำเป็น
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# ติดตั้ง dependencies ก่อน (layer แยก จะได้ cache ดี)
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอก source code
COPY backend/ /app/

EXPOSE 5000

CMD ["python", "app.py"]
