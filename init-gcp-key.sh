#!/bin/bash

# --- Script to configure Aider for Google Cloud Vertex AI ---
# Usage: ./configure_aider_gcp.sh <path_to_gcp_key.json> [vertex_ai_location]

# --- Configuration ---
DEFAULT_VERTEXAI_LOCATION="us-central1" # Common default, change if needed

# --- Helper Function to parse Project ID from JSON ---
get_project_id_from_json() {
    local json_file="$1"
    if [[ ! -f "$json_file" ]]; then
        echo "Error: JSON key file not found at '$json_file'." >&2
        exit 1
    fi
    # Use jq for robust JSON parsing. If jq is not installed, provide a fallback.
    if command -v jq &> /dev/null; then
        jq -r '.project_id' "$json_file"
    else
        echo "Warning: 'jq' command not found. Attempting basic parsing." >&2
        grep '"project_id":' "$json_file" | sed -E 's/.*"project_id": *"([^"]*)".*/\1/' | head -n 1
        if [[ $? -ne 0 || -z "$(grep '"project_id":' "$json_file" | sed -E 's/.*"project_id": *"([^"]*)".*/\1/' | head -n 1)" ]]; then
            echo "Error: Could not automatically extract project_id. Please ensure jq is installed or the key format is standard." >&2
            exit 1
        fi
    fi
}

# --- Argument Parsing ---
GCP_KEY_PATH="$1"
VERTEXAI_LOCATION="${2:-$DEFAULT_VERTEXAI_LOCATION}" # Use second arg or default

if [[ -z "$GCP_KEY_PATH" ]]; then
    echo "Usage: $0 <path_to_gcp_key.json> [vertex_ai_location]"
    echo "Error: GCP key path is required." >&2
    exit 1
fi

# --- Validate Key Path ---
if [[ ! -f "$GCP_KEY_PATH" ]]; then
    echo "Error: The specified key file '$GCP_KEY_PATH' does not exist." >&2
    exit 1
fi

# --- Extract Project ID from JSON ---
echo "Extracting Project ID from '$GCP_KEY_PATH'..."
GCP_PROJECT_ID=$(get_project_id_from_json "$GCP_KEY_PATH")

if [[ -z "$GCP_PROJECT_ID" ]]; then
    echo "Error: Failed to extract GCP Project ID from the JSON key." >&2
    echo "Please ensure the JSON key is valid and contains a 'project_id' field." >&2
    exit 1
fi
echo "Detected Project ID: $GCP_PROJECT_ID"

# --- Export Environment Variables ---
echo ""
echo "--- Exporting Environment Variables ---"
export GOOGLE_APPLICATION_CREDENTIALS="$GCP_KEY_PATH"
export VERTEXAI_PROJECT="$GCP_PROJECT_ID"
export VERTEXAI_LOCATION="$VERTEXAI_LOCATION"

echo "Successfully exported the following environment variables:"
echo "  GOOGLE_APPLICATION_CREDENTIALS = $GOOGLE_APPLICATION_CREDENTIALS"
echo "  VERTEXAI_PROJECT = $VERTEXAI_PROJECT"
echo "  VERTEXAI_LOCATION = $VERTEXAI_LOCATION"
echo ""
echo "You can now run Aider using a Vertex AI model, for example:"
echo "  aider --model vertex_ai/gemini-1.5-pro"
echo ""
echo "Note: Ensure the Vertex AI API is enabled in your GCP project and the service account has the 'Vertex AI User' role."

exit 0
