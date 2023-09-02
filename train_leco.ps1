# LoRA train script by @bdsqlsz
# の改変版(日本語解説付けただけ)

# トレーニングモード(Lora or sdxl_lora)
# XL版を作る場合は sdxl_lora を指定。SD 1.5用は lora 
$train_mode = "sdxl_lora"

# config ファイル
$config_file = "./examples/xl-config.yaml" # config path

# ============= DO NOT MODIFY CONTENTS BELOW =====================
# Activate python venv
.\venv\Scripts\activate

$Env:HF_HOME = "huggingface"

# tritonのエラーを表示しない(windowsにはtriton無いので)
$Env:XFORMERS_FORCE_DISABLE_TRITON = "1"

$ext_args = [System.Collections.ArrayList]::new()
$laungh_script = "train_lora"

if ($train_mode -ilike "sdxl*"){
  $laungh_script = $laungh_script + "_xl"
}

# run train
python "./$laungh_script.py" `
  --config_file=$config_file

Write-Output "Train finished"
Read-Host | Out-Null ;
