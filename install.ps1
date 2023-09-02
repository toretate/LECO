$Env:HF_HOME = "huggingface"

if (!(Test-Path -Path "venv")) {
    Write-Output  "Creating venv for python..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "Installing deps..."
pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118
pip install --upgrade -I --no-deps xformers==0.0.20
pip install --upgrade -r requirements.txt
pip install --upgrade pytorch_lightning
pip install bitsandbytes==0.41.1 --no-deps --prefer-binary --extra-index-url=https://jllllll.github.io/bitsandbytes-windows-webui --force

Write-Output "Installing bitsandbytes for windows..."
cp .\bitsandbytes_windows\*.dll .\venv\Lib\site-packages\bitsandbytes\
cp .\bitsandbytes_windows\main.py .\venv\Lib\site-packages\bitsandbytes\cuda_setup\main.py

Write-Output "Install completed"
Read-Host | Out-Null ;