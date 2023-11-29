@echo off
setlocal

cd /d "C:\stable-diffusion-webui\"
start "" webui-user.bat

cd /d "C:\WeSmile\wesmile-backend"

rem Activate the virtual environment
call .\venv\Scripts\activate

rem Start the FastAPI application using Uvicorn
start "" uvicorn main:app --host 0.0.0.0 --port 8000 --reload

cd /d "C:\WeSmile\wesmilebooth\"
start npm run dev

start "" /max "http://localhost:3000/"

timeout /t 2

endlocal
