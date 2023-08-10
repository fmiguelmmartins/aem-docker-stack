if [ $# -ne 2 ]; then
    echo "Missing the artifactory and destination path"
    exit 1
fi

if [ ! -e "$2" ]; then
    echo "Path '$2' does not exist."
    exit 1
fi

# Set the variables for your artifactory instance and repository details
BASE_URL="$CICD_HOST"
REPOSITORY_NAME="aem-raw"
ARTIFACTORY_PATH="$1"
DESTINATION_PATH="$2"

# Get the list of files in the folder
response=$(curl -X GET "${BASE_URL}/service/rest/v1/components?repository=${REPOSITORY_NAME}")

echo "\n**** GET from ${BASE_URL}/service/rest/v1/components?repository=${REPOSITORY_NAME} ****"

# Parse the response and extract file URLs

file_urls=$(echo $response | jq --arg pathVariable "$ARTIFACTORY_PATH" -r '.items[] | select(.group == $pathVariable) | .assets[].downloadUrl')

echo "**** File paths available in ${ARTIFACTORY_PATH} ${file_urls} **** \n"

# Download the files
for url in $file_urls; do
  file_name=$(basename $url)
  curl -L -o ${DESTINATION_PATH}/$file_name $url
done