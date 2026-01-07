FROM python:3.9-slim

WORKDIR /app

# 安装依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# 复制应用代码
COPY app.py .
COPY templates/ templates/
COPY default/ default/
COPY Introduction.md .

# 暴露端口
EXPOSE 5000

# 使用 gunicorn 作为生产服务器
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--timeout", "120", "app:app"]
