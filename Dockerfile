# Використовуємо офіційний образ Python
FROM python:3.11-slim

# Оптимізація застосунку Python для Docker (запис журналів безпосередньо в stdout та stderr без буферизації в пам'яті процесу застосунку).
ENV PYTHONUNBUFFERED 1

# Встановлюємо робочу директорію всередині контейнера
WORKDIR /app

# Копіюємо файл залежностей з вашої папки src
COPY src/requirements.txt .

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь вміст папки src (код додатка) у робочу директорію контейнера
COPY src/ .

# Відкриваємо порт для Django
EXPOSE 8000

# Команда для запуску. За runserver має йти параметр 0.0.0.0:8000, щоб правильно запустити сервер Django.
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8000
