
@REM After activating .venv

python -m ensurepip --upgrade

python -m pip install --upgrade pip

python -m pip install -r requirements.txt --use-pep517
