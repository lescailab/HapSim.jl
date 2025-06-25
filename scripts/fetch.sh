
#!/bin/bash
set -x
# Downloads reference datasets and external maps
echo "=== Fetching data ==="
DATA_DIR=$1
CURR_DIR=`pwd`
### Fetch raw data
# ./preprocessing/data_download.sh data/inputs/raw


### Fetch preprocessed data from CSC bucket
URL_DATA_BUCKET="https://a3s.fi/swift/v1/AUTH_c520b8e7583e49069dbfb13cf078c683/INTERVENE_WP3_reference_datasets_public_v2"

cd $DATA_DIR
curl -sfL -o $DATA_DIR/preprocessed.txt $URL_DATA_BUCKET

#Clean URL
# FIXED_URL=${URL_DATA_BUCKET//\//\\/}
# sed -i -e 's/^/'"${FIXED_URL}"'/' preprocessed.txt

# Download preprocessed files
# head -n 6 preprocessed.txt > files.txt
# rm preprocessed.txt
# mv files.txt preprocessed.txt

# xargs -n 1 curl -vO < preprocessed.txt
PROC_DIR=$DATA_DIR/inputs/processed/1KG+HGDP
mkdir -p $PROC_DIR
cd $PROC_DIR
while IFS= read -r fileurl
do
  echo ""
  echo "==> Downloading ${fileurl##*\/}"
  curl -O "${URL_DATA_BUCKET}${fileurl}"
done < $DATA_DIR/preprocessed.txt

# unzip the large files
echo "Unzipping large files"
for chr in {1..22}
do 
  gunzip "1KG+HGDP.chr${chr}.hapmap.final.recode.vcf"
  gunzip "1KG+HGDP.chr${chr}.hapmap.h1"
  gunzip "1KG+HGDP.chr${chr}.hapmap.h2"
done

echo "Fetching of preprocessed data completed."

cd $CURR_DIR
