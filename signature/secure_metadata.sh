#!/bin/bash

# Ensure script is run from the correct directory (catalog/signature/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE="$1"
IMAGE_NAME=$(basename "$IMAGE" .png)
IMAGE_DIR="$SCRIPT_DIR/../assets/images"
METADATA_FILE="${IMAGE_DIR}/${IMAGE_NAME}_metadata.txt"
OUTPUT_SIGNED_METADATA="${IMAGE_DIR}/${IMAGE_NAME}_metadata_signed.txt"
OUTPUT_HASH="${IMAGE_DIR}/${IMAGE_NAME}_image_hash.txt"

# Metadata Content
METADATA="Template used: https://knowyourmeme.com/photos/1856499-swole-doge-vs-cheems\n
Author: Alexey Nazarov (linkedin.com/in/alexeinazarov)\n
Author's GitHub: github.com/alexeinazarov\n
Intended use: For a research analytical piece at cyberprivacy.tech, currently hosted at github.com/cyberprivacytech/cyberprivacytech.github.io, also owned by the author.\n
Meme: 'Swole Dog and Cheems : The Startup Cybersecurity Attackers.'\n
Text: Swole Doge - The Confident Attacker: 'No startup has the resources to protect their tech developments. Easy prey.' Cheems - The Reality Check: 'These DEFCON-1 cyber defenses, built even with open-source tools, leave no gap for my piracy or hacking schemes.'\n
License: Creative Commons Attribution-ShareAlike (CC BY-SA)\n
Original Creation Date: 11 August 2024 15:12:00\n
Date Last Modified: 11 August 2024 16:42:00\n
Cryptographic Standards: Metadata signed with GPG (RSA-3072) and SHA-256, compliant with NIST SP 800-131A Rev. 2 and ISO/IEC 9796-2:2022 standards.\n
Legal Framework: This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license. By using or distributing this image, you agree to the terms of this license and acknowledge that any modifications must also be shared under the same license.\n
Applicable Standards and Legal Notices:\n
- NIST SP 800-131A Rev. 2: Transitioning the Use of Cryptographic Algorithms and Key Lengths (March 2019)\n
- NIST FIPS 186-4: Digital Signature Standard (DSS) (July 2013)\n
- ISO/IEC 9796-2:2022: Information security — Digital signature schemes giving message recovery — Part 2: Integer factorization-based mechanisms.\n
- Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license.\n
- This image's metadata is protected under these standards, ensuring compliance with international legal and cryptographic frameworks."

# Write Metadata to File
echo -e "$METADATA" > "$METADATA_FILE"

# Sign the Metadata File with GPG
gpg --clearsign --default-key BB06DA5139E547C7DBBC709CE9C8246398E9BAC9 --output "$OUTPUT_SIGNED_METADATA" "$METADATA_FILE"

# Read the signed metadata content
SIGNED_CONTENT=$(cat "$OUTPUT_SIGNED_METADATA")

# Attach the signed metadata content directly to the image
exiftool -Comment="$SIGNED_CONTENT" "${IMAGE_DIR}/${IMAGE_NAME}.png"

# Generate a SHA-256 Hash of the Final Image
sha256sum "${IMAGE_DIR}/${IMAGE_NAME}.png" > "$OUTPUT_HASH"

# Clean up original metadata file (optional)
if [ -f "$METADATA_FILE" ]; then
    rm "$METADATA_FILE"
fi

echo "Metadata signed, attached to ${IMAGE_DIR}/${IMAGE_NAME}.png, and SHA-256 hash generated."

